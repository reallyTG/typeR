library(rsq)


### Name: rsq.lr
### Title: Likelihood-Ratio-Based R-Squared
### Aliases: rsq.lr

### ** Examples

data(hcrabs)
attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq.lr(bnfit)
rsq.lr(bnfit,adj=TRUE)

psfit <- glm(num.satellites~color+spine+width+weight,family=poisson)
rsq.lr(psfit)
rsq.lr(psfit,adj=TRUE)

# Effectiveness of Bycycle Safety Helmets in Thompson et al. (1989)
y <- matrix(c(17,218,233,758),2,2)
x <- factor(c("yes","no"))
tbn <- glm(y~x,family=binomial)
rsq.lr(tbn)
rsq.lr(tbn,adj=TRUE)



