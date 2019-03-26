library(IncDTW)


### Name: idtw
### Title: Incremental DTW
### Aliases: idtw
### Keywords: cluster ts

### ** Examples

Q <- cumsum(rnorm(100))
C <- Q[11:100] + rnorm(90, 0, 0.5)
newObs <-  c(2,3)# new observation
base <- dtw(Q=Q, C=C, ws = 15, return_diffM = TRUE) # the ordinary calculation


#--- recalculation from scratch with new observations
result0 <- dtw(Q=Q, C=c(C, newObs), ws = 15,  return_diffM = TRUE) # the ordinary calculation

#--- the incremental step with new observations
result1 <- idtw(Q, C, ws = 15, newO = newObs, gcm=base$gcm, dm=base$dm, diffM = base$diffM, 
               return_diffp = TRUE,  return_diffM = TRUE) 

#--- the incremental step with new observations, 
#     but already calculated additive costMatrix cm_add
mQ <- matrix(Q, ncol = length(newObs), nrow = length(Q), byrow = FALSE)
mC <- matrix(newObs, ncol = length(newObs), nrow = length(Q), byrow = TRUE)
cm_add <- matrix(abs(mQ - mC), ncol = length(newObs))
result2 <- idtw(Q=cm_add, C="cm_add", ws = 15, newO = newObs, gcm=base$gcm, dm=base$dm) 

c(result0$distance, result1$distance, result2$distance)


#--- now with integers
Q <- 1:10
C <- 2:20
base <- dtw(Q=Q, C=C, ws = 15, return_diffM = TRUE) # the ordinary calculation
# new observation
newObs <-  c(2L,3L)
# the incremental step with new observations
tmp1 <- idtw(Q, C, newO = newObs, gcm=base$gcm, dm=base$dm, diffM = base$diffM, 
      return_diffp = TRUE, ws = 15, return_diffM = TRUE) 
str(tmp1)






