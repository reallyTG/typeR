library(DiceOptim)


### Name: qEI
### Title: Analytical expression of the multipoint expected improvement
###   (qEI) criterion
### Aliases: qEI
### Keywords: models, optimization parallel

### ** Examples

## No test: 
set.seed(007)

# Monte-Carlo validation

# a 4-d, 81-points grid design, and the corresponding response
d <- 4; n <- 3^d
design <- do.call(expand.grid,rep(list(seq(0,1,length=3)),d))
names(design) <- paste("x",1:d,sep="")
y <- data.frame(apply(design, 1, hartman4))
names(y) <- "y"

# learning
model <- km(~1, design=design, response=y, control=list(trace=FALSE))

# pick up 10 points sampled from the 1-point expected improvement
q <- 10
X <- sampleFromEI(model,n=q)
# simulation of the minimum of the kriging random vector at X
t1 <- proc.time()
newdata <- as.data.frame(X)
colnames(newdata) <- colnames(model@X)

krig  <- predict(object=model, newdata=newdata,type="UK",se.compute=TRUE, cov.compute=TRUE)
mk <- krig$mean
Sigma.q <- krig$cov
mychol <- chol(Sigma.q)
nsim <- 300000
white.noise <- rnorm(n=nsim*q)
minYsim <- apply(crossprod(mychol,matrix(white.noise,nrow=q)) + mk,2,min)
# simulation of the improvement (minimization)
qImprovement <- (min(model@y)-minYsim)*((min(model@y)-minYsim) > 0)

# empirical expectation of the improvement and confident interval (95%)
eiMC <- mean(qImprovement)
confInterv <- c(eiMC - 1.96*sd(qImprovement)*1/sqrt(nsim),eiMC + 1.96*sd(qImprovement)*1/sqrt(nsim))

# MC estimation of the qEI
print(eiMC)
t2 <- proc.time()
# qEI with analytical formula
qEI(X,model,fastCompute= FALSE)
t3 <- proc.time()
# qEI with fast computation trick
qEI(X,model)
t4 <- proc.time()
t2-t1  # Time of MC computation
t3-t2  # Time of normal computation
t4-t3  # Time of fast computation
## End(No test)



