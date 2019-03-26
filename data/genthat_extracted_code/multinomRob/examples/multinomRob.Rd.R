library(multinomRob)


### Name: Robust Multinomial Regression
### Title: Multinomial Robust Estimation
### Aliases: multinomRob
### Keywords: robust models regression

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

## Set parameters for Genoud
## Not run: 
##D ## For production, use these kinds of parameters
##D zz.genoud.parms <- list( pop.size             = 1000,
##D                         wait.generations      = 10,
##D                         max.generations       = 100,
##D                         scale.domains         = 5,
##D                         print.level = 0
##D                         )
## End(Not run)

## For testing, we are setting the parmeters to run quickly. Don't use these for production
zz.genoud.parms <- list( pop.size             = 10,
                        wait.generations      = 1,
                        max.generations       = 1,
                        scale.domains         = 5,
                        print.level = 0
                        )

# estimate a model, with "y3" being the reference category
# true coefficient values are:  (Intercept) = 0, x = 1
# impose an equality constraint
# equality constraint:  coefficients of x1 and x2 are equal
mulrobE <- multinomRob(list(y1 ~ x1, y2 ~ x2, y3 ~ 0),
                      dtf,
                      equality = list(list(y1 ~ x1 + 0, y2 ~ x2 + 0)),
                      genoud.parms = zz.genoud.parms,
                      print.level = 3, iter=FALSE);
summary(mulrobE, weights=TRUE);

#Do only MLE estimation.  The following model is NOT identified if we
#try to estimate the overdispersed MNL.
dtf <- data.frame(y1=c(1,1),y2=c(2,1),y3=c(1,2),x=c(0,1))
summary(multinomRob(list(y1 ~ 0, y2 ~ x, y3 ~ x), data=dtf, MLEonly=TRUE))



