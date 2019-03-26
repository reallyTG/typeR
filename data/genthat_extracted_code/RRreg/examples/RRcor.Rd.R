library(RRreg)


### Name: RRcor
### Title: Bivariate correlations including randomized response variables
### Aliases: RRcor

### ** Examples

# generate first RR variable
n <-1000
p1 <- c(.3,.7)
gData <- RRgen(n,pi=.3,model="Kuk",p1)

# generate second RR variable
p2 <- c(.8,.5)
t2 <- rbinom(n=n, size=1, prob=(gData$true+1)/2)
temp <- RRgen(model="UQTknown",p=p2, trueState=t2)
gData$UQTresp <- temp$response
gData$UQTtrue <- temp$true

# generate continuous covariate
gData$cov <- rnorm(n,0,4) + gData$UQTtrue + gData$true

# estimate correlations using directly measured / RR variables
cor(gData[,c("true","cov","UQTtrue")])
RRcor(x=gData[,c("response","cov","UQTresp")],
      models=c("Kuk","d","UQTknown"),p.list= list(p1,p2) )



