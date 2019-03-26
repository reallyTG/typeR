library(ATE)


### Name: ATE
### Title: Estimate the Average Treatment Effect
### Aliases: ATE

### ** Examples

library(ATE)
#binary treatment

set.seed(25)
n <- 200
Z <- matrix(rnorm(4*n),ncol=4,nrow=n)
prop <- 1 / (1 + exp(Z[,1] - 0.5 * Z[,2] + 0.25*Z[,3] + 0.1 * Z[,4]))
treat <- rbinom(n, 1, prop)
Y <- 200 + 10*treat+ (1.5*treat-0.5)*(27.4*Z[,1] + 13.7*Z[,2] +
          13.7*Z[,3] + 13.7*Z[,4]) + rnorm(n)
X <- cbind(exp(Z[,1])/2,Z[,2]/(1+exp(Z[,1])),
          (Z[,1]*Z[,3]/25+0.6)^3,(Z[,2]+Z[,4]+20)^2)

#estimation of average treatment effects (ATE)
fit1<-ATE(Y,treat,X)
summary(fit1)
#plot(fit1)

#estimation of average treatment effects on treated (ATT)
fit2<-ATE(Y,treat,X,ATT=TRUE)
summary(fit2)
#plot(fit2)


#three treatment groups
set.seed(25)
n <- 200
Z <- matrix(rnorm(4*n),ncol=4,nrow=n)
prop1 <- 1 / (1 + exp(1+Z[,1] - 0.5 * Z[,2] + 0.25*Z[,3] + 0.1 * Z[,4]))
prop2 <- 1 / (1 + exp(Z[,1] - 0.5 * Z[,2] + 0.25*Z[,3] + 0.1 * Z[,4]))

U <-runif(n)
treat <- numeric(n)
treat[U>(1-prop2)]=2
treat[U<(1-prop2)& U>(prop2-prop1)]=1

Y <- 210 + 10*treat +(27.4*Z[,1] + 13.7*Z[,2] + 
            13.7*Z[,3] + 13.7*Z[,4]) + rnorm(n)
X <- cbind(exp(Z[,1])/2,Z[,2]/(1+exp(Z[,1])),
            (Z[,1]*Z[,3]/25+0.6)^3,(Z[,2]+Z[,4]+20)^2)

fit3<-ATE(Y,treat,X)
summary(fit3)
#plot(fit3)




