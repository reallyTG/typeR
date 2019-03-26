library(rms)


### Name: lrm
### Title: Logistic Regression Model
### Aliases: lrm print.lrm
### Keywords: category models

### ** Examples

#Fit a logistic model containing predictors age, blood.pressure, sex
#and cholesterol, with age fitted with a smooth 5-knot restricted cubic 
#spline function and a different shape of the age relationship for males 
#and females.  As an intermediate step, predict mean cholesterol from
#age using a proportional odds ordinal logistic model
#
n <- 1000    # define sample size
set.seed(17) # so can reproduce the results
age            <- rnorm(n, 50, 10)
blood.pressure <- rnorm(n, 120, 15)
cholesterol    <- rnorm(n, 200, 25)
sex            <- factor(sample(c('female','male'), n,TRUE))
label(age)            <- 'Age'      # label is in Hmisc
label(cholesterol)    <- 'Total Cholesterol'
label(blood.pressure) <- 'Systolic Blood Pressure'
label(sex)            <- 'Sex'
units(cholesterol)    <- 'mg/dl'   # uses units.default in Hmisc
units(blood.pressure) <- 'mmHg'

#To use prop. odds model, avoid using a huge number of intercepts by
#grouping cholesterol into 40-tiles
ch <- cut2(cholesterol, g=40, levels.mean=TRUE) # use mean values in intervals
table(ch)
f <- lrm(ch ~ age)
options(prType='latex')
print(f, coefs=4)  # write latex code to console
m <- Mean(f)    # see help file for Mean.lrm
d <- data.frame(age=seq(0,90,by=10))
m(predict(f, d))
# Repeat using ols
f <- ols(cholesterol ~ age)
predict(f, d)

# Specify population model for log odds that Y=1
L <- .4*(sex=='male') + .045*(age-50) +
     (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male'))
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)
cholesterol[1:3] <- NA   # 3 missings, at random

ddist <- datadist(age, blood.pressure, cholesterol, sex)
options(datadist='ddist')

fit <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)),
               x=TRUE, y=TRUE)
#      x=TRUE, y=TRUE allows use of resid(), which.influence below
#      could define d <- datadist(fit) after lrm(), but data distribution
#      summary would not be stored with fit, so later uses of Predict
#      or summary.rms would require access to the original dataset or
#      d or specifying all variable values to summary, Predict, nomogram
anova(fit)
p <- Predict(fit, age, sex)
ggplot(p)   # or plot()
ggplot(Predict(fit, age=20:70, sex="male"))   # need if datadist not used
print(cbind(resid(fit,"dfbetas"), resid(fit,"dffits"))[1:20,])
which.influence(fit, .3)
# latex(fit)                       #print nice statement of fitted model
#
#Repeat this fit using penalized MLE, penalizing complex terms
#(for nonlinear or interaction effects)
#
fitp <- update(fit, penalty=list(simple=0,nonlinear=10), x=TRUE, y=TRUE)
effective.df(fitp)
# or lrm(y ~ ..., penalty=...)


#Get fits for a variety of penalties and assess predictive accuracy 
#in a new data set.  Program efficiently so that complex design 
#matrices are only created once.


