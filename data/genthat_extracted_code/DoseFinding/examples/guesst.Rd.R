library(DoseFinding)


### Name: guesst
### Title: Calculate guesstimates based on prior knowledge
### Aliases: guesst

### ** Examples

## Emax model
## Expected percentage of maximum effect: 0.8 is associated with
## dose 0.3 (d,p)=(0.3, 0.8), dose range [0,1]
emx1 <- guesst(d=0.3, p=0.8, model="emax")
## local approach
emx2 <- guesst(d=0.3, p=0.8, model="emax", local = TRUE, Maxd = 1)
## plot models
models <- Mods(emax=c(emx1, emx2), doses=c(0,1))
plot(models)

## Logistic model
## Select two (d,p) pairs (0.2, 0.5) and (0.6, 0.95)
lgc1 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "logistic")
## local approach
lgc2 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "logistic", 
               local = TRUE, Maxd = 1)
## plot models
models <- Mods(logistic = rbind(lgc1, lgc2), doses=c(0,1))
plot(models)

## Beta Model
## Select one pair (d,p): (0.5,0.5)
## dose, where maximum occurs: 0.8
bta <- guesst(d=0.5, p=0.5, model="betaMod", dMax=0.8, scal=1.2, Maxd=1)
## plot
models <- Mods(betaMod = bta, doses=c(0,1), addArgs = list(scal = 1.2))
plot(models)

## Sigmoid Emax model
## Select two (d,p) pairs (0.2, 0.5) and (0.6, 0.95)
sgE1 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "sigEmax")
## local approach
sgE2 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "sigEmax",
               local = TRUE, Maxd = 1)
models <- Mods(sigEmax = rbind(sgE1, sgE2), doses=c(0,1))
plot(models)

## Quadratic model
## For the quadratic model it is assumed that the maximum effect occurs at 
## dose 0.7
quad <- guesst(d = 0.7, p = 1, "quadratic")
models <- Mods(quadratic = quad, doses=c(0,1))
plot(models)

## exponential model
## (d,p) = (0.8,0.5)
expo <- guesst(d = 0.8, p = 0.5, "exponential", Maxd=1)
models <- Mods(exponential = expo, doses=c(0,1))
plot(models)



