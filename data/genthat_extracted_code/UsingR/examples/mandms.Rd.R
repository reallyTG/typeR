library(UsingR)


### Name: mandms
### Title: Proportions of colors in various M and M's varieties
### Aliases: mandms
### Keywords: datasets

### ** Examples

data(mandms)
bagfull = c(15,34,7,19,29,24)
names(bagfull) = c("blue","brown","green","orange","red","yellow")
prop = function(x) x/sum(x)
chisq.test(bagfull,p = prop(mandms["milk chocolate",]))
chisq.test(bagfull,p = prop(mandms["Peanut",]))



