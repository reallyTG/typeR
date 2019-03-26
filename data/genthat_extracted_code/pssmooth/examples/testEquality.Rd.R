library(pssmooth)


### Name: testEquality
### Title: Testing of the Null Hypothesis of Equal Marginal Causal Effect
###   Predictiveness Curves for Two Biomarkers, Endpoints, or Baseline
###   Covariate Subgroups
### Aliases: testEquality

### ** Examples

n <- 500
Z <- rep(0:1, each=n/2)
S <- MASS::mvrnorm(n, mu=c(2,2,3), Sigma=matrix(c(1,0.9,0.7,0.9,1,0.7,0.7,0.7,1), nrow=3))
p <- pnorm(drop(cbind(1,Z,(1-Z)*S[,2],Z*S[,3]) %*% c(-1.2,0.2,-0.02,-0.2)))
Y <- sapply(p, function(risk){ rbinom(1,1,risk) })
X <- rbinom(n,1,0.5)
# delete S(1) in placebo recipients
S[Z==0,3] <- NA
# delete S(0) in treatment recipients
S[Z==1,2] <- NA
# generate the indicator of being sampled into the phase 2 subset
phase2 <- rbinom(n,1,0.4)
# delete Sb, S(0) and S(1) in controls not included in the phase 2 subset
S[Y==0 & phase2==0,] <- c(NA,NA,NA)
# delete Sb in cases not included in the phase 2 subset
S[Y==1 & phase2==0,1] <- NA
data <- data.frame(X,Z,S[,1],ifelse(Z==0,S[,2],S[,3]),Y)
colnames(data) <- c("X","Z","Sb","S","Y")
qS <- quantile(data$S, probs=c(0.05,0.95), na.rm=TRUE)
grid <- seq(qS[1], qS[2], length.out=3)
out0 <- riskCurve(formula=Y ~ S, bsm="Sb", tx="Z", data=data[data$X==0,], psGrid=grid)
out1 <- riskCurve(formula=Y ~ S, bsm="Sb", tx="Z", data=data[data$X==1,], psGrid=grid)
boot0 <- bootRiskCurve(formula=Y ~ S, bsm="Sb", tx="Z", data=data[data$X==0,],
                       psGrid=grid, iter=2, seed=10)
boot1 <- bootRiskCurve(formula=Y ~ S, bsm="Sb", tx="Z", data=data[data$X==1,],
                       psGrid=grid, iter=2, seed=15)

testEquality(out0, out1, boot0, boot1, contrast="te", null="H04")




