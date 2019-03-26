library(truncSP)


### Name: stls.fit
### Title: Function for fitting STLS
### Aliases: stls.fit
### Keywords: regression

### ** Examples

require(utils)
##Model frame
n <- 10000
x <- rnorm(n,0,2)
y <- 2+x+4*rnorm(n)
d <- data.frame(y=y, x=x)
dl0 <- subset(d, y>0)
mf <- model.frame(y~x, data=dl0)


##Starting values
lmmod <- lm(data=mf)
bet <- lmmod$coef
bet <- matrix(bet)

str(stls. <- stls.fit(y~x,mf,point=0,direction="left",bet))



