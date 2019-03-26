library(nspmix)


### Name: nppois
### Title: Class 'nppois'
### Aliases: nppois rnppois plot.nppois
### Keywords: class function

### ** Examples

mix = disc(pt=c(1,4), pr=c(0.3,0.7))
x = rnppois(200, mix$pt, mix$pr)
plot(x, mix)




