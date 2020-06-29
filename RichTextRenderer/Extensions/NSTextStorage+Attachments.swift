// RichTextRenderer

import UIKit

extension NSTextStorage {
    func findAttachments(
        forAttribute attribute: NSAttributedString.Key
    ) -> [Attachment] {
        var ranges = [Attachment]()

        let fullRange = NSRange(location: 0, length: self.length)
        enumerateAttribute(attribute, in: fullRange) { value, range, _ in
            if let view = value as? View {
                ranges.append(.init(view: view, range: range))
            }
        }
        return ranges
    }
}