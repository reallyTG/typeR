library(Unicode)


### Name: u_char_basics
### Title: Unicode Character Objects
### Aliases: as.u_char as.u_char_range as.u_char_seq u_char u_char_range
###   u_char_seq

### ** Examples

x <- as.u_char_range(c("00AA..00AC", "01CC"))
x
## Corresponding Unicode character sequence object:
as.u_char_seq(x)
## Corresponding Unicode character object with all code points:
as.u_char(x)
## Inspect all Unicode characters in the range:
u_char_inspect(x)

## Turning R character strings into the respective Unicode character
## sequences:
as.u_char_seq(c("Austria", "Trantor"), "")
## which can then be subscripted "as usual", e.g.:
x <- as.u_char_seq(c("Austria", "Trantor"), "")[[1L]][c(3L, 5L)]
x
## To reassemble the character strings:
intToUtf8(x)



