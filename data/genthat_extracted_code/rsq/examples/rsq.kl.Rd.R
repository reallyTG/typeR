library(rsq)


### Name: rsq.kl
### Title: KL-Divergence-Based R-Squared
### Aliases: rsq.kl

### ** Examples

data(hcrabs)
attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq.kl(bnfit)
rsq.kl(bnfit,adj=TRUE)

psfit <- glm(num.satellites~color+spine+width+weight,family=poisson)
rsq.kl(psfit)
rsq.kl(psfit,adj=TRUE)

# Effectiveness of Bycycle Safety Helmets in Thompson et al. (1989)
y <- matrix(c(17,218,233,758),2,2)
x <- factor(c("yes","no"))
tbn <- glm(y~x,family=binomial)
rsq.kl(tbn)
rsq.kl(tbn,adj=TRUE)



