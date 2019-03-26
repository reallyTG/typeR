library(agridat)


### Name: stickler.sorghum.uniformity
### Title: Uniformity trial of sorghum
### Aliases: stickler.sorghum.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(stickler.sorghum.uniformity)
##D   dat <- stickler.sorghum.uniformity
##D   
##D   dat1 <- subset(dat, expt=="E1")
##D   dat2 <- subset(dat, expt!="E1")
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row|expt, data=dat,
##D           subset=expt=="E1",
##D           #cex=1,text=yield, shorten="none",
##D           xlab="row",ylab="range",
##D           flip=TRUE, tick=TRUE, aspect=(20*10)/(20*14/12), # true aspect
##D           main="stickler.sorghum.uniformity: expt E1")
##D 
##D   desplot(yield ~ col*row|expt, data=dat,
##D           subset=expt!="E1",
##D           xlab="row",ylab="range",
##D           flip=TRUE, tick=TRUE, aspect=(20*5)/(20*44/12), # true aspect
##D           main="stickler.sorghum.uniformity: expt E2,E3,E4")
##D 
##D   # Stickler, p. 10-11 has
##D   #    E1    E2    E3    E4
##D   # 34.81 11.53 11.97 14.10 
##D   cv <- function(x) 100*sd(x)/mean(x)
##D   tapply(dat$yield, dat$expt, cv)
##D   # 35.74653 11.55062 11.97011 14.11389
##D   
## End(Not run)



