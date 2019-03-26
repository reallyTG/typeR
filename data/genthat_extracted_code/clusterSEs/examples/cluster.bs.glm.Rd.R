library(clusterSEs)


### Name: cluster.bs.glm
### Title: Pairs Cluster Bootstrapped p-Values For GLM
### Aliases: cluster.bs.glm

### ** Examples

## Not run: 
##D 
##D ##################################################################
##D # example one: predict whether respondent has a university degree
##D ##################################################################
##D require(effects)
##D data(WVS)
##D logit.model <- glm(degree ~ religion + gender + age, data=WVS, family=binomial(link="logit"))
##D summary(logit.model)
##D 
##D # compute pairs cluster bootstrapped p-values
##D clust.bs.p <- cluster.bs.glm(logit.model, WVS, ~ country, report = T)
##D 
##D   
##D ######################################
##D # example two: predict chicken weight
##D ######################################
##D rm(list=ls())
##D data(ChickWeight)
##D 
##D dum <- model.matrix(~ ChickWeight$Diet)
##D ChickWeight$Diet2 <- as.numeric(dum[,2])
##D ChickWeight$Diet3 <- as.numeric(dum[,3])
##D ChickWeight$Diet4 <- as.numeric(dum[,4])
##D 
##D weight.mod2 <- glm(formula = weight~Diet2+Diet3+Diet4+log(Time+1),data=ChickWeight)
##D 
##D # compute pairs cluster bootstrapped p-values
##D clust.bs.w <- cluster.bs.glm(weight.mod2, ChickWeight, ~ Chick, report = T)
##D 
##D 
##D ###################################################################
##D # example three: murder rate by U.S. state, with interaction term
##D ###################################################################
##D rm(list=ls())
##D require(datasets)
##D 
##D state.x77.dat <- data.frame(state.x77)
##D state.x77.dat$Region <- state.region
##D state.x77.dat$IncomeXHS <- state.x77.dat$Income * state.x77.dat$HS.Grad
##D income.mod <- glm( Murder ~ Income + HS.Grad + IncomeXHS , data=state.x77.dat)
##D 
##D # compute pairs cluster bootstrapped p-values
##D clust.bs.inc <- cluster.bs.glm(income.mod, state.x77.dat, ~ Region, 
##D                                report = T, output.replicates=T, boot.reps=10000)
##D 
##D # compute effect of income on murder rate, by percentage of HS graduates
##D # using conventional standard errors
##D HS.grad.vec <- seq(from=38, to=67, by=1)
##D me.income <- coefficients(income.mod)[2] + coefficients(income.mod)[4]*HS.grad.vec
##D plot(me.income ~ HS.grad.vec, type="l", ylim=c(-0.0125, 0.0125), 
##D      xlab="% HS graduates", ylab="ME of income on murder rate")
##D se.income <- sqrt( vcov(income.mod)[2,2] + vcov(income.mod)[4,4]*(HS.grad.vec)^2 +
##D                    2*vcov(income.mod)[2,4]*HS.grad.vec )
##D ci.h <- me.income + qt(0.975, lower.tail=T, df=46) * se.income
##D ci.l <- me.income - qt(0.975, lower.tail=T, df=46) * se.income
##D lines(ci.h ~ HS.grad.vec, lty=2)
##D lines(ci.l ~ HS.grad.vec, lty=2)
##D 
##D # use pairs cluster bootstrap to compute CIs, including bootstrap bias-correction factor
##D # including bootstrap bias correction factor
##D # cluster on Region
##D ################################################
##D # marginal effect replicates =
##D me.boot <- matrix(data = clust.bs.inc$replicates[,2], nrow=10000, ncol=30, byrow=F) +
##D            as.matrix(clust.bs.inc$replicates[,4]) %*% t(HS.grad.vec)
##D # compute bias-corrected MEs
##D me.income.bias.cor <- 2*me.income - apply(X=me.boot, FUN=mean, MARGIN=2)
##D # adjust bootstrap replicates for bias
##D me.boot.bias.cor <- me.boot + matrix(data = 2*(me.income - 
##D                                      apply(X=me.boot, FUN=mean, MARGIN=2)),
##D                                      ncol=30, nrow=10000, byrow=T)
##D # compute pairs cluster bootstrap 95% CIs, including bias correction
##D me.boot.plot <- apply(X = me.boot.bias.cor, FUN=quantile, MARGIN=2, probs=c(0.025, 0.975))
##D # plot bootstrap bias-corrected marginal effects
##D lines(me.income.bias.cor ~ HS.grad.vec, lwd=2)
##D # plot 95% Cis
##D # a little lowess smoothing applied to compensate for discontinuities 
##D # arising from shifting between replicates
##D lines(lowess(me.boot.plot[1,] ~ HS.grad.vec), lwd=2, lty=2)
##D lines(lowess(me.boot.plot[2,] ~ HS.grad.vec), lwd=2, lty=2)
##D 
##D # finishing touches to plot
##D legend(lty=c(1,2,1,2), lwd=c(1,1,2,2), "topleft", 
##D        legend=c("Model Marginal Effect", "Conventional 95% CI", 
##D                 "BS Bias-Corrected Marginal Effect", "Cluster Bootstrap 95% CI"))
##D 
## End(Not run)



