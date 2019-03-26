library(Unicode)


### Encoding: UTF-8

### Name: casefuns
### Title: Unicode Case Conversions
### Aliases: u_to_lower_case u_to_upper_case u_to_title_case u_case_fold

### ** Examples

## Latin upper case letters A to Z:
x <- as.u_char(as.u_char_range("0041..005A"))
## In case we did not know the code points, we could use e.g.
x <- as.u_char(utf8ToInt(paste(LETTERS, collapse = "")))
sapply(x, intToUtf8)
## Unicode character method:
sapply(u_to_lower_case(x), intToUtf8)
## Default method:
u_to_lower_case(LETTERS)

u_case_fold("Hi Dave.")

## More interesting stuff: sharp s.
u_to_upper_case("heiß")
## Note that the default full upper case mapping of U+00DF (LATIN SMALL
## LETTER SHARP S) is *not* to U+1E9E (LATIN CAPITAL LETTER SHARP S).
u_case_fold("heiß")



