library(impimp)


### Name: impest
### Title: Imprecise Estimation
### Aliases: impest
### Keywords: robust

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
AimpB <- impimp(A, B, method = "variable_wise")
BimpA <- impimp(B, A, method = "variable_wise")
AB <- rbindimpimp(AimpB, BimpA)

## P(Z1=1, Z2=0)
myevent1 <- list(impimp_event(z1 = 1, z2 = 0))
impest(AB, event = myevent1)

## P[(Z1,Z2) in {(1,0),(0,1),(1,1)}]
myevent2 <- list(impimp_event(z1 = 1,z2 = 0),
                 impimp_event(z1 = c(0,1), z2 = 1))
impest(AB, event = myevent2)




