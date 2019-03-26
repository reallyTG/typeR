library(uniah)


### Name: uniah
### Title: Fit Unimodal Additive Hazards Model
### Aliases: uniah
### Keywords: Unimodal regression, Survival analysis, Constrained
###   estimation

### ** Examples

#require(Iso)
#require(survival)
#require(ahaz)

###
# 1. unimodal with known mode
###
# 1.1. create a test data set
test1=list(
  time=  c(9, 7, 5, 9, 5, 3, 8, 7, 9, 7),
  status=c(1, 1, 0, 1, 0, 1, 1, 1, 1, 1),
  z=     c(2, 8, 1, 3, 2, 4, 4, 6, 8, 3)
)

# 1.2. Fit isotonic proportional hazards model
res1=uniah(Surv(time,status)~z, data=test1, shape='unimodal', mode='known', M=5)

# 1.3. print result
res1

# 1.4 figure
plot(res1)

###
# 2. unimodal with known mode with treatment group
###
# 2.1. create a test data set 1
test1=list(
  time=  c(2, 7, 3, 7, 8, 1, 2, 2, 9, 8),
  status=c(1, 0, 1, 1, 1, 0, 0, 1, 1, 0),
  z=     c(4, 9, 5, 5, 1, 3, 8, 8, 1, 2),
  trt=   c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0)
)

# 2.2. Fit isotonic proportional hazards model
res2=uniah(Surv(time,status)~z, trt=trt, data=test1, shape='unimodal', mode='known', M=6)

# 2.3. print result
res2

# 2.4 figure
plot(res2)

###
# 3. ushape with unknown mode
###
# 3.1. create a test data set
test3=list(
  time=  c(3, 4, 5, 4, 1, 8, 1, 9, 2, 8, 2, 5, 7, 2, 2, 3, 3, 1, 1, 8),
  status=c(1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1),
  z=     c(10,4, 6, 9, 2, 9, 9, 7, 6, 1, 2, 2, 7, 4, 8, 5, 7,10, 4, 8)
)

# 3.2. Fit isotonic proportional hazards model
res3=uniah(Surv(time,status)~z, data=test3, shape='ushape', mode='unknown')

# 3.3 print result
res3

# 3.4 Figure
plot(res3)

###
# 4. More arguments for plot.uniah (S3method)
###
# 4.1 renames labels
#plot(res3, main="Ush", ylab="RD", xlab="Cov", lglab="Cov wt obs", lgloc="center", lgcex=1.5)

# 4.2 removes labels and changes line and point parameters
#plot(res3, main=NA, ylab=NA, xlab=NA, lglab=NA, lty=2, lcol=2, lwd=2, pch=3, pcol=4, pcex=1.5)




