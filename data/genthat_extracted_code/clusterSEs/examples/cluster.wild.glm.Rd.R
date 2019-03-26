library(clusterSEs)


### Name: cluster.wild.glm
### Title: Wild Cluster Bootstrapped p-Values For Linear Family GLM
### Aliases: cluster.wild.glm

### ** Examples

## Not run: 
##D 
##D #########################################
##D # example one: predict chicken weight
##D #########################################
##D 
##D # predict chick weight using diet, do not impose the null hypothesis
##D # because of factor variable "Diet"
##D data(ChickWeight)
##D weight.mod <- glm(formula = weight~Diet,data=ChickWeight)
##D cluster.wd.w.1 <-cluster.wild.glm(weight.mod, dat = ChickWeight,cluster = ~Chick, boot.reps = 1000)
##D 
##D # impose null
##D dum <- model.matrix(~ ChickWeight$Diet)
##D ChickWeight$Diet2 <- as.numeric(dum[,2])
##D ChickWeight$Diet3 <- as.numeric(dum[,3])
##D ChickWeight$Diet4 <- as.numeric(dum[,4])
##D 
##D weight.mod2 <- glm(formula = weight~Diet2+Diet3+Diet4,data=ChickWeight)
##D cluster.wd.w.2 <-cluster.wild.glm(weight.mod2, dat = ChickWeight,cluster = ~Chick, boot.reps = 1000)
##D 
##D ############################################################################
##D # example two: linear model of whether respondent has a university degree
##D #              with interaction between gender and age + country FEs
##D ############################################################################
##D 
##D require(effects)
##D data(WVS)
##D 
##D WVS$degree.n <- as.numeric(WVS$degree)
##D WVS$gender.n <- as.numeric(WVS$gender)
##D WVS$genderXage <- WVS$gender.n * WVS$age
##D lin.model <- glm(degree.n ~ gender.n + age + genderXage + religion, data=WVS)
##D 
##D # compute marginal effect of male gender on probability of obtaining a university degree
##D # using conventional standard errors
##D age.vec <- seq(from=18, to=90, by=1)
##D me.age <- coefficients(lin.model)[2] + coefficients(lin.model)[4]*age.vec
##D plot(me.age ~ age.vec, type="l", ylim=c(-0.1, 0.1), xlab="age", 
##D      ylab="ME of male gender on Pr(university degree)")
##D se.age <- sqrt( vcov(lin.model)[2,2] + vcov(lin.model)[4,4]*(age.vec)^2 +
##D                 2*vcov(lin.model)[2,4]*age.vec)
##D ci.h <- me.age + qt(0.975, lower.tail=T, df=lin.model$df.residual) * se.age
##D ci.l <- me.age - qt(0.975, lower.tail=T, df=lin.model$df.residual) * se.age
##D lines(ci.h ~ age.vec, lty=2)
##D lines(ci.l ~ age.vec, lty=2)
##D 
##D 
##D # cluster on country, compute CIs for marginal effect of gender on degree attainment
##D clust.wild.result <- cluster.wild.glm(lin.model, WVS, ~ country, 
##D                                       impose.null = F, report = T, 
##D                                       output.replicates=T)
##D replicates <- clust.wild.result$replicates
##D me.boot <- matrix(data=NA, nrow=dim(replicates)[1], ncol=length(age.vec))
##D for(i in 1:dim(replicates)[1]){
##D   me.boot[i,] <- replicates[i,"gender.n"] + replicates[i,"genderXage"]*age.vec
##D }
##D ci.wild <- apply(FUN=quantile, X=me.boot, MARGIN=2, probs=c(0.025, 0.975))
##D 
##D # a little lowess smoothing applied to compensate for discontinuities 
##D # arising from shifting between replicates
##D lines(lowess(ci.wild[1,] ~ age.vec), lty=3)
##D lines(lowess(ci.wild[2,] ~ age.vec), lty=3)
##D 
##D # finishing touches to plot
##D legend(lty=c(1,2,3), "topleft",
##D        legend=c("Model Marginal Effect", "Conventional 95% CI",
##D                 "Wild BS 95% CI"))
##D                 
## End(Not run)



