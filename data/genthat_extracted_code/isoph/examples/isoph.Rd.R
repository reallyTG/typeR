library(isoph)


### Name: isoph
### Title: Fit Isotonic Proportional Hazards Model
### Aliases: isoph
### Keywords: Isotonic regression, Survival analysis, Constrained
###   estimation

### ** Examples

###
# 1. time-independent covariate with monotone increasing effect
###
# 1.1. create a test data set 1
test1=list(
  time=  c(2, 5, 1, 7, 9, 5, 3, 6, 8, 9, 7, 4, 5, 2, 8),
  status=c(0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
  z=     c(2, 1, 1, 3, 5, 6, 7, 9, 3, 0, 2, 7, 3, 9, 4)
)

# 1.2. Fit isotonic proportional hazards model
res1 = isoph(Surv(time, status)~z, data=test1, shape="increasing")

# 1.3. print result
print(res1)
plot(res1)

###
# 2. time-independent covariate with monotone increasing effect and treatment group
###
# 2.1. create a test data set 1
test2=list(
  time=  c(2, 5, 1, 7, 9, 5, 3, 6, 8, 9, 7, 4, 5, 2, 8),
  status=c(0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1),
  z=     c(2, 1, 1, 3, 5, 6, 7, 9, 3, 0, 2, 7, 3, 9, 4),
  trt=   c(1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0)
)

# 2.2. Fit isotonic proportional hazards model
res2 = isoph(Surv(time, status)~z, trt=trt, data=test2, shape="increasing")

# 2.3. print result
print(res2)
plot(res2)



