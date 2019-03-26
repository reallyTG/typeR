library(separationplot)


### Name: separationplot
### Title: Generate a Separation Plot
### Aliases: separationplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

## No test: 

# Create a separation plot for a simple logit model:

library(MASS)
set.seed(1)
Sigma <- matrix(c(1,0.78,0.78,1),2,2)
a<-(mvrnorm(n=500, rep(0, 2), Sigma))
a[,2][a[,2]>0.75]<-1
a[,2][a[,2]<=0.75]<-0
a[,1]<-a[,1]-min(a[,1])
a[,1]<-a[,1]/max(a[,1])

cor(a) # should be 0.55

model1<-glm(a[,2]~a[,1], family=binomial(link = "logit"))

library(Hmisc)
somers2(model1$fitted.values, model1$y)

separationplot(pred=model1$fitted.values, actual=model1$y, type="rect",
               line=TRUE, show.expected=TRUE, heading="Example 1")


## End(No test)



