library(FSAdata)


### Name: AlewifeLH
### Title: Ages of Lake Huron Alewife assigned from otoliths and scales.
### Aliases: AlewifeLH
### Keywords: datasets

### ** Examples

data(AlewifeLH)
str(AlewifeLH)
head(AlewifeLH)
plot(scales~otoliths,data=AlewifeLH)
xtabs(~otoliths+scales,data=AlewifeLH)




