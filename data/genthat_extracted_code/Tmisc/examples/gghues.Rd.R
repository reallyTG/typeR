library(Tmisc)


### Name: gghues
### Title: Emulate ggplot2 default hues
### Aliases: gghues
### Keywords: keywords

### ** Examples

n <- 10
gghues(3)
barplot(rep(1,n), col=gghues(n), names=gghues(n))
barplot(rep(1,n), col=gghues(n, start=15+180), names=gghues(n, start=15+180))




