## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(logisticRR)
n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3); W[sample(1:n, n/3)] = 2
Z <- rep(0, n)
Z[sample(1:n, n/2)] <- "female"; Z <- ifelse(Z == 0, "male", Z)
dummyZ <- ifelse(Z == "female", 1, 0)
Y <- rbinom(n, 1, plogis(X - W + 2*dummyZ))
dat <- as.data.frame(cbind(Y, X, W, Z))
dat$X <- as.numeric(dat$X); dat$X <- ifelse(dat$X == 2, 1, 0)
dat$Y <- as.numeric(dat$Y); dat$Y <- ifelse(dat$Y == 2, 1, 0)
dat$W <- as.factor(dat$W)
dat$Z <- as.factor(dat$Z)
head(dat)

## ------------------------------------------------------------------------
simresult200 <- logisticRR(Y ~ X + W + Z, data = dat, boot = TRUE, n.boot = 200)
simresult200$RR
var(simresult200$boot.rr)
simresult200$delta.var

## print out conditioning 
simresult200$fix.cov

## ------------------------------------------------------------------------
simresult1000 <- logisticRR(Y ~ X + W + Z, data = dat, boot = TRUE, n.boot = 1000)
var(simresult1000$boot.rr)
simresult1000$delta.var

## ------------------------------------------------------------------------
levels(dat$W)
levels(dat$Z)
adjusted <- cbind(rep(levels(dat$W), 2), rep(levels(dat$Z), each = 3))
adjusted <- as.data.frame(adjusted)
names(adjusted) <- c("W", "Z")

## ------------------------------------------------------------------------
## compare with odds ratio 
results <- list()
for(i in 1:nrow(adjusted)){
  results[[i]] <- logisticRR(Y ~ X + W + Z, data = dat, fixcov = adjusted[i,], boot = FALSE)
}


## adjusted relative risk
# female
print(c(results[[1]]$RR, results[[2]]$RR, results[[3]]$RR))
# male
print(c(results[[4]]$RR, results[[5]]$RR, results[[6]]$RR))


## adjusted odds ratio
## all the same : by the assumption of logistic regression
print(exp(coefficients(results[[1]]$fit)[2]))

# betas <- coefficients(fit)
# exposed <- exp(-predict(fit, expose.cov, type = "link"))
# unexposed <- exp(-predict(fit, unexpose.cov, type = "link"))
# RR <- (1 + unexposed) / (1 + exposed)



## ------------------------------------------------------------------------
dat2 <- dat 
dat2$Y <- ifelse(dat$Y == 1, rbinom(n, 1, 0.2), rbinom(n, 1, 0.01))
## compare with odds ratio 
results2 <- list()
for(i in 1:nrow(adjusted)){
  results2[[i]] <- logisticRR(Y ~ X + W + Z, data = dat2, fixcov = adjusted[i,], boot = TRUE, n.boot = 1000)
}


## adjusted relative risk
# female
print(c(results2[[1]]$RR, results2[[2]]$RR, results2[[3]]$RR))
# male
print(c(results2[[4]]$RR, results2[[5]]$RR, results2[[6]]$RR))


## adjusted odds ratio
## all the same : by the assumption of logistic regression
print(exp(coefficients(results2[[1]]$fit)[2]))

# betas <- coefficients(fit)
# exposed <- exp(-predict(fit, expose.cov, type = "link"))
# unexposed <- exp(-predict(fit, unexpose.cov, type = "link"))
# RR <- (1 + unexposed) / (1 + exposed)



## ---- fig.width=8, fig.height=6, fig.cap = "\\label{fig:figs} Plotting the distribution of adjusted relative risks for each combination of confounders. Each black dot denotes point estimate of adjusted relative risk and red horizontal line denotes adjusted odds ratio which is independent of the levels of confounders.", echo = FALSE----
RRboot = data.frame(rr = c(results2[[1]]$boot.rr, results2[[2]]$boot.rr, results2[[3]]$boot.rr, 
                 results2[[4]]$boot.rr, results2[[5]]$boot.rr, results2[[6]]$boot.rr),
               Z = c(rep("female", 3000), rep("male", 3000)),
               W = c( rep(c(rep("0", 1000), rep("1", 1000), rep("2", 1000)), 2)))

#pdf("Figure/results2.pdf",  width = 19, height = 9)
par(mfrow = c(1,1),   mar = c(3,3,3,3),  cex.lab = 2, 
    cex.main = 1, cex.axis = 1, tcl = 0.5,  omi = c(0.5,0.5,0,0))
bx = boxplot(rr ~ interaction(Z, W), data = RRboot, ylim = c(0,2.5),
             col = rep(c("palegreen", "dodgerblue"), 3),
             outcol = rep(c("palegreen", "dodgerblue"), 3),
             main= "Adjusted relative risks", 
             xlab="", ylab= "", mgp = c(4,1,0),
              yaxt = 'n', at = seq(1,6,1), outline = FALSE) 
