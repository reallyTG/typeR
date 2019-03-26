library(surveillance)


### Name: tidy.sts
### Title: Convert an '"sts"' Object to a Data Frame in Long (Tidy) Format
### Aliases: tidy.sts
### Keywords: manip

### ** Examples

data("momo")
momodat <- tidy.sts(momo)
head(momodat)

## tidy.sts(stsObj) is the same as as.data.frame(stsObj, tidy = TRUE)
stopifnot(identical(as.data.frame(momo, tidy = TRUE), momodat))



