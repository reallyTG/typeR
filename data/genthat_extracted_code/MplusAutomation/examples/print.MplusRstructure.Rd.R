library(MplusAutomation)


### Name: print.MplusRstructure
### Title: Print an Mplus Residual Structure object
### Aliases: print.MplusRstructure
### Keywords: interface

### ** Examples

# default 'show' uses printing
mplusRcov(c("a", "b", "c"), type = "ar")

# also if calling print explicitly
print(mplusRcov(c("a", "b", "c"), type = "ar"))

# to see all aspects of the raw/original object
str(mplusRcov(c("a", "b", "c"), type = "ar"))



