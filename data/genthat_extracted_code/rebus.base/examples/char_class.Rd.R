library(rebus.base)


### Name: char_class
### Title: A range or char_class of characters
### Aliases: char_class negated_char_class negate_and_group

### ** Examples

char_class(LOWER, "._")
negated_char_class(LOWER, "._")

# Usage
x <- (1:10) ^ 2
(rx_odd <- char_class(1, 3, 5, 7, 9))
(rx_not_odd <- negated_char_class(1, 3, 5, 7, 9))
stringi::stri_detect_regex(x, rx_odd)
stringi::stri_detect_regex(x, rx_not_odd)



