library(permGS)


### Name: permGS
### Title: permGS
### Aliases: permGS permGS-package

### ** Examples

## IPZ method based on logrank test with 1000 restricted random permutations
x <- createPermGS(1000, TRUE, "IPZ", type="logrank")

T <- rexp(100) ## event times
R <- runif(100, 0, 12)  ## recruitment times
Z <- rbinom(100, 1, 0.5)  ## treatment assignment
C <- rexp(100) ## drop-out times

## two-stage design
t1 <- 9  ## calendar time of interim analysis
t2 <- 18  ## calendar time of final analysis

## Stage 1
data.t1 <- data.frame(time=pmin(T, C, max(0, (t1-R))), status=(T<=pmin(C, t1-R)), trt=Z)
data.t1 <- data.t1[R <= t1,] 
x <- nextStage(x, 0.00153, Surv(time, status) ~ trt, data.t1)
summary(x)

if(!x$results$reject[1]) { ## Stage 2
   data.t2 <- data.frame(time=pmin(T, C, max(0, (t2-R))), status=(T<=pmin(C, t2-R)), trt=Z)
   data.t2 <- data.t2[R <= t2,]
   data.t2$strata <- rep.int(c(1,2), c(nrow(data.t1), nrow(data.t2)-nrow(data.t1)))
   x <- nextStage(x, alpha=0.025, Surv(time, status) ~ trt + strata(strata), data.t2)           
   summary(x)
}




