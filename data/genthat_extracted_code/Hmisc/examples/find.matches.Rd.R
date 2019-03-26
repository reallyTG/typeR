library(Hmisc)


### Name: find.matches
### Title: Find Close Matches
### Aliases: find.matches summary.find.matches print.find.matches
###   matchCases
### Keywords: math multivariate htest

### ** Examples

y <- rbind(c(.1, .2),c(.11, .22), c(.3, .4), c(.31, .41), c(.32, 5))
x <- rbind(c(.09,.21), c(.29,.39))
y
x
w <- find.matches(x, y, maxmatch=5, tol=c(.05,.05))


set.seed(111)       # so can replicate results
x <- matrix(runif(500), ncol=2)
y <- matrix(runif(2000), ncol=2)
w <- find.matches(x, y, maxmatch=5, tol=c(.02,.03))
w$matches[1:5,]
w$distance[1:5,]
# Find first x with 3 or more y-matches
num.match <- apply(w$matches, 1, function(x)sum(x > 0))
j <- ((1:length(num.match))[num.match > 2])[1]
x[j,]
y[w$matches[j,],]


summary(w)


# For many applications would do something like this:
# attach(df1)
# x <- cbind(age, sex) # Just do as.matrix(df1) if df1 has no factor objects
# attach(df2)
# y <- cbind(age, sex)
# mat <- find.matches(x, y, tol=c(5,0)) # exact match on sex, 5y on age


# Demonstrate matchCases
xcase     <- c(1,3,5,12)
xcontrol  <- 1:6
idcase    <- c('A','B','C','D')
idcontrol <- c('a','b','c','d','e','f')
ycase     <- c(11,33,55,122)
ycontrol  <- c(11,22,33,44,55,66)
matchCases(xcase, ycase, idcase,
           xcontrol, ycontrol, idcontrol, tol=1)


# If y is a binary response variable, the following code
# will produce a Mantel-Haenszel summary odds ratio that 
# utilizes the matching.
# Standard variance formula will not work here because
# a control will match more than one case
# WARNING: The M-H procedure exemplified here is suspect 
# because of the small strata and widely varying number
# of controls per case.


x    <- c(1, 2, 3, 3, 3, 6, 7, 12,  1, 1:7)
y    <- c(0, 0, 0, 1, 0, 1, 1,  1,  1, 0, 0, 0, 0, 1, 1, 1)
case <- c(rep(TRUE, 8), rep(FALSE, 8))
id   <- 1:length(x)


m <- matchCases(x[case],  y[case],  id[case],
                x[!case], y[!case], id[!case], tol=1)
iscase <- m$type=='case'
# Note: the first tapply on insures that event indicators are
# sorted by case id.  The second actually does something.
event.case    <- tapply(m$y[iscase],  m$idcase[iscase],  sum)
event.control <- tapply(m$y[!iscase], m$idcase[!iscase], sum)
n.control     <- tapply(!iscase,      m$idcase,          sum)
n             <- tapply(m$y,          m$idcase,          length)
or <- sum(event.case * (n.control - event.control) / n) /
      sum(event.control * (1 - event.case) / n)
or


# Bootstrap this estimator by sampling with replacement from
# subjects.  Assumes id is unique when combine cases+controls
# (id was constructed this way above).  The following algorithms
# puts all sampled controls back with the cases to whom they were
# originally matched.


ids <- unique(m$id)
idgroups <- split(1:nrow(m), m$id)
B   <- 50   # in practice use many more
ors <- numeric(B)
# Function to order w by ids, leaving unassigned elements zero
align <- function(ids, w) {
  z <- structure(rep(0, length(ids)), names=ids)
  z[names(w)] <- w
  z
}
for(i in 1:B) {
  j <- sample(ids, replace=TRUE)
  obs <- unlist(idgroups[j])
  u <- m[obs,]
  iscase <- u$type=='case'
  n.case <- align(ids, tapply(u$type, u$idcase, 
                              function(v)sum(v=='case')))
  n.control <- align(ids, tapply(u$type, u$idcase,
                                 function(v)sum(v=='control')))
  event.case <- align(ids, tapply(u$y[iscase],  u$idcase[iscase],  sum))
  event.control <- align(ids, tapply(u$y[!iscase], u$idcase[!iscase], sum))
  n <- n.case + n.control
  # Remove sets having 0 cases or 0 controls in resample
  s             <- n.case > 0 & n.control > 0
  denom <- sum(event.control[s] * (n.case[s] - event.case[s]) / n[s])
  or <- if(denom==0) NA else 
   sum(event.case[s] * (n.control[s] - event.control[s]) / n[s]) / denom
  ors[i] <- or
}
describe(ors)