set.seed(201)
x1 <- rnorm(500)
x2 <- rnorm(500)
x3 <- sample(0:1,500,rep=TRUE)
L  <- x1+abs(x2)+x3
y  <- ifelse(runif(500)<=plogis(L), 1, 0)
new.data <- data.frame(x1,x2,x3,y)[301:500,]
#
for(penlty in seq(0,.15,by=.005)) {
  if(penlty==0) {
    f <- lrm(y ~ rcs(x1,4)+rcs(x2,6)*x3, subset=1:300, x=TRUE, y=TRUE)
    # True model is linear in x1 and has no interaction
    X <- f$x    # saves time for future runs - don't have to use rcs etc.
    Y <- f$y    # this also deletes rows with NAs (if there were any)
    penalty.matrix <- diag(diag(var(X)))
    Xnew <- predict(f, new.data, type="x")  
    # expand design matrix for new data
    Ynew <- new.data$y
  } else f <- lrm.fit(X,Y, penalty.matrix=penlty*penalty.matrix)
#
  cat("\nPenalty :",penlty,"\n")
  pred.logit <- f$coef[1] + (Xnew %*% f$coef[-1])
  pred <- plogis(pred.logit)
  C.index <- somers2(pred, Ynew)["C"]
  Brier   <- mean((pred-Ynew)^2)
  Deviance<- -2*sum( Ynew*log(pred) + (1-Ynew)*log(1-pred) )
  cat("ROC area:",format(C.index),"   Brier score:",format(Brier),
      "   -2 Log L:",format(Deviance),"\n")
}
#penalty=0.045 gave lowest -2 Log L, Brier, ROC in test sample for S+
#
#Use bootstrap validation to estimate predictive accuracy of
#logistic models with various penalties
#To see how noisy cross-validation estimates can be, change the
#validate(f, ...) to validate(f, method="cross", B=10) for example.
#You will see tremendous variation in accuracy with minute changes in
#the penalty.  This comes from the error inherent in using 10-fold
#cross validation but also because we are not fixing the splits.  
#20-fold cross validation was even worse for some
#indexes because of the small test sample size.  Stability would be
#obtained by using the same sample splits for all penalty values 
#(see above), but then we wouldn't be sure that the choice of the 
#best penalty is not specific to how the sample was split.  This
#problem is addressed in the last example.
#
penalties <- seq(0,.7,length=3)   # really use by=.02
index <- matrix(NA, nrow=length(penalties), ncol=11,
	        dimnames=list(format(penalties),
          c("Dxy","R2","Intercept","Slope","Emax","D","U","Q","B","g","gp")))
i <- 0
for(penlty in penalties)
{
  cat(penlty, "")
  i <- i+1
  if(penlty==0)
    {
    f <- lrm(y ~ rcs(x1,4)+rcs(x2,6)*x3, x=TRUE, y=TRUE)  # fit whole sample
    X <- f$x
    Y <- f$y
    penalty.matrix <- diag(diag(var(X)))   # save time - only do once
    }
  else
   f <- lrm(Y ~ X, penalty=penlty,
            penalty.matrix=penalty.matrix, x=TRUE,y=TRUE)
  val <- validate(f, method="boot", B=20)  # use larger B in practice
  index[i,] <- val[,"index.corrected"]
}
par(mfrow=c(3,3))
for(i in 1:9)
{
  plot(penalties, index[,i], 
       xlab="Penalty", ylab=dimnames(index)[[2]][i])
  lines(lowess(penalties, index[,i]))
}
options(datadist=NULL)

# Example of weighted analysis
x    <- 1:5
y    <- c(0,1,0,1,0)
reps <- c(1,2,3,2,1)
lrm(y ~ x, weights=reps)
x <- rep(x, reps)
y <- rep(y, reps)
lrm(y ~ x)   # same as above

