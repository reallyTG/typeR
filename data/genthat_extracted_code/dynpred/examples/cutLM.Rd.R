library(dynpred)


### Name: cutLM
### Title: Create landmark data set
### Aliases: cutLM
### Keywords: univar

### ** Examples

test0 <- data.frame(id=c(1,1,1,2,2,2),survyrs=c(2.3,2.3,2.3,2.7,2.7,2.7),
  survstat=c(1,1,1,0,0,0),age=c(76,76,76,68,68,68),gender=c(1,1,1,2,2,2),
  bp=c(80,84,88,92,90,89),bptime=c(1,2,2.2,0,1,2))
cutLM(test0, outcome=list(time="survyrs", status="survstat"),
  LM=1, horizon=2.5, covs=list(fixed=c("age","gender"),varying="bp"),
  format="long", id="id", rtime="bptime")
# Note how the previous example does not use the value of the time-varying
# covariate AT time=LM, only just before (if available). This is in line
# with the time-varying covariates being predictable.
# If you want the value of the time-varying covariate at time=LM if it
# changes value at LM, then use right=FALSE
cutLM(test0, outcome=list(time="survyrs", status="survstat"),
  LM=1, horizon=2.5, covs=list(fixed=c("age","gender"),varying="bp"),
  format="long", id="id", rtime="bptime", right=FALSE)

# An example of a time-varying covariate in wide format; recyrs and recstat
# are time and status of a (cancer) recurrence. Here it is assumed that the
# value of the time-varying covariate is 0 and changes value to 1 at recyrs.
# The status variable is not used!
test1 <- data.frame(id=1:4,survyrs=c(7.6,8.4,5.3,2.6),survstat=c(0,1,1,0),
  age=c(48,52,76,18),gender=c(1,2,2,1),recyrs=c(7.6,5.2,0.8,2.6),
  recstat=c(0,1,1,0))
cutLM(test1, outcome=list(time="survyrs", status="survstat"),
  LM=3, horizon=8, covs=list(fixed=c("id","age","gender"),varying="recyrs"))

# The same example in long format, similar to (but not the same as) the way
# one would use a time-varying covariate in long format.
test2 <- data.frame(id=c(1,2,2,3,3,4),survyrs=c(7.6,8.4,8.4,5.3,5.3,2.6),
  survstat=c(0,1,1,1,1,0),age=c(48,52,52,76,76,18),gender=c(1,2,2,2,2,1),
  rec=c(0,0,1,0,1,0),rectime=c(0,0,5.2,0,0.8,0))
cutLM(test2, outcome=list(time="survyrs", status="survstat"),
  LM=3, horizon=8, covs=list(fixed=c("age","gender"),varying="rec"),
  format="long", id="id", rtime="rectime")



