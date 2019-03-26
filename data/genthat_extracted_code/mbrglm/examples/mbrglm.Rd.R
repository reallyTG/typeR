library(mbrglm)


### Name: mbrglm
### Title: Median Bias Reduction in Binomial-Response GLMs
### Aliases: mbrglm mbrglm.fit print.mbrglm summary.mbrglm
###   print.summary.mbrglm
### Keywords: models regression iteration

### ** Examples

 ## First example
library(brglm)     
data(endo)
# Fit the GLM using maximum likelihood
endo.glm <- glm(HG~NV+PI+EH,family=binomial,data=endo)
## Mean bias-reduced fit
endo.brglm<-brglm(HG~NV+PI+EH,family=binomial,data=endo)
## Median bias-reduced fit
endo.mbrglm<-mbrglm(HG~NV+PI+EH,family=binomial,data=endo)
endo.glm
endo.brglm
endo.mbrglm

# Now other links
update(endo.mbrglm, family = binomial(probit))
update(endo.mbrglm, family = binomial(cloglog))

##------------------------
## paper by Andrey Gelman et al. 2008. Annals of applied Statistics.
## application to binomial
## example 4.2
##----------------------

# first way

x<-c(-0.86,-0.30,-0.05,0.73)
z.x<- (1/sqrt(4))*(x-mean(x))/sqrt(var(x))
weights<-rep(5,4)
z<-c(0,1,3,5)
y=z/weights
fit.glm<-glm(y~z.x,family=binomial,weights=weights)
fit.brglm<-brglm(y~z.x,family=binomial,weights=weights)
fit.mbrglm<-mbrglm(y~z.x,family=binomial,weights=weights)
fit.glm
fit.brglm
fit.mbrglm

# in alternative
fit.glm<-glm(cbind(z,weights-z)~z.x,family=binomial)
fit.brglm<-brglm(cbind(z,weights-z)~z.x,family=binomial)
fit.mbrglm<-mbrglm(cbind(z,weights-z)~z.x,family=binomial)
fit.glm
fit.brglm
fit.mbrglm

##----------------------------------------
# Rasch model: 100 subjects and 5 items
##----------------------------------------

I <- 5
S <-  100

## function to generate data
gendata.M <- function(gamma, alpha, beta)
{
  I <- length(alpha) 
  S <- length(gamma) 
  data.y <- matrix(0, nrow=S, ncol=I)
  for(i in 1:I)
  {
    mui <- plogis(alpha[i] + gamma * beta[i])
    data.y[,i] <- rbinom(S, size=1, prob=mui)
  }
  return(data.y)      
}

alphas <- c(0.0,  0.7,  1.6,  0.6, -0.5)
betas <- rep(1,I)
gammas <- rnorm(S)

y <- gendata.M(gammas,alphas,betas)

y.dat <- data.frame(y=y[1:(S*I)],subject=factor(rep(1:S,I)),item=factor(rep(1:I,each=S)))

## Not run: 
##D fit.glm <- glm(y~subject-1+item,family=binomial,data=y.dat)
##D fit.brglm <- brglm(y~subject-1+item,family=binomial,data=y.dat)
##D fit.mbrglm <- mbrglm(y~subject-1+item,family=binomial,data=y.dat)
## End(Not run)
summary(fit.glm)
summary(fit.brglm)
summary(fit.mbrglm)




