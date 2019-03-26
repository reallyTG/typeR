library(baytrends)


### Name: convertFqw
### Title: Water-Quality Data
### Aliases: convertFqw
### Keywords: IO datasets internal

### ** Examples

# Make a dummy partial dataset
tmp.dum <- data.frame(sta=c("A", "B"),
 Val=c(1, 1.2),
 Val.rmk=c("<", ""),
 Val.dl=c(1, 1), stringsAsFactors=FALSE)
tmp.qw <- convert2qw(tmp.dum, scheme="partial")
# Expand the result
convertFqw(tmp.qw)



