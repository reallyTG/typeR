library(impimp)


### Name: impestcond
### Title: Conditional Imprecise Estimation
### Aliases: impestcond
### Keywords: robust

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
AimpB <- impimp(A, B, method = "domain")
BimpA <- impimp(B, A, method = "domain")
AB <- rbindimpimp(AimpB, BimpA)

myevent <- list(impimp_event(z1 = 1,z2 = 0),
                impimp_event(z1 = c(0,1), z2 = 1))
cond <- list(impimp_event(x1 = 1))

impestcond(AB, event = myevent, condition = cond)

constr <- list(impimp_event(y1 = 0, z1 = 0))
impestcond(AB, event = myevent, condition = cond,
           constraints = constr)




