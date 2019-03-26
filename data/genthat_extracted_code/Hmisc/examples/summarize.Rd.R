library(Hmisc)


### Name: summarize
### Title: Summarize Scalars or Matrices by Cross-Classification
### Aliases: summarize asNumericMatrix matrix2dataFrame
### Keywords: category manip multivariate

### ** Examples

## Not run: 
##D s <- summarize(ap>1, llist(size=cut2(sz, g=4), bone), mean,
##D                stat.name='Proportion')
##D dotplot(Proportion ~ size | bone, data=s7)
## End(Not run)

set.seed(1)
temperature <- rnorm(300, 70, 10)
month <- sample(1:12, 300, TRUE)
year  <- sample(2000:2001, 300, TRUE)
g <- function(x)c(Mean=mean(x,na.rm=TRUE),Median=median(x,na.rm=TRUE))
summarize(temperature, month, g)
mApply(temperature, month, g)

mApply(temperature, month, mean, na.rm=TRUE)
w <- summarize(temperature, month, mean, na.rm=TRUE)
library(lattice)
xyplot(temperature ~ month, data=w) # plot mean temperature by month

w <- summarize(temperature, llist(year,month), 
               quantile, probs=c(.5,.25,.75), na.rm=TRUE, type='matrix')
xYplot(Cbind(temperature[,1],temperature[,-1]) ~ month | year, data=w)
mApply(temperature, llist(year,month),
       quantile, probs=c(.5,.25,.75), na.rm=TRUE)

# Compute the median and outer quartiles.  The outer quartiles are
# displayed using "error bars"
set.seed(111)
dfr <- expand.grid(month=1:12, year=c(1997,1998), reps=1:100)
attach(dfr)
y <- abs(month-6.5) + 2*runif(length(month)) + year-1997
s <- summarize(y, llist(month,year), smedian.hilow, conf.int=.5)
s
mApply(y, llist(month,year), smedian.hilow, conf.int=.5)

xYplot(Cbind(y,Lower,Upper) ~ month, groups=year, data=s, 
       keys='lines', method='alt')
# Can also do:
s <- summarize(y, llist(month,year), quantile, probs=c(.5,.25,.75),
               stat.name=c('y','Q1','Q3'))
xYplot(Cbind(y, Q1, Q3) ~ month, groups=year, data=s, keys='lines')
# To display means and bootstrapped nonparametric confidence intervals
# use for example:
s <- summarize(y, llist(month,year), smean.cl.boot)
xYplot(Cbind(y, Lower, Upper) ~ month | year, data=s)

# For each subject use the trapezoidal rule to compute the area under
# the (time,response) curve using the Hmisc trap.rule function
x <- cbind(time=c(1,2,4,7, 1,3,5,10),response=c(1,3,2,4, 1,3,2,4))
subject <- c(rep(1,4),rep(2,4))
trap.rule(x[1:4,1],x[1:4,2])
summarize(x, subject, function(y) trap.rule(y[,1],y[,2]))

## Not run: 
##D # Another approach would be to properly re-shape the mm array below
##D # This assumes no missing cells.  There are many other approaches.
##D # mApply will do this well while allowing for missing cells.
##D m <- tapply(y, list(year,month), quantile, probs=c(.25,.5,.75))
##D mm <- array(unlist(m), dim=c(3,2,12), 
##D             dimnames=list(c('lower','median','upper'),c('1997','1998'),
##D                           as.character(1:12)))
##D # aggregate will help but it only allows you to compute one quantile
##D # at a time; see also the Hmisc mApply function
##D dframe <- aggregate(y, list(Year=year,Month=month), quantile, probs=.5)
##D 
##D # Compute expected life length by race assuming an exponential
##D # distribution - can also use summarize
##D g <- function(y) { # computations for one race group
##D   futime <- y[,1]; event <- y[,2]
##D   sum(futime)/sum(event)  # assume event=1 for death, 0=alive
##D }
##D mApply(cbind(followup.time, death), race, g)
##D 
##D # To run mApply on a data frame:
##D xn <- asNumericMatrix(x)
##D m <- mApply(xn, race, h)
##D # Here assume h is a function that returns a matrix similar to x
##D matrix2dataFrame(m)
##D 
##D 
##D # Get stratified weighted means
##D g <- function(y) wtd.mean(y[,1],y[,2])
##D summarize(cbind(y, wts), llist(sex,race), g, stat.name='y')
##D mApply(cbind(y,wts), llist(sex,race), g)
##D 
##D # Compare speed of mApply vs. by for computing 
##D d <- data.frame(sex=sample(c('female','male'),100000,TRUE),
##D                 country=sample(letters,100000,TRUE),
##D                 y1=runif(100000), y2=runif(100000))
##D g <- function(x) {
##D   y <- c(median(x[,'y1']-x[,'y2']),
##D          med.sum =median(x[,'y1']+x[,'y2']))
##D   names(y) <- c('med.diff','med.sum')
##D   y
##D }
##D 
##D system.time(by(d, llist(sex=d$sex,country=d$country), g))
##D system.time({
##D              x <- asNumericMatrix(d)
##D              a <- subsAttr(d)
##D              m <- mApply(x, llist(sex=d$sex,country=d$country), g)
##D             })
##D system.time({
##D              x <- asNumericMatrix(d)
##D              summarize(x, llist(sex=d$sex, country=d$country), g)
##D             })
##D 
##D # An example where each subject has one record per diagnosis but sex of
##D # subject is duplicated for all the rows a subject has.  Get the cross-
##D # classified frequencies of diagnosis (dx) by sex and plot the results
##D # with a dot plot
##D 
##D count <- rep(1,length(dx))
##D d <- summarize(count, llist(dx,sex), sum)
##D Dotplot(dx ~ count | sex, data=d)
## End(Not run)
d <- list(x=1:10, a=factor(rep(c('a','b'), 5)),
          b=structure(letters[1:10], label='label for b'),
          d=c(rep(TRUE,9), FALSE), f=pi*(1 : 10))
x <- asNumericMatrix(d)
attr(x, 'origAttributes')
matrix2dataFrame(x)

detach('dfr')

# Run summarize on a matrix to get column means
x <- c(1:19,NA)
y <- 101:120
z <- cbind(x, y)
g <- c(rep(1, 10), rep(2, 10))
summarize(z, g, colMeans, na.rm=TRUE, stat.name='x')
# Also works on an all numeric data frame
summarize(as.data.frame(z), g, colMeans, na.rm=TRUE, stat.name='x')



