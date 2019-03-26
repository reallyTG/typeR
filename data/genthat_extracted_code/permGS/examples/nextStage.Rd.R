library(permGS)


### Name: nextStage
### Title: nextStage
### Aliases: nextStage

### ** Examples

## Two-stage design with one-sided O'Brien-Fleming boundaries using IPZ method
x <- createPermGS(1000, TRUE, "IPZ")

t1 <- 9  ## calendar time of interim analysis
t2 <- 18  ## calendar time of final analysis

T <- rexp(100) ## event times
R <- runif(100, 0, 12)  ## recruitment times
Z <- rbinom(100, 1, 0.5)  ## treatment assignment
C <- rexp(100) ## drop-out times

## Stage 1 data
data.t1 <- data.frame(time=pmin(T, C, max(0, (t1-R))), status=(T<=pmin(C, t1-R)), trt=Z)
data.t1 <- data.t1[R <= t1,]

## Stage 2 data
data.t2 <- data.frame(time=pmin(T, C, max(0, (t2-R))), status=(T<=pmin(C, t2-R)), trt=Z)
data.t2 <- data.t2[R <= t2,] 
x <- nextStage(x, 0.00153, Surv(time, status) ~ trt, data.t1)
summary(x)

if(!x$results$reject[1]) {
   data.t2$strata <- rep.int(c(1,2), c(nrow(data.t1), nrow(data.t2)-nrow(data.t1)))
   x <- nextStage(x, 0.025, Surv(time, status) ~ trt + strata(strata), data.t2)
   summary(x)
}



