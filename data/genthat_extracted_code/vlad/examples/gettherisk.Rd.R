library(vlad)


### Name: gettherisk
### Title: Compute Risk of death
### Aliases: gettherisk

### ** Examples

library("vlad")
# see Steiner et al. 2000 page 445 or Steiner (2014) p. 234
coeff <- c("(Intercept)"=-3.68, "Parsonnet"=0.077)
# low risk patient (Parsonnet score=0) has a risk of death 2.5%
gettherisk(0L, coeff=coeff)
# high risk patient (Parsonnet score=71) has a risk of death 86%
gettherisk(71L, coeff=coeff)
# high risk patient (Parsonnet score=50) has a risk of death 54%
gettherisk(50L, coeff=coeff)

# Get mortality and probability of death of a phase I dataset
library("spcadjust")
data("cardiacsurgery")
cardiacsurgery <- dplyr::mutate(cardiacsurgery, phase=factor(ifelse(date < 2*365, "I", "II")))
SI <- subset(cardiacsurgery, c(phase=="I"), c("Parsonnet", "status"))
GLM1 <- glm(status ~ Parsonnet, data=SI, family="binomial")
coeff1 <- coef(GLM1)
mprob <- as.numeric(table(SI$Parsonnet) / length(SI$Parsonnet))

# Use estimated model coefficients and parsonnet scores in gettherisk function
# or predicted values from a GLM
s <- sort(unique(SI$Parsonnet))
mort <- sapply(s, gettherisk, coeff=coeff1)
mort1 <- predict(GLM1, newdata=data.frame(Parsonnet=s), type="response")
all.equal(as.numeric(mort), as.numeric(mort1))
df1 <- data.frame(s, mprob, mort)
## Not run: 
##D # Plot mortality and probability to die of phase I data
##D ggplot2::qplot(data=df1, s, mprob) + ggplot2::theme_classic()
##D library(ggplot2)
##D xx <- tapply(SI$status, SI$Parsonnet, sum)
##D nn <- tapply(SI$status, SI$Parsonnet, length)
##D ll <- binom::binom.confint(xx, nn, conf.level=0.99, methods="exact")$lower
##D uu <- binom::binom.confint(xx, nn, conf.level=0.99, methods="exact")$upper
##D ybar <- tapply(SI$status, SI$Parsonnet, mean)
##D ggplot(data=df1, aes(s, mort)) +
##D  geom_point(data=data.frame(s, ybar), aes(s, ybar), inherit.aes=FALSE) +
##D  geom_errorbar(aes(ymax=uu, ymin=ll), width=0.9, position="dodge", alpha=0.3) +
##D  geom_line(colour="red") + labs(x="Parsonnet score", y="Probability to die") +
##D  theme_classic()
## End(Not run)



