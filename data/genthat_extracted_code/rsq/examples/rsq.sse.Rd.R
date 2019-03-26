library(rsq)


### Name: rsq.sse
### Title: SSE-Based R-Squared
### Aliases: rsq.sse

### ** Examples

data(hcrabs)
attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq.sse(bnfit)
rsq.sse(bnfit,adj=TRUE)

psfit <- glm(num.satellites~color+spine+width+weight,family=poisson)
rsq.sse(psfit)
rsq.sse(psfit,adj=TRUE)

# Effectiveness of Bycycle Safety Helmets in Thompson et al. (1989)
y <- matrix(c(17,218,233,758),2,2)
x <- factor(c("yes","no"))
tbn <- glm(y~x,family=binomial)
rsq.sse(tbn)
rsq.sse(tbn,adj=TRUE)