mtext("(Z,W)", 1, 4, cex = 1)
mtext("Adjusted relative risk", 2, 4, cex = 1)
axis(2, at = seq(0, 2.5, 0.5), labels = seq(0, 2.5, 0.5))
for(p in 1:6){
  points(p, results2[[p]]$RR, type = "p", pch = 20, cex = 3)
}
abline(h = exp(coefficients(results2[[1]]$fit)[2]), col = "red", lwd = 2)

## ------------------------------------------------------------------------
library(logisticRR)
dat$multiY <- ifelse(dat$X == 1, rbinom(n, 1, 0.8) + dat$Y, rbinom(n, 1, 0.2) + dat$Y)
multiresult <- multiRR(multiY ~ X + W + Z, data = dat, boot = TRUE, n.boot = 1000)
apply(multiresult$boot.rr, 2, sd)
sqrt(multiresult$delta.var)

## relative risk ratio (RRR)
print(multiresult$RRR)

## relative risk (RR)
print(multiresult$RR)

## ------------------------------------------------------------------------
multinresult <- multinRR(multiY ~ W + X + Z, data = dat, basecov = 0, comparecov = 1, boot = TRUE, n.boot = 1000)
apply(multinresult$boot.rr, 2, sd)
sqrt(multinresult$delta.var)

## relative risk ratio (RRR)
print(multinresult$RRR)
## relative risk (RR)
print(multinresult$RR)

## ------------------------------------------------------------------------
data("airquality")

## ------------------------------------------------------------------------
# delete observations having NAs 
ozonedat <- na.omit(airquality)
# define binary ozone level
ozonedat$ozone1 <- ifelse(ozonedat$Ozone < quantile(ozonedat$Ozone, prob = 0.1), 1, 0)
ozonedat$ozone2 <- ifelse(ozonedat$Ozone < quantile(ozonedat$Ozone, prob = 0.2), 1, 0)
ozonedat$ozone3 <- ifelse(ozonedat$Ozone < quantile(ozonedat$Ozone, prob = 0.3), 1, 0)

## ------------------------------------------------------------------------
summary(ozonedat$Temp)
ozonedat$Temp2 <- ozonedat$Temp / 10
summary(ozonedat$Temp2)

## ------------------------------------------------------------------------
ozone.fit1 <- logisticRR(ozone1 ~ Temp2 +  Solar.R + Wind, data = ozonedat, basecov = min(ozonedat$Temp2),
                        fixcov = data.frame(Solar.R = mean(ozonedat$Solar.R), Wind = mean(ozonedat$Wind)), 
                        boot = FALSE)

ozone.fit2 <- logisticRR(ozone2 ~ Temp2 +  Solar.R + Wind, data = ozonedat, basecov = min(ozonedat$Temp2),
                        fixcov = data.frame(Solar.R = mean(ozonedat$Solar.R), Wind = mean(ozonedat$Wind)), 
                        boot = FALSE)

ozone.fit3 <- logisticRR(ozone3 ~ Temp2 +  Solar.R + Wind, data = ozonedat, basecov = min(ozonedat$Temp2),
                        fixcov = data.frame(Solar.R = mean(ozonedat$Solar.R), Wind = mean(ozonedat$Wind)), 
                        boot = FALSE)

## ------------------------------------------------------------------------
print(c(ozone.fit1$RR, ozone.fit2$RR, ozone.fit3$RR))

## odds ratio
exp(ozone.fit1$fit$coefficients[2])

## ------------------------------------------------------------------------
# define binary ozone level
ozonedat$ozone1 <- ifelse(ozonedat$Ozone < quantile(ozonedat$Ozone, prob = 0.1), 1, 0)
ozonedat$Temp.factor <- ifelse(ozonedat$Temp <= quantile(ozonedat$Temp, prob = 0.25), "low",
                                 ifelse(ozonedat$Temp > quantile(ozonedat$Temp, prob = 0.8), "high", "medium"))
ozonedat$Temp.factor <- as.factor(ozonedat$Temp.factor)

ozone.fit.factor <- nominalRR(ozone1 ~ Temp.factor + Solar.R + Wind, data = ozonedat,
                                basecov = "low", comparecov = "medium",
                                fixcov = data.frame(Solar.R = mean(ozonedat$Solar.R), Wind = mean(ozonedat$Wind)), boot = FALSE)

ozone.fit.factor2 <- nominalRR(ozone1 ~ Temp.factor + Solar.R + Wind, data = ozonedat,
                                 basecov = "medium", comparecov = "low",
                                 fixcov = data.frame(Solar.R = mean(ozonedat$Solar.R), Wind = mean(ozonedat$Wind)), boot = FALSE)


print(c(ozone.fit.factor$RR, ozone.fit.factor2$RR))
print(1/ozone.fit.factor2$RR)

