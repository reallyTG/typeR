library(survidm)


### Name: Beran
### Title: Estimation of the conditional distribution function of the
###   response, given the covariate under random censoring.
### Aliases: Beran

### ** Examples

obj <- with(colonIDM, survIDM(time1, event1, Stime, event))
obj0 <- obj$data

#P(T>y|age=45)
library(KernSmooth)
h <- dpik(colonIDM$age)
Beran(time = obj0$Stime, status = obj0$event, covariate = colonIDM$age,
x = 45, y = 730, bw = h)

#P(T<=y|age=45)
Beran(time = obj0$Stime, status = obj0$event, covariate = colonIDM$age,
x = 45, y = 730, bw = h, lower.tail = TRUE)



