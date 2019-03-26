library(table1)


### Name: signif_pad
### Title: Round numbers to specified significant digits with 0-padding.
### Aliases: signif_pad
### Keywords: utilities

### ** Examples

x <- c(0.9001, 12345, 1.2, 1., 0.1)
signif_pad(x, digits=3)
signif_pad(x, digits=3, round.integers=TRUE)

# Compare:
as.character(signif(x, digits=3))
format(x, digits=3, nsmall=3)
prettyNum(x, digits=3, drop0trailing=TRUE)
prettyNum(x, digits=3, drop0trailing=FALSE)

# This is very close.
formatC(x, format="fg", flag="#", digits=3) 
formatC(signif(x, 3), format="fg", flag="#", digits=3)

# Could always remove the trailing "."
sub("[.]$", "", formatC(x, format="fg", flag="#", digits=3))




