library(eba)


### Name: wald.test
### Title: Testing Linear Hypotheses in Elimination-by-Aspects (EBA) Models
### Aliases: wald.test print.wald.test
### Keywords: models

### ** Examples

data(celebrities)                     # absolute choice frequencies
A <- list(c(1,10), c(2,10), c(3,10),
          c(4,11), c(5,11), c(6,11),
          c(7,12), c(8,12), c(9,12))  # the structure of aspects
eba1 <- eba(celebrities, A)           # fit elimination-by-aspects model

## Test whether JU, CY, and AJF have equal utility scale values
C1 <- rbind(c(0,0,0,1,-1, 0,0,0,0),
            c(0,0,0,1, 0,-1,0,0,0))
wald.test(eba1, C1)

## Test whether the three branch parameters are different
C2 <- rbind(c(0,0,0,0,0,0,0,0,0,1,-1, 0),
            c(0,0,0,0,0,0,0,0,0,1, 0,-1))
wald.test(eba1, C2, u.scale = FALSE)



