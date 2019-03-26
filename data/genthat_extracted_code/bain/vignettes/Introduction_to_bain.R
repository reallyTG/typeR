## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----ttest_ex1, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # collect the data for the boys in the vector x and for the girls in the
#  # vector y
#  x<-sesamesim$postnumb[which(sesamesim$sex==1)]
#  y<-sesamesim$postnumb[which(sesamesim$sex==2)]
#  # execute student's t-test
#  ttest <- t_test(x,y,paired = FALSE, var.equal = TRUE)
#  # Check the names of the estimates
#  coef(ttest)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(ttest, "x = y; x > y; x < y")
#  # display the results
#  results
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex2, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # collect the data for the boys in the vector x and for the girs in the
#  # vector y
#  x<-sesamesim$postnumb[which(sesamesim$sex==1)]
#  y<-sesamesim$postnumb[which(sesamesim$sex==2)]
#  # execute student's t-test
#  ttest <- t_test(x,y,paired = FALSE, var.equal = FALSE)
#  # Check the names of the coefficients
#  coef(ttest)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(ttest, "x = y; x > y; x < y")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex3, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # compare the pre with the post measurements
#  ttest <- t_test(sesamesim$prenumb,sesamesim$postnumb,paired = TRUE)
#  # Check name of the coefficient
#  coef(ttest)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(ttest, "difference=0; difference>0; difference<0")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex4, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data se
#  library(bain)
#  # compare post measurements with the reference value 30
#  ttest <- t_test(sesamesim$postnumb)
#  # Check name of estimate
#  coef(ttest)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain versus the reference value 30
#  results <- bain(ttest, "x=30; x>30; x<30")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex5, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # collect the data for the boys in the vector x and for the girs in the
#  # vector y
#  x<-sesamesim$postnumb[which(sesamesim$sex==1)]
#  y<-sesamesim$postnumb[which(sesamesim$sex==2)]
#  # execute student's t-test
#  ttest <- t_test(x,y,paired = FALSE, var.equal = TRUE)
#  # Check the names of the estimates
#  coef(ttest)
#  # compute the pooled within standard deviation using the variance of x
#  # (ttest$v[1]) and y (ttest$v[2])
#  pwsd <- sqrt(((length(x) -1) * ttest$v[1] + (length(y)-1) * ttest$v[2])/
#  ((length(x) -1) + (length(y) -1)))
#  # print pwsd in order to be able to include it in the hypothesis. Its value
#  # is 12.60
#  print(pwsd)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses (the means of boy and girl differ less than .2 * pwsd =
#  # 2.52 VERSUS the means differ more than .2 * pwsd = 2.52) with bain
#  # note that, .2 is a value for Cohen's d reflecting a "small" effect, that
#  # is, the means differ less or more than .2 pwsd.
#  results <- bain(ttest, "x - y > -2.52 & x - y < 2.52")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex6, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # make a factor of variable site
#  sesamesim$site <- as.factor(sesamesim$site)
#  # execute an analysis of variance using lm() which, due to the -1, returns
#  # estimates of the means per group
#  anov <- lm(postnumb~site-1,sesamesim)
#  # take a look at the estimated means and their names
#  coef(anov)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(anov, "site1=site2=site3=site4=site5; site2>site5>site1>
#  site3>site4")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex7, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data se
#  library(bain)
#  # make a factor of variable site
#  sesamesim$site <- as.factor(sesamesim$site)
#  # Center the covariate. If centered the coef() command below displays the
#  # adjusted means. If not centered the intercepts are displayed.
#  sesamesim$prenumb <- sesamesim$prenumb - mean(sesamesim$prenumb)
#  # execute an analysis of covariance using lm() which, due to the -1, returns
#  # estimates of the adjusted means per group
#  ancov <- lm(postnumb~site+prenumb-1,sesamesim)
#  # take a look at the estimated adjusted means, the regression coefficient
#  # of the covariate and their names
#  coef(ancov)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(ancov, "site1=site2=site3=site4=site5;
#                          site2>site5>site1>site3>site4")
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex8, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # execute a multiple regression using lm()
#  regr <- lm(postnumb ~ age + peabody + prenumb,sesamesim)
#  # take a look at the estimated regression coefficients and their names
#  coef(regr)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that standardized = FALSE denotes that the
#  # hypotheses are in terms of unstandardized regression coefficients
#  results<-bain(regr, "age = 0 & peab=0 & pre=0 ; age > 0 & peab > 0 & pre > 0"
#  , standardize = FALSE)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)
#  # Since it is only meaningful to compare regression coefficients if they are
#  # measured on the same scale, bain can also evaluate standardized regression
#  # coefficients (based on the seBeta function by Jeff Jones and Niels Waller):
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that standardized = TRUE denotes that the
#  # hypotheses are in terms of standardized regression coefficients
#  results<-bain(regr, "age = peab = pre ; pre > age > peab",standardize = TRUE)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex9, eval=FALSE-----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data se
#  library(bain)
#  # make a factor of variable site
#  sesamesim$site <- as.factor(sesamesim$site)
#  # execute an analysis of variance using lm() which, due to the -1, returns
#  # estimates of the means per group
#  anov <- lm(postnumb~site-1,sesamesim)
#  # take a look at the estimated means and their names
#  coef(anov)
#  # collect the estimates means in a vector
#  estimate <- coef(anov)
#  # give names to the estimates in anov
#  names(estimate) <- c("site1", "site2", "site3","site4","site5")
#  # create a vector containing the sample sizes of each group
#  ngroup <- table(sesamesim$site)
#  # compute for each group the covariance matrix of the parameters
#  # of that group and collect these in a list
#  # for the ANOVA this is simply a list containing for each group the variance
#  # of the mean note that, the within group variance as estimated using lm is
#  # used to compute the variance of each of the means! See, Hoijtink, Gu, and
#  # Mulder (2018) for further elaborations.
#  var <- summary(anov)$sigma**2
#  cov1 <- matrix(var/ngroup[1], nrow=1, ncol=1)
#  cov2 <- matrix(var/ngroup[2], nrow=1, ncol=1)
#  cov3 <- matrix(var/ngroup[3], nrow=1, ncol=1)
#  cov4 <- matrix(var/ngroup[4], nrow=1, ncol=1)
#  cov5 <- matrix(var/ngroup[5], nrow=1, ncol=1)
#  covlist <- list(cov1, cov2, cov3, cov4,cov5)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there are multiple groups
#  # characterized by one mean, therefore group_parameters=0. Note that are no
#  # joint parameters, therefore, joint_parameters=0.
#  results <- bain(estimate,
#  "site1=site2=site3=site4=site5; site2>site5>site1>site3>site4",
#  n=ngroup,Sigma=covlist,group_parameters=1,joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex10, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data se
#  library(bain)
#  # make a factor of variable site
#  sesamesim$site <- as.factor(sesamesim$site)
#  # center the covariate. If centered the coef() command below displays the
#  # adjusted means. If not centered the intercepts are displayed.
#  sesamesim$prenumb <- sesamesim$prenumb - mean(sesamesim$prenumb)
#  # execute an analysis of covariance using lm() which, due to the -1, returns
#  # estimates of the adjusted means per group
#  ancov2 <- lm(postnumb~site+prenumb-1,sesamesim)
#  # take a look at the estimated adjusted means and their names
#  coef(ancov2)
#  # collect the estimates of the adjusted means and regression coefficient of
#  # the covariate in a vector (the vector has to contain first the
#  # adjusted means and next the regression coefficients of the covariates)
#  estimates <- coef(ancov2)
#  # assign names to the estimates
#  names(estimates)<- c("v.1", "v.2", "v.3", "v.4","v.5", "pre")
#  # compute the sample size per group
#  ngroup <- table(sesamesim$site)
#  # compute for each group the covariance matrix of the parameters of that
#  # group and collect these in a list note that, the residual variance as
#  # estimated using lm is used to compute these covariance matrices
#  var <- (summary(ancov2)$sigma)**2
#  # below, for each group, the covariance matrix of the adjusted mean and
#  # covariate is computed
#  # see Hoijtink, Gu, and Mulder (2018) for further explanation and elaboration
#  cat1 <- subset(cbind(sesamesim$site,sesamesim$prenumb), sesamesim$site == 1)
#  cat1[,1] <- 1
#  cat1 <- as.matrix(cat1)
#  cov1 <- var * solve(t(cat1) %*% cat1)
#  #
#  cat2 <- subset(cbind(sesamesim$site,sesamesim$prenumb), sesamesim$site == 2)
#  cat2[,1] <- 1
#  cat2 <- as.matrix(cat2)
#  cov2 <- var * solve(t(cat2) %*% cat2)
#  #
#  cat3 <- subset(cbind(sesamesim$site,sesamesim$prenumb), sesamesim$site == 3)
#  cat3[,1] <- 1
#  cat3 <- as.matrix(cat3)
#  cov3 <- var * solve(t(cat3) %*% cat3)
#  #
#  cat4 <- subset(cbind(sesamesim$site,sesamesim$prenumb), sesamesim$site == 4)
#  cat4[,1] <- 1
#  cat4 <- as.matrix(cat4)
#  cov4 <- var * solve(t(cat4) %*% cat4)
#  #
#  cat5 <- subset(cbind(sesamesim$site,sesamesim$prenumb), sesamesim$site == 5)
#  cat5[,1] <- 1
#  cat5 <- as.matrix(cat5)
#  cov5 <- var * solve(t(cat5) %*% cat5)
#  #
#  covariances <- list(cov1, cov2, cov3, cov4,cov5)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there are multiple groups
#  # characterized by one adjusted mean, therefore group_parameters=1 Note that
#  # there is one covariate, therefore, joint_parameters=1.
#  results2<-bain(estimates,"v.1=v.2=v.3=v.4=v.5;v.2 > v.5 > v.1 > v.3 >v.4;",
#  n=ngroup,Sigma=covariances,group_parameters=1,joint_parameters = 1)
#  # display the results
#  print(results2)
#  # obtain the descriptives table
#  summary(results2, ci = 0.95)

