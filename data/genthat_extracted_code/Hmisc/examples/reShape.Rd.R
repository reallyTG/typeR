library(Hmisc)


### Name: reShape
### Title: Reshape Matrices and Serial Data
### Aliases: reShape
### Keywords: manip array

### ** Examples

set.seed(1)
Solder  <- factor(sample(c('Thin','Thick'),200,TRUE),c('Thin','Thick'))
Opening <- factor(sample(c('S','M','L'),  200,TRUE),c('S','M','L'))

tab <- table(Opening, Solder)
tab
reShape(tab)
# attach(tab)  # do further processing

# An example where a matrix is created from irregular vectors
follow <- data.frame(id=c('a','a','b','b','b','d'),
                     month=c(1, 2,  1,  2,  3,  2),
                     cholesterol=c(225,226, 320,319,318, 270))
follow
attach(follow)
reShape(cholesterol, id=id, colvar=month)
detach('follow')
# Could have done :
# reShape(cholesterol, triglyceride=trig, id=id, colvar=month)

# Create a data frame, reshaping a long dataset in which groups are
# formed not just by subject id but by combinations of subject id and
# visit number.  Also carry forward a variable that is supposed to be
# constant within subject-visit number combinations.  In this example,
# it is not constant, so an arbitrary visit number will be selected.
w <- data.frame(id=c('a','a','a','a','b','b','b','d','d','d'),
             visit=c(  1,  1,  2,  2,  1,  1,  2,  2,  2,  2),
                 k=c('A','A','B','B','C','C','D','E','F','G'),
               var=c('x','y','x','y','x','y','y','x','y','z'),
               val=1:10)
with(w,
     reShape(val, id=data.frame(id,visit),
             constant=data.frame(k), colvar=var))

# Get predictions from a regression model for 2 systematically
# varying predictors.  Convert the predictions into a matrix, with
# rows corresponding to the predictor having the most values, and
# columns corresponding to the other predictor
# d <- expand.grid(x2=0:1, x1=1:100)
# pred <- predict(fit, d)
# reShape(pred, id=d$x1, colvar=d$x2)  # makes 100 x 2 matrix


# Reshape a wide data frame containing multiple variables representing
# repeated measurements (3 repeats on 2 variables; 4 subjects)
set.seed(33)
n <- 4
w <- data.frame(age=rnorm(n, 40, 10),
                sex=sample(c('female','male'), n,TRUE),
                sbp1=rnorm(n, 120, 15),
                sbp2=rnorm(n, 120, 15),
                sbp3=rnorm(n, 120, 15),
                dbp1=rnorm(n,  80, 15),
                dbp2=rnorm(n,  80, 15),
                dbp3=rnorm(n,  80, 15), row.names=letters[1:n])
options(digits=3)
w


u <- reShape(w, base=c('sbp','dbp'), reps=3)
u
reShape(w, base=c('sbp','dbp'), reps=3, timevar='week', times=c(0,3,12))



