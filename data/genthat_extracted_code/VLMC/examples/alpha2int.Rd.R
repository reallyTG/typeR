library(VLMC)


### Name: alpha2int
### Title: 'Single Character' <-> Integer Conversion for Discrete Data
### Aliases: alpha2int int2alpha
### Keywords: character utilities

### ** Examples

alphabet <- "abcdefghijk"
(ch <- sample(letters[1:10], 30, replace = TRUE))
(ic <- alpha2int(ch, alphabet))
stopifnot(int2alpha(ic, alphabet) == ch)



