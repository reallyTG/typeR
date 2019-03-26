library(rsq)


### Name: rsq.n
### Title: Corrected Likelihood-Ratio-Based R-Squared
### Aliases: rsq.n

### ** Examples

data(hcrabs)
attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq.n(bnfit)
rsq.n(bnfit,adj=TRUE)

psfit <- glm(num.satellites~color+spine+width+weight,family=poisson)
rsq.n(psfit)
rsq.n(psfit,adj=TRUE)

# Effectiveness of Bycycle Safety Helmets in Thompson et al. (1989)
y <- matrix(c(17,218,233,758),2,2)
x <- factor(c("yes","no"))
tbn <- glm(y~x,family=binomial)
rsq.n(tbn)
rsq.n(tbn,adj=TRUE)



