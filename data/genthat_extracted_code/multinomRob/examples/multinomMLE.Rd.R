library(multinomRob)


### Name: Multinomial Regression
### Title: Multinomial Regression Maximum Likelihood Estimator with
###   Overdispersion
### Aliases: multinomMLE
### Keywords: models regression

### ** Examples

# make some multinomial data
x1 <- rnorm(50);
x2 <- rnorm(50);
p1 <- exp(x1)/(1+exp(x1)+exp(x2));
p2 <- exp(x2)/(1+exp(x1)+exp(x2));
p3 <- 1 - (p1 + p2);
y <- matrix(0, 50, 3);
for (i in 1:50) {
  y[i,] <- rmultinomial(1000, c(p1[i], p2[i], p3[i]));
}

# perturb the first 5 observations
y[1:5,c(1,2,3)] <- y[1:5,c(3,1,2)];
y1 <- y[,1];
y2 <- y[,2];
y3 <- y[,3];

# put data into a dataframe
dtf <- data.frame(x1, x2, y1, y2, y3);

#Do MLE estimation.  The following model is NOT identified if we
#try to estimate the overdispersed MNL.
dtf <- data.frame(y1=c(1,1),y2=c(2,1),y3=c(1,2),x=c(0,1))
summary(multinomRob(list(y1 ~ 0, y2 ~ x, y3 ~ x), data=dtf, MLEonly=TRUE))



