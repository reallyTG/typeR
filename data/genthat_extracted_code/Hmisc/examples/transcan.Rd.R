library(Hmisc)


### Name: transcan
### Title: Transformations/Imputations using Canonical Variates
### Aliases: transcan summary.transcan print.transcan plot.transcan
###   ggplot.transcan impute.transcan predict.transcan Function
###   Function.transcan fit.mult.impute vcov.default vcov.fit.mult.impute
###   [.transcan invertTabulated
### Keywords: smooth regression multivariate methods models

### ** Examples

## Not run: 
##D x <- cbind(age, disease, blood.pressure, pH)  
##D #cbind will convert factor object `disease' to integer
##D par(mfrow=c(2,2))
##D x.trans <- transcan(x, categorical="disease", asis="pH",
##D                     transformed=TRUE, imputed=TRUE)
##D summary(x.trans)  #Summary distribution of imputed values, and R-squares
##D f <- lm(y ~ x.trans$transformed)   #use transformed values in a regression
##D #Now replace NAs in original variables with imputed values, if not
##D #using transformations
##D age            <- impute(x.trans, age)
##D disease        <- impute(x.trans, disease)
##D blood.pressure <- impute(x.trans, blood.pressure)
##D pH             <- impute(x.trans, pH)
##D #Do impute(x.trans) to impute all variables, storing new variables under
##D #the old names
##D summary(pH)       #uses summary.impute to tell about imputations
##D                   #and summary.default to tell about pH overall
##D # Get transformed and imputed values on some new data frame xnew
##D newx.trans     <- predict(x.trans, xnew)
##D w              <- predict(x.trans, xnew, type="original")
##D age            <- w[,"age"]            #inserts imputed values
##D blood.pressure <- w[,"blood.pressure"]
##D Function(x.trans)  #creates .age, .disease, .blood.pressure, .pH()
##D #Repeat first fit using a formula
##D x.trans <- transcan(~ age + disease + blood.pressure + I(pH), 
##D                     imputed=TRUE)
##D age <- impute(x.trans, age)
##D predict(x.trans, expand.grid(age=50, disease="pneumonia",
##D         blood.pressure=60:260, pH=7.4))
##D z <- transcan(~ age + factor(disease.code),  # disease.code categorical
##D               transformed=TRUE, trantab=TRUE, imputed=TRUE, pl=FALSE)
##D ggplot(z, scale=TRUE)
##D plot(z$transformed)
## End(Not run)


# Multiple imputation and estimation of variances and covariances of
# regression coefficient estimates accounting for imputation
set.seed(1)
x1 <- factor(sample(c('a','b','c'),100,TRUE))
x2 <- (x1=='b') + 3*(x1=='c') + rnorm(100)
y  <- x2 + 1*(x1=='c') + rnorm(100)
x1[1:20] <- NA
x2[18:23] <- NA
d <- data.frame(x1,x2,y)
n <- naclus(d)
plot(n); naplot(n)  # Show patterns of NAs
f  <- transcan(~y + x1 + x2, n.impute=10, shrink=FALSE, data=d)
options(digits=3)
summary(f)


f  <- transcan(~y + x1 + x2, n.impute=10, shrink=TRUE, data=d)
summary(f)


h <- fit.mult.impute(y ~ x1 + x2, lm, f, data=d)
# Add ,fit.reps=TRUE to save all fit objects in h, then do something like:
# for(i in 1:length(h$fits)) print(summary(h$fits[[i]]))


diag(vcov(h))


h.complete <- lm(y ~ x1 + x2, na.action=na.omit)
h.complete
diag(vcov(h.complete))


# Note: had the rms ols function been used in place of lm, any
# function run on h (anova, summary, etc.) would have automatically
# used imputation-corrected variances and covariances


# Example demonstrating how using the multinomial logistic model
# to impute a categorical variable results in a frequency
# distribution of imputed values that matches the distribution
# of non-missing values of the categorical variable


## Not run: 
##D set.seed(11)
##D x1 <- factor(sample(letters[1:4], 1000,TRUE))
##D x1[1:200] <- NA
##D table(x1)/sum(table(x1))
##D x2 <- runif(1000)
##D z  <- transcan(~ x1 + I(x2), n.impute=20, impcat='multinom')
##D table(z$imputed$x1)/sum(table(z$imputed$x1))
##D 
##D # Here is how to create a completed dataset
##D d <- data.frame(x1, x2)
##D z <- transcan(~x1 + I(x2), n.impute=5, data=d)
##D imputed <- impute(z, imputation=1, data=d,
##D                   list.out=TRUE, pr=FALSE, check=FALSE)
##D sapply(imputed, function(x)sum(is.imputed(x)))
##D sapply(imputed, function(x)sum(is.na(x)))
## End(Not run)

# Example where multiple imputations are for basic variables and
# modeling is done on variables derived from these


set.seed(137)
n <- 400
x1 <- runif(n)
x2 <- runif(n)
y  <- x1*x2 + x1/(1+x2) + rnorm(n)/3
x1[1:5] <- NA
d <- data.frame(x1,x2,y)
w <- transcan(~ x1 + x2 + y, n.impute=5, data=d)
# Add ,show.imputed.actual for graphical diagnostics
## Not run: 
##D g <- fit.mult.impute(y ~ product + ratio, ols, w,
##D                      data=data.frame(x1,x2,y),
##D                      derived=expression({
##D                        product <- x1*x2
##D                        ratio   <- x1/(1+x2)
##D                        print(cbind(x1,x2,x1*x2,product)[1:6,])}))
## End(Not run)


# Here's a method for creating a permanent data frame containing
# one set of imputed values for each variable specified to transcan
# that had at least one NA, and also containing all the variables
# in an original data frame.  The following is based on the fact
# that the default output location for impute.transcan is
# given by the global environment


## Not run: 
##D xt <- transcan(~. , data=mine,
##D                imputed=TRUE, shrink=TRUE, n.impute=10, trantab=TRUE)
##D attach(mine, use.names=FALSE)
##D impute(xt, imputation=1) # use first imputation
##D # omit imputation= if using single imputation
##D detach(1, 'mine2')
## End(Not run)


# Example of using invertTabulated outside transcan
x    <- c(1,2,3,4,5,6,7,8,9,10)
y    <- c(1,2,3,4,5,5,5,5,9,10)
freq <- c(1,1,1,1,1,2,3,4,1,1)
# x=5,6,7,8 with prob. .1 .2 .3 .4 when y=5
# Within a tolerance of .05*(10-1) all y's match exactly
# so the distance measure does not play a role
set.seed(1)      # so can reproduce
for(inverse in c('linearInterp','sample'))
 print(table(invertTabulated(x, y, freq, rep(5,1000), inverse=inverse)))


# Test inverse='sample' when the estimated transformation is
# flat on the right.  First show default imputations
set.seed(3)
x <- rnorm(1000)
y <- pmin(x, 0)
x[1:500] <- NA
for(inverse in c('linearInterp','sample')) {
par(mfrow=c(2,2))
  w <- transcan(~ x + y, imputed.actual='hist',
                inverse=inverse, curtail=FALSE,
                data=data.frame(x,y))
  if(inverse=='sample') next
# cat('Click mouse on graph to proceed\n')
# locator(1)
}



