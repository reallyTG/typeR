library(lavaSearch2)


### Name: getVarCov2
### Title: Reconstruct the Conditional Variance Covariance Matrix
### Aliases: getVarCov2 getVarCov2.gls getVarCov2.lme getVarCov2.lvmfit

### ** Examples


## simulate data 
library(nlme)
n <- 5e1
mSim <- lvm(c(Y1~1*eta,Y2~1*eta,Y3~1*eta,eta~G))
latent(mSim) <- ~eta
transform(mSim,Id~Y1) <- function(x){1:NROW(x)}
set.seed(10)
dW <- lava::sim(mSim,n,latent = FALSE)
dW <- dW[order(dW$Id),,drop=FALSE]
dL <- reshape2::melt(dW,id.vars = c("G","Id"), variable.name = "time")
dL <- dL[order(dL$Id),,drop=FALSE]
dL$Z1 <- rnorm(NROW(dL))
dL$time.num <- as.numeric(as.factor(dL$time))

#### iid model #### 
e1.gls <- nlme::gls(Y1 ~ G, data = dW, method = "ML")
getVarCov2(e1.gls, cluster = 1:n)$Omega

#### heteroschedasticity ####
dW$group <- rbinom(n, size = 1, prob = 1/2)
dW$repetition <- as.numeric(as.factor(dW$group))
e2a.gls <- nlme::gls(Y1 ~ G, data = dW, method = "ML",
                    weights = varIdent(form =~ repetition|group))
getVarCov2(e2a.gls, cluster = 1:n)$Omega


e2b.gls <- nlme::gls(value ~ 0+time + time:G,
                   weight = varIdent(form = ~ time.num|time),
                   data = dL, method = "ML")
getVarCov2(e2b.gls, cluster = "Id")$Omega

#### compound symmetry ####
e3.gls <- nlme::gls(value ~ time + G,
                   correlation = corCompSymm(form = ~1| Id),
                   data = dL, method = "ML")
getVarCov2(e3.gls)$Omega

#### unstructured ####
e4.gls <- nlme::gls(value ~ time,
                    correlation = corSymm(form = ~time.num| Id),
                    weight = varIdent(form = ~ 1|time),
                    data = dL, method = "ML")
getVarCov2(e4.gls)$Omega

#### lvm model ####
m <- lvm(c(Y1~1*eta,Y2~1*eta,Y3~1*eta,eta~G))
latent(m) <- ~eta
e <- estimate(m, dW)
getVarCov2(e)




