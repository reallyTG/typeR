library(SurvTrunc)


### Name: coxDT
### Title: Fit Cox Proportional Hazards Regression Model Under Double
###   Truncation
### Aliases: coxDT

### ** Examples

###### Example: AIDS data set #####
coxDT(Surv(Induction.time,status)~Adult,L.time,R.time,data=AIDS,B.SE.np=2)

# WARNING: To save computation time, number of bootstrap resamples for standard error set to 2.
# Note: The minimum recommendation is 200, which is the default setting.
##### Including time-dependent covariates #####
# Accomodating time-dependent covariates in the model is similar to the accomodation in coxph

# The data set may look like the following:

# subject start stop event treatment test.score L.time R.time
# 1       T.10  T.11  1    X.1       Z.1        L.1    R.1
# 2       T.20  T.21  0    X.2       Z.21       L.2    R.2
# 2       T.21  T.22  1    X.2       Z.22       L.2    R.2
#...

# Here the variable 'treatment' and the trunction times 'L.time' and 'R.time' stay the same
# from line to line. The variable 'test.score' will vary line to line. In this example,
# subject 1 has only one recorded measurement for test.score, and therefore only has one row
# of observations. Subject 2 has two recorded measurements for test score, and therefore has
# two rows of observations. In this example, it is assumed that the test score for subject 2
# is fixed at Z.21 between (T.20,T.21] and fixed at Z.22 between (T.21,T.22]. Notice that
# the event indicator is 0 in the first row of observations corresponding to subject 2,
# since they have not yet experienced the event. The status variable changes to 1 in the
# row where the event occurs.

# Note: Start time cannot preceed left truncation time and must be strictly less than stop time.

# example


test.data <- data.frame(
list(subject.id = c(1, 2, 2, 3, 4, 4, 5, 6, 7, 8, 8, 9, 10),
    start      = c(3, 5, 7, 2, 1, 2, 6, 5, 6, 6, 7, 2, 17),
    stop       = c(4, 7, 8, 5, 2, 6, 9, 8, 7, 7, 9, 6, 21),
    event      = c(1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1),
    treatment  = c(0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1),
    test.score = c(5, 6, 7, 4, 6, 9, 3, 4, 4, 7, 6, 4, 12),
    L.time     = c(2, 4, 4, 2, 1, 1, 4, 5, 4, 3, 3, 1, 10),
    R.time     = c(6, 9, 9, 6, 7, 7, 9, 9, 8, 8, 9, 8, 24)))

 coxDT(Surv(start,stop,event)~treatment+test.score,L.time,R.time,data=test.data,
 time.var=TRUE,subject=subject.id,B.SE.np=2)



