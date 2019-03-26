library(Hmisc)


### Name: varclus
### Title: Variable Clustering
### Aliases: varclus print.varclus plot.varclus naclus naplot
###   combine.levels plotMultSim na.pattern
### Keywords: cluster multivariate category manip

### ** Examples

set.seed(1)
x1 <- rnorm(200)
x2 <- rnorm(200)
x3 <- x1 + x2 + rnorm(200)
x4 <- x2 + rnorm(200)
x <- cbind(x1,x2,x3,x4)
v <- varclus(x, similarity="spear")  # spearman is the default anyway
v    # invokes print.varclus
print(round(v$sim,2))
plot(v)


# plot(varclus(~ age + sys.bp + dias.bp + country - 1), abbrev=TRUE)
# the -1 causes k dummies to be generated for k countries
# plot(varclus(~ age + factor(disease.code) - 1))
#
#
# use varclus(~., data= fracmiss= maxlevels= minprev=) to analyze all
# "useful" variables - see dataframeReduce for details about arguments


df <- data.frame(a=c(1,2,3),b=c(1,2,3),c=c(1,2,NA),d=c(1,NA,3),
                 e=c(1,NA,3),f=c(NA,NA,NA),g=c(NA,2,3),h=c(NA,NA,3))
par(mfrow=c(2,2))
for(m in c("ward","complete","median")) {
  plot(naclus(df, method=m))
  title(m)
}
naplot(naclus(df))
n <- naclus(df)
plot(n); naplot(n)
na.pattern(df)      # builtin function


x <- c(1, rep(2,11), rep(3,9))
combine.levels(x)
x <- c(1, 2, rep(3,20))
combine.levels(x)


# plotMultSim example: Plot proportion of observations
# for which two variables are both positive (diagonals
# show the proportion of observations for which the
# one variable is positive).  Chance-correct the
# off-diagonals by subtracting the product of the
# marginal proportions.  On each subplot the x-axis
# shows month (0, 4, 8, 12) and there is a separate
# curve for females and males
d <- data.frame(sex=sample(c('female','male'),1000,TRUE),
                month=sample(c(0,4,8,12),1000,TRUE),
                x1=sample(0:1,1000,TRUE),
                x2=sample(0:1,1000,TRUE),
                x3=sample(0:1,1000,TRUE))
s <- array(NA, c(3,3,4))
opar <- par(mar=c(0,0,4.1,0))  # waste less space
for(sx in c('female','male')) {
  for(i in 1:4) {
    mon <- (i-1)*4
    s[,,i] <- varclus(~x1 + x2 + x3, sim='ccbothpos', data=d,
                      subset=d$month==mon & d$sex==sx)$sim
    }
  plotMultSim(s, c(0,4,8,12), vname=c('x1','x2','x3'),
              add=sx=='male', slimds=TRUE,
              lty=1+(sx=='male'))
  # slimds=TRUE causes separate  scaling for diagonals and
  # off-diagonals
}
par(opar)



