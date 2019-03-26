library(rebus.base)


### Name: SpecialCharacters
### Title: Special characters
### Aliases: SpecialCharacters BACKSLASH CARET DOLLAR DOT PIPE QUESTION
###   STAR PLUS OPEN_PAREN CLOSE_PAREN OPEN_BRACKET CLOSE_BRACKET
###   OPEN_BRACE
### Keywords: datasets

### ** Examples

BACKSLASH
CARET
DOLLAR
DOT
PIPE
QUESTION
STAR
PLUS
OPEN_PAREN
CLOSE_PAREN
OPEN_BRACKET
CLOSE_BRACKET
OPEN_BRACE

# Usage
x <- "\\^$."
rx <- BACKSLASH %R% CARET %R% DOLLAR %R% DOT
stringi::stri_detect_regex(x, rx)
# No escapes - these chars have special meaning inside regex
stringi::stri_detect_regex(x, x)

# Usually closing brackets can be matched without escaping
stringi::stri_detect_regex("]", "]")
# If you want to match a closing bracket inside a character class
# the closing bracket must be placed first
(rx <- char_class("]a"))
stringi::stri_detect_regex("]", rx)
# ICU and Perl also allows you to place the closing bracket in
# other positions if you escape it
(rx <- char_class("a", CLOSE_BRACKET))
stringi::stri_detect_regex("]", rx)
grepl(rx, "]", perl = TRUE)
# PCRE does not allow this
grepl(rx, "]")



