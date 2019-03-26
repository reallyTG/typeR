library(splancs)


### Name: khat
### Title: K-function
### Aliases: khat print.khat plot.khat
### Keywords: spatial

### ** Examples

data(cardiff)
s <- seq(2,30,2)
plot(s, sqrt(khat(as.points(cardiff), cardiff$poly, s)/pi) - s,
 type="l", xlab="Splancs - polygon boundary", ylab="Estimated L",
 ylim=c(-1,1.5))
newstyle <- khat(as.points(cardiff), cardiff$poly, s, newstyle=TRUE)
str(newstyle)
newstyle
apply(newstyle$khats, 2, sum)
plot(newstyle)



