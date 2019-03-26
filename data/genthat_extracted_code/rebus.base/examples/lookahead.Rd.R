library(rebus.base)


### Name: lookahead
### Title: Lookaround
### Aliases: lookahead negative_lookahead lookbehind negative_lookbehind

### ** Examples

x <- "foo"
lookahead(x)
negative_lookahead(x)
lookbehind(x)
negative_lookbehind(x)

# Usage
x <- c("mozambique", "qatar", "iraq")
# q followed by a character that isn't u
(rx_neg_class <- "q" %R% negated_char_class("u"))
# q not followed by a u
(rx_neg_lookahead <- "q" %R% negative_lookahead("u"))
stringi::stri_detect_regex(x, rx_neg_class)
stringi::stri_detect_regex(x, rx_neg_lookahead)
stringi::stri_extract_first_regex(x, rx_neg_class)
stringi::stri_extract_first_regex(x, rx_neg_lookahead)

# PRCE engine doesn't support lookbehind
x2 <- c("queen", "vacuum")
(rx_lookbehind <- lookbehind("q")) %R% "u"
stringi::stri_detect_regex(x2, rx_lookbehind)
try(grepl(rx_lookbehind, x2))
grepl(rx_lookbehind, x2, perl = TRUE)



