library(baytrends)


### Name: convert2qw
### Title: Water-Quality Data
### Aliases: convert2qw
### Keywords: IO datasets internal

### ** Examples

# Make a dummy partial dataset
tmp.dum <- data.frame(sta=c("A", "B"),
 Val=c(1, 1.2),
 Val.rmk=c("<", ""),
 Val.dl=c(1, 1), stringsAsFactors=FALSE)
convert2qw(tmp.dum, scheme="partial")




