library(lmfor)


### Name: linesplot
### Title: A spaghetti plot of grouped data
### Aliases: linesplot
### Keywords: graphs

### ** Examples

D<-rep(seq(10,30),10)
H<-(20+rep(rnorm(10,0,0.5),each=21))*exp(-1.5*D^(-1.3))
plot<-rep(1:10,each=21)
linesplot(D,H,plot)