#
#Study performance of a modified AIC which uses the effective d.f.
#See Verweij and Van Houwelingen (1994) Eq. (6).  Here AIC=chisq-2*df.
#Also try as effective d.f. equation (4) of the previous reference.
#Also study performance of Shao's cross-validation technique (which was
#designed to pick the "right" set of variables, and uses a much smaller
#training sample than most methods).  Compare cross-validated deviance
#vs. penalty to the gold standard accuracy on a 7500 observation dataset.
#Note that if you only want to get AIC or Schwarz Bayesian information
#criterion, all you need is to invoke the pentrace function.
#NOTE: the effective.df( ) function is used in practice
#
## Not run: 
##D for(seed in c(339,777,22,111,3)){ 
##D # study performance for several datasets
##D   set.seed(seed)
##D   n <- 175; p <- 8
##D   X <- matrix(rnorm(n*p), ncol=p) # p normal(0,1) predictors
##D   Coef <- c(-.1,.2,-.3,.4,-.5,.6,-.65,.7)  # true population coefficients
##D   L <- X %*% Coef                 # intercept is zero
##D   Y <- ifelse(runif(n)<=plogis(L), 1, 0)
##D   pm <- diag(diag(var(X)))
##D   #Generate a large validation sample to use as a gold standard
##D   n.val <- 7500
##D   X.val <- matrix(rnorm(n.val*p), ncol=p)
##D   L.val <- X.val %*% Coef
##D   Y.val <- ifelse(runif(n.val)<=plogis(L.val), 1, 0)
##D   #
##D   Penalty <- seq(0,30,by=1)
##D   reps <- length(Penalty)
##D   effective.df <- effective.df2 <- aic <- aic2 <- deviance.val <- 
##D     Lpenalty <- single(reps)
##D   n.t <- round(n^.75)
##D   ncv <- c(10,20,30,40)     # try various no. of reps in cross-val.
##D   deviance <- matrix(NA,nrow=reps,ncol=length(ncv))
##D   #If model were complex, could have started things off by getting X, Y
##D   #penalty.matrix from an initial lrm fit to save time
##D   #
##D   for(i in 1:reps) {
##D     pen <- Penalty[i]
##D     cat(format(pen),"")
##D     f.full <- lrm.fit(X, Y, penalty.matrix=pen*pm)
##D     Lpenalty[i] <- pen* t(f.full$coef[-1]) %*% pm %*% f.full$coef[-1]
##D     f.full.nopenalty <- lrm.fit(X, Y, initial=f.full$coef, maxit=1)
##D     info.matrix.unpenalized <- solve(f.full.nopenalty$var)
##D     effective.df[i] <- sum(diag(info.matrix.unpenalized %*% f.full$var)) - 1
##D     lrchisq <- f.full.nopenalty$stats["Model L.R."]
##D     # lrm does all this penalty adjustment automatically (for var, d.f.,
##D     # chi-square)
##D     aic[i] <- lrchisq - 2*effective.df[i]
##D     #
##D     pred <- plogis(f.full$linear.predictors)
##D     score.matrix <- cbind(1,X) * (Y - pred)
##D     sum.u.uprime <- t(score.matrix) %*% score.matrix
##D     effective.df2[i] <- sum(diag(f.full$var %*% sum.u.uprime))
##D     aic2[i] <- lrchisq - 2*effective.df2[i]
##D     #
##D     #Shao suggested averaging 2*n cross-validations, but let's do only 40
##D     #and stop along the way to see if fewer is OK
##D     dev <- 0
##D     for(j in 1:max(ncv)) {
##D       s    <- sample(1:n, n.t)
##D       cof  <- lrm.fit(X[s,],Y[s], 
##D                       penalty.matrix=pen*pm)$coef
##D       pred <- cof[1] + (X[-s,] %*% cof[-1])
##D       dev <- dev -2*sum(Y[-s]*pred + log(1-plogis(pred)))
##D       for(k in 1:length(ncv)) if(j==ncv[k]) deviance[i,k] <- dev/j
##D     }
##D     #
##D     pred.val <- f.full$coef[1] + (X.val %*% f.full$coef[-1])
##D     prob.val <- plogis(pred.val)
##D     deviance.val[i] <- -2*sum(Y.val*pred.val + log(1-prob.val))
##D   }
##D   postscript(hor=TRUE)   # along with graphics.off() below, allow plots
##D   par(mfrow=c(2,4))   # to be printed as they are finished
##D   plot(Penalty, effective.df, type="l")
##D   lines(Penalty, effective.df2, lty=2)
##D   plot(Penalty, Lpenalty, type="l")
##D   title("Penalty on -2 log L")
##D   plot(Penalty, aic, type="l")
##D   lines(Penalty, aic2, lty=2)
##D   for(k in 1:length(ncv)) {
##D     plot(Penalty, deviance[,k], ylab="deviance")
##D     title(paste(ncv[k],"reps"))
##D     lines(supsmu(Penalty, deviance[,k]))
##D   }
##D   plot(Penalty, deviance.val, type="l")
##D   title("Gold Standard (n=7500)")
##D   title(sub=format(seed),adj=1,cex=.5)
##D   graphics.off()
##D }
## End(Not run)
#The results showed that to obtain a clear picture of the penalty-
#accuracy relationship one needs 30 or 40 reps in the cross-validation.
#For 4 of 5 samples, though, the super smoother was able to detect
#an accurate penalty giving the best (lowest) deviance using 10-fold
#cross-validation.  Cross-validation would have worked better had
#the same splits been used for all penalties.
#The AIC methods worked just as well and are much quicker to compute.
#The first AIC based on the effective d.f. in Gray's Eq. 2.9
#(Verweij and Van Houwelingen (1994) Eq. 5 (note typo)) worked best.



