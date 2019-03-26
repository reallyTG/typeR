library(clusterSEs)


### Name: cluster.im.glm
### Title: Cluster-Adjusted Confidence Intervals And p-Values For GLM
### Aliases: cluster.im.glm

### ** Examples

## Not run: 
##D 
##D #####################################################################
##D # example one: predict whether respondent has a university degree
##D #####################################################################
##D 
##D require(effects)
##D data(WVS)
##D logit.model <- glm(degree ~ religion + gender + age, data=WVS, family=binomial(link="logit"))
##D summary(logit.model)
##D 
##D # compute cluster-adjusted p-values
##D clust.im.p <- cluster.im.glm(logit.model, WVS, ~ country, report = T)
##D 
##D ############################################################################
##D # example two: linear model of whether respondent has a university degree
##D #              with interaction between gender and age + country FEs
##D ############################################################################
##D 
##D WVS$degree.n <- as.numeric(WVS$degree)
##D WVS$gender.n <- as.numeric(WVS$gender)
##D WVS$genderXage <- WVS$gender.n * WVS$age
##D lin.model <- glm(degree.n ~ gender.n + age + genderXage + religion + as.factor(country), data=WVS)
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
##D # drop the FEs (absorbed into cluster-level coefficients)
##D lin.model.n <- glm(degree.n ~ gender.n + age + genderXage + religion, data=WVS)
##D clust.im.result <- cluster.im.glm(lin.model.n, WVS, ~ country, report = T, return.vcv = T)
##D # compute ME using average of cluster-level estimates (CIs center on this)
##D me.age.im <- clust.im.result$beta.bar[2] + clust.im.result$beta.bar[4]*age.vec
##D se.age.im <- sqrt( clust.im.result$vcv[2,2] + clust.im.result$vcv[4,4]*(age.vec)^2 +
##D                    2*clust.im.result$vcv[2,4]*age.vec)
##D # center the CIs on the ME using average of cluster-level estimates
##D # important: divide by sqrt(G) to convert SE of cluster-level estimates 
##D #            into SE of the mean, where G = number of clusters
##D G <- length(unique(WVS$country))
##D ci.h.im <- me.age.im + qt(0.975, lower.tail=T, df=(G-1)) * se.age.im/sqrt(G)
##D ci.l.im <- me.age.im - qt(0.975, lower.tail=T, df=(G-1)) * se.age.im/sqrt(G)
##D plot(me.age.im ~ age.vec, type="l", ylim=c(-0.2, 0.2), xlab="age", 
##D      ylab="ME of male gender on Pr(university degree)")
##D lines(ci.h.im ~ age.vec, lty=2)
##D lines(ci.l.im ~ age.vec, lty=2)
##D # for comparison, here's the ME estimate and CIs from the baseline model
##D lines(me.age ~ age.vec, lty=1, col="gray")
##D lines(ci.h ~ age.vec, lty=3, col="gray")
##D lines(ci.l ~ age.vec, lty=3, col="gray")
##D 
## End(Not run)



