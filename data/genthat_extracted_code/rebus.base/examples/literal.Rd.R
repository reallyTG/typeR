library(rebus.base)


### Name: literal
### Title: Treat part of a regular expression literally
### Aliases: literal

### ** Examples

(rx <- digit(1, 3))
(rx_literal <- literal(rx))

# Usage
stringi::stri_detect_regex("123", rx)
stringi::stri_detect_regex("123", rx_literal)
stringi::stri_detect_regex("[[:digit:]]{1,3}", rx_literal)



