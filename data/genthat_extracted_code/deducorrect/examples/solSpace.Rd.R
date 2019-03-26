library(deducorrect)


### Name: solSpace
### Title: Solution space for missing values under equality constraints
### Aliases: solSpace solSpace.editmatrix solSpace.matrix

### ** Examples


# This example is taken from De Waal et al (2011) (Examples 9.1-9.2)
E <- editmatrix(c(
    "x1 + x2      == x3",
    "x2           == x4",
    "x5 + x6 + x7 == x8",
    "x3 + x8      == x9",
    "x9 - x10     == x11",
    "x6 >= 0",
    "x7 >= 0"
))


dat <- data.frame(
    x1=c(145,145),
    x2=c(NA,NA),
    x3=c(155,155),
    x4=c(NA,NA),
    x5=c(NA, 86),
    x6=c(NA,NA),
    x7=c(NA,NA),
    x8=c(86,86),
    x9=c(NA,NA),
    x10=c(217,217),
    x11=c(NA,NA)
)

# example with solSpace method for editmatrix
# example 9.1 of De Waal et al (2011).
x <-t(dat)[,1]
s <- solSpace(E,x)
s

# some values are uniquely determined and may be imputed directly:
imputess(x,s$x0,s$C)


# To impute everything, we choose z=1 (arbitrary)
z <- rep(1,sum(is.na(x)))
(y <- imputess(x,s$x0,s$C,z))

# did it work? (use a tolerance in checking to account for machine rounding)
# (FALSE means an edit is not violated)
any(violatedEdits(E,y,tol=1e-8))


# here's an example showing that solSpace only looks at missing values unless
# told otherwise.
Ey <- editmatrix(c(
    "yt == y1 + y2 + y3",
    "y4 == 0"))
y <- c(yt=10, y1=NA, y2=3, y3=7,y4=12)
# since solSpace by default checks the feasibility, we get no solution (since
# y4 violates the second edit)"
solSpace(Ey,y)


# If we ask solSpace not to check for feasibility, y4 is left alone (although
# the imputed answer is clearly wrong).
(s <- solSpace(Ey,y,checkFeasibility=FALSE))
imputess(y, s$x0, s$C)

# by setting 'adapt' we can include y4 in the imputation Since we know that
# with this adapt vector, imputation can be done consistently, we save some
# time by switching the feasibility check off.
(s <- solSpace(Ey,y,adapt=c(FALSE,FALSE,FALSE,FALSE,TRUE), 
  checkFeasibility=FALSE))
imputess(y,s$x0,s$C)