## ----ttest_ex11, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # estimate the means of three repeated measures of number knowledge
#  # the 1 denotes that these means have to be estimated
#  within <- lm(cbind(prenumb,postnumb,funumb)~1, data=sesamesim)
#  # take a look at the estimated means and their names
#  coef(within)
#  # note that the model specified in lm has three dependent variables.
#  # Consequently, the estimates rendered by lm are collected in a "matrix".
#  # Since bain needs a named vector containing the estimated means, the [1:3]
#  # code is used to select the three means from a matrix and store them in a
#  # vector.
#  estimate <- coef(within)[1:3]
#  # give names to the estimates in anov
#  names(estimate) <- c("pre", "post", "fu")
#  # compute the sample size
#  ngroup <- nrow(sesamesim)
#  # compute the covariance matrix of the three means
#  covmatr <- list(vcov(within))
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there is one group, with three
#  # means therefore group_parameters=3.
#  results <- bain(estimate,"pre = post = fu; pre < post < fu", n=ngroup,
#  Sigma=covmatr, group_parameters=3, joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex12, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # make a factor of the variable sex
#  sesamesim$sex <- factor(sesamesim$sex)
#  # estimate the means of prenumb, postnumb, and funumb for boys and girls
#  # the -1 denotes that the means have to estimated
#  bw <- lm(cbind(prenumb, postnumb, funumb)~sex-1, data=sesamesim)
#  # take a look at the estimated means and their names
#  coef(bw)
#  # collect the estimated means in a vector
#  est1 <-coef(bw)[1,1:3] # the three means for sex = 1
#  est2 <-coef(bw)[2,1:3] # the three means for sex = 2
#  estimate <- c(est1,est2)
#  # give names to the estimates in anov
#  names(estimate) <- c("pre1", "post1", "fu1","pre2", "post2", "fu2")
#  # determine the sample size per group
#  ngroup<-table(sesamesim$sex)
#  # cov1 has to contain the covariance matrix of the three means in group 1.
#  # cov2 has to contain the covariance matrix in group 2
#  # typing vcov(bw) in the console pane highlights the structure of
#  # the covariance matrix of all 3+3=6 means
#  # it has to be dissected in to cov1 and cov2
#  cov1 <- c(vcov(bw)[1,1],vcov(bw)[1,3],vcov(bw)[1,5],vcov(bw)[3,1],
#  vcov(bw)[3,3],vcov(bw)[3,5],vcov(bw)[5,1],vcov(bw)[5,3],vcov(bw)[5,5])
#  cov1 <- matrix(cov1,3,3)
#  cov2 <- c(vcov(bw)[2,2],vcov(bw)[2,4],vcov(bw)[2,6],vcov(bw)[4,2],
#  vcov(bw)[4,4],vcov(bw)[4,6],vcov(bw)[6,2],vcov(bw)[6,4],vcov(bw)[6,6])
#  cov2 <- matrix(cov2,3,3)
#  covariance<-list(cov1,cov2)
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there are multiple groups
#  # characterized by three means, therefore group_parameters=3. Note that there
#  # are no additional parameters, therefore, joint_parameters=0.
#  results <-bain(estimate, "pre1 - pre2 = post1 - post2 = fu1 -fu2;
#  pre1 - pre2 > post1 - post2 > fu1 -fu2"  , n=ngroup, Sigma=covariance,
#  group_parameters=3, joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex13, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # regression coefficients can only be mutually compared if the
#  # corresponding predictors are measured on the same scale, therefore the
#  # predictors are standardized
#  sesamesim$age <- (sesamesim$age - mean(sesamesim$age))/sd(sesamesim$age)
#  sesamesim$peabody <- (sesamesim$peabody - mean(sesamesim$peabody))/
#  sd(sesamesim$peabody)
#  sesamesim$prenumb <- (sesamesim$prenumb - mean(sesamesim$prenumb))/
#  sd(sesamesim$prenumb)
#  # estimate the logistic regression coefficients
#  logreg <- glm(viewenc ~ age + peabody + prenumb, family=binomial,
#  data=sesamesim)
#  # take a look at the estimates and their names
#  coef(logreg)
#  # collect the estimated intercept and regression coefficients in a vector
#  estimate <- coef(logreg)
#  # give names to the estimates
#  names(estimate) <- c("int", "age", "peab" ,"pre" )
#  # compute the sample size. Note that, this is an analysis with ONE group
#  ngroup <- nrow(sesamesim)
#  # compute the covariance matrix of the intercept and regression coefficients
#  covmatr <- list(vcov(logreg))
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there is one group, with four
#  # parameters (intercept plus three regression coefficients) therefore
#  # group_parameters=4.
#  results <- bain(estimate, "age = peab = pre; age > pre > peab", n=ngroup,
#  Sigma=covmatr, group_parameters=4, joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex14, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # load the numDeriv package which will be used to compute the covariance
#  # matrix of the adjusted group coefficients and regression coefficient of age
#  # for the boys and the girls # using the estimates obtained using the data for
#  # the boys AND the girls.
#  library(numDeriv)
#  # make a factor of the variable sex
#  sesamesim$sex <- factor(sesamesim$sex)
#  # center the covariate age
#  sesamesim$age <- sesamesim$age - mean(sesamesim$age)
#  # determine sample size per sex group
#  ngroup <- table(sesamesim$sex)
#  # execute the logistic regression, -1 ensures that the coefficients
#  # for boys and girl are estimated adjusted for the covariate age
#  anal <- glm(viewenc ~ sex + age - 1, family=binomial, data=sesamesim)
#  # take a look at the estimates and their names
#  coef(anal)
#  # collect the estimates obtained using the data of the boys AND the
#  # girls in a vector. This vector contains first the group specific
#  # parameters followed by the regression coefficient of the covariate.
#  estimates <-coef(anal)
#  # give names to the estimates
#  names(estimates) <- c("boys", "girls", "age")
#  # use numDeriv to compute the Hessian matrix and subsequently the
#  # covariance matrix for each of the two (boys and girls) groups.
#  # The vector f should contain the regression coefficient of the group
#  # at hand and the regression coefficient of the covariate.
#  #
#  # the first group
#  data <- subset(cbind(sesamesim$sex,sesamesim$age,sesamesim$viewenc),
#  sesamesim$sex==1)
#  f <- 1
#  f[1] <- estimates[1] # the regression coefficient of boys
#  f[2] <- estimates[3] # the regression coefficient of age
#  #
#  # within the for loop below the log likelihood of the logistic
#  # regression model is computed using the data for the boys
#  logist1 <- function(x){
#    out <- 0
#    for (i in 1:ngroup[1]){
#      out <- out + data[i,3]*(x[1] + x[2]*data[i,2]) - log (1 +
#      exp(x[1] + x[2]*data[i,2]))
#    }
#    return(out)
#  }
#  hes1 <- hessian(func=logist1, x=f)
#  # multiply with -1 and invert to obtain the covariance matrix for the
#  # first group
#  cov1 <- -1 * solve(hes1)
#  #
#  # the second group
#  data <- subset(cbind(sesamesim$sex,sesamesim$age,sesamesim$viewenc),
#  sesamesim$sex==2)
#  f[1] <- estimates[2] # the regression coefficient of girls
#  f[2] <- estimates[3] # the regression coefficient of age
#  
#  # within the for loop below the log likelihood of the logistic
#  # regression model is computed using the data for the girls
#  logist2 <- function(x){
#    out <- 0
#    for (i in 1:ngroup[2]){
#      out <- out + data[i,3]*(x[1] + x[2]*data[i,2]) - log (1 +
#      exp(x[1] + x[2]*data[i,2]))
#    }
#    return(out)
#  }
#  hes2 <- hessian(func=logist2, x=f)
#  # multiply with -1 and invert to obtain the covariance matrix
#  cov2 <- -1 * solve(hes2)
#  #
#  #make a list of covariance matrices
#  covariance<-list(cov1,cov2)
#  #
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain. Note that there are multiple groups
#  # characterized by one adjusted group coefficient,
#  # therefore group_parameters=1. Note that there is one covariate,
#  # therefore, joint_parameters=1.
#  results <- bain(estimates, "boys < girls & age > 0", n=ngroup,
#  Sigma=covariance, group_parameters=1, joint_parameters = 1)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex15, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # load the WRS2 package which renders the trimmed sample mean and
#  # corresponding standard error
#  library(WRS2)
#  # make a factor of variable site
#  sesamesim$site <- as.factor(sesamesim$site)
#  # create a vector containing the sample sizes of each group
#  ngroup <- table(sesamesim$site)
#  # Compute the 20\% sample trimmed mean for each site
#  estimates <- c(mean(sesamesim$postnumb[sesamesim$site == 1], tr = 0.2),
#                 mean(sesamesim$postnumb[sesamesim$site == 2], tr = 0.2),
#                 mean(sesamesim$postnumb[sesamesim$site == 3], tr = 0.2),
#                 mean(sesamesim$postnumb[sesamesim$site == 4], tr = 0.2),
#                 mean(sesamesim$postnumb[sesamesim$site == 5], tr = 0.2))
#  # give names to the estimates
#  names(estimates) <- c("s1", "s2", "s3","s4","s5")
#  # display the estimates and their names
#  print(estimates)
#  # Compute the sample trimmed mean standard error for each site
#  se <- c(trimse(sesamesim$postnumb[sesamesim$site == 1]),
#          trimse(sesamesim$postnumb[sesamesim$site == 2]),
#          trimse(sesamesim$postnumb[sesamesim$site == 3]),
#          trimse(sesamesim$postnumb[sesamesim$site == 4]),
#          trimse(sesamesim$postnumb[sesamesim$site == 5]))
#  # Square the standard errors to obtain the variances of the sample
#  # trimmed means
#  var <- se^2
#  # Store the variances in a list of matrices
#  covlist <- list(matrix(var[1]),matrix(var[2]),
#  matrix(var[3]),matrix(var[4]), matrix(var[5]))
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(estimates,"s1=s2=s3=s4=s5;s2>s5>s1>s3>s4",
#  n=ngroup,Sigma=covlist,group_parameters=1,joint_parameters= 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex16, eval=FALSE----------------------------------------------
#  # load the bain package which includes the simulated sesamesim data set
#  library(bain)
#  # load the mice (multiple imputation of missing data), psych
#  # (provides access to the describe function), and MASS libraries -
#  # inspect the mice help file to obtain further information
#  # - also surf to http://www.stefvanbuuren.nl/mi/MICE.html to obtain
#  # further information and references for mice.
#  library(mice)
#  library(psych)
#  library(MASS)
#  sesamesim <- cbind(sesamesim$prenumb,sesamesim$postnumb,sesamesim$funumb,sesamesim$peabody)
#  colnames(sesamesim) <- c("prenumb","postnumb","funumb","peabody")
#  sesamesim <- as.data.frame(sesamesim)
#  # this examples is based on the prenumb, postnumb, funumb and peabody
#  # variables in the sesamesim data set. First of all, missing data are
#  # created in these four variables.
#  #
#  set.seed(1)
#  pmis1<-1
#  pmis2<-1
#  pmis3<-1
#  #
#  for (i in 1:240){
#    pmis1[i] <- .80
#    pmis2[i]<- .80
#    pmis3[i]<- .80
#  #
#    uni<-runif(1)
#    if (pmis1[i] < uni) {
#      sesamesim$funumb[i]<-NaN
#    }
#    uni<-runif(1)
#    if (pmis2[i] < uni) {
#      sesamesim$prenumb[i]<-NaN
#      sesamesim$postnumb[i]<-NaN
#    }
#    uni<-runif(1)
#    if (pmis3[i] < uni) {
#      sesamesim$peabody[i]<-NaN
#    }
#  }
#  # print data summaries - note that due to missing valus the n per variable is smaller than 240
#  print(describe(sesamesim))
#  # use mice to create 1000 imputed data matrices. Note that, the approach used below
#  # is only one manner in which mice can be instructed. Many other options are available.
#  M <- 1000
#  out <- mice(data = sesamesim, m = M, seed=999, meth=c("norm","norm","norm","norm"), diagnostics = FALSE, printFlag = FALSE)
#  # create matrices in which 1000 vectors with estimates can be stored and in which a covariance matrix can be stored
#  mulest <- matrix(0,nrow=1000,ncol=2)
#  covwithin <- matrix(0,nrow=2,ncol=2)
#  # execute 1000 multiple regressions using the imputed data matrices and store the estimates
#  # of only the regression coefficients of funumb on prenumb and postnumband and the average
#  # of the 1000 covariance matrices.
#  # See Hoijtink, Gu, Mulder, and Rosseel (2018) for an explanation of the latter.
#  for(i in 1:M) {
#  mulres <- lm(funumb~prenumb+postnumb,complete(out,i))
#  mulest[i,]<-coef(mulres)[2:3]
#  covwithin<-covwithin + 1/M * vcov(mulres)[2:3,2:3]
#  }
#  # Compute the average of the estimates and assign names, the between and total covariance matrix.
#  # See Hoijtink, Gu, Mulder, and Rosseel (2018) for an explanation.
#  estimates <- colMeans(mulest)
#  names(estimates) <- c("prenumb", "postnumb")
#  covbetween <- cov(mulest)
#  covariance <- covwithin + (1+1/M)*covbetween
#  # determine the sample size
#  samp <- nrow(sesamesim)
#  # compute the effective sample size
#  # See Hoijtink, Gu, Mulder, and Rosseel (2018) for an explanation.
#  nucom<-samp-length(estimates)
#  lam <- (1+1/M)*(1/length(estimates))* tr(covbetween %*% ginv(covariance))
#  nuold<-(M-1)/(lam^2)
#  nuobs<-(nucom+1)/(nucom+3)*nucom*(1-lam)
#  nu<- nuold*nuobs/(nuold+nuobs)
#  fracmis <- (nu+1)/(nu+3)*lam + 2/(nu+3)
#  neff<-samp-samp*fracmis
#  covariance<-list(covariance)
#  # set the seed
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(estimates,"prenumb=postnumb=0",n=neff,Sigma=covariance,group_parameters=2,joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

## ----ttest_ex17, eval=FALSE----------------------------------------------
#  # load the bain package
#  library(bain)
#  # load the lavaan package - look at the lavaan help file to obtain
#  # further information - also surf to # lavaan.ugent.be to obtain
#  # further information and references for lavaan - this example uses the
#  # HolzingerSwineford1939 data set which is included with lavaan.
#  library(lavaan)
#  # Specify a latent regression model
#  model <- 'visual  =~ x1 + x2 + x3
#  textual =~ x4 + x5 + x6
#  speed   =~ x7 + x8 + x9
#  speed ~ textual + visual'
#  # Estimate the parameters of the latent regression model with lavaan
#  fit<-sem(model,data=HolzingerSwineford1939,std.lv = TRUE)
#  # determine the sample size
#  ngroup<-nobs(fit)
#  # collect the "standardized" estimates of the latent regression
#  # coefficients in a vector, typing standardizedSolution(fit)
#  # in the console pane shows that the estimates can be
#  # found in the fourth column of rows 10 and 11.
#  estimate<-standardizedSolution(fit)[10:11,4]
#  # assign names to the estimates
#  names(estimate) <- c("textual","visual")
#  # determine the covariance matrix of the estimates typing
#  # lavInspect(fit, "vcov.std.all") in the console pane shows that the
#  # estimates can be found in the rows 10 and 11 crossed with
#  # columns 10 and 11
#  covariance<-list(lavInspect(fit, "vcov.std.all")[10:11,10:11])
#  # set a seed value
#  set.seed(100)
#  # test hypotheses with bain
#  results <- bain(estimate,"visual=textual=0; visual > textual >
#  0",n=ngroup,Sigma=covariance,group_parameters=2,joint_parameters = 0)
#  # display the results
#  print(results)
#  # obtain the descriptives table
#  summary(results, ci = 0.95)

