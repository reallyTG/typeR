library(ClassComparison)


### Name: Bum-class
### Title: Class "Bum"
### Aliases: Bum Bum-class countSignificant,Bum-method
###   cutoffSignificant,Bum-method hist,Bum-method image,Bum-method
###   selectSignificant,Bum-method summary,Bum-method likelihoodBum
### Keywords: multivariate htest classes

### ** Examples

showClass("Bum")
fake.data <- c(runif(700), rbeta(300, 0.3, 1))
a <- Bum(fake.data)
hist(a, res=200)

alpha <- (1:25)/100
plot(alpha, cutoffSignificant(a, alpha, by='FDR'),
     xlab='Desired False Discovery Rate', type='l',
     main='FDR Control', ylab='Significant P Value')

GAMMA <- 5*(10:19)/100
plot(GAMMA, cutoffSignificant(a, GAMMA, by='EmpiricalBayes'),
     ylab='Significant P Value', type='l',
     main='Empirical Bayes', xlab='Posterior Probability')

b <- summary(a, (0:100)/100)
be <- b@estimates
sens <- be$TP/(be$TP+be$FN)
spec <- be$TN/(be$TN+be$FP)
plot(1-spec, sens, type='l', xlim=c(0,1), ylim=c(0,1), main='ROC Curve')
points(1-spec, sens)
abline(0,1)

image(a)

countSignificant(a, 0.05, by='FDR')
countSignificant(a, 0.99, by='Emp')



