library(condSURV)


### Name: Beran
### Title: Estimation of the conditional distribution function of the
###   response, given the covariate under random censoring.
### Aliases: Beran

### ** Examples

obj <- with(colonCS, survCS(time1, event1, Stime, event))
obj0 <- obj$data

#P(T>y|age=45)
library(KernSmooth)
h <- dpik(colonCS$age)
Beran(time = obj0$Stime, status = obj0$event, covariate = colonCS$age,
x = 45, y = 730, bw = h)

#P(T<=y|age=45)
Beran(time = obj0$Stime, status = obj0$event, covariate = colonCS$age,
x = 45, y = 730, bw = h, lower.tail = TRUE)



