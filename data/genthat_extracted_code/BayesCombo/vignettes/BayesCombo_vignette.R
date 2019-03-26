## ---- echo = FALSE, include=FALSE----------------------------------------
library(knitr)
opts_chunk$set(fig.align='center') 

## ----setup, echo = FALSE, warning= FALSE, message=FALSE------------------
library(BayesCombo)

## ---- echo=FALSE, out.width='90%', fig.cap='Five steps to get from a prior to a posterior probability of a hypothesis. The effect size is the parameter $\\theta$, and `H<`, `H0`, and `H>` represent the three hypotheses of negative, zero, and positive effects.'----
knitr::include_graphics("procedure.pdf")

## ---- fig.height=4, fig.width=4, fig.cap='Effect of fluoxetine (Prozac) on rats in the Forced Swim Test. Data are from Lazic [4]'----
library(labstats)
par(las=1)
plot(time.immob ~ dose, data=fluoxetine, col="royalblue",
	ylab="Time immobile (s)", ylim=c(0, 250), xlim=c(0, 250),
	xlab="Dose of fluoxetine (mg/L in drinking water)")
abline(lm(time.immob ~ dose, data=fluoxetine), col="royalblue") # add reg. line

## ------------------------------------------------------------------------
summary(lm(time.immob ~ dose, data=fluoxetine))$coef

## ---- echo=FALSE, fig.height=6.5, fig.width=3, fig.cap='Prior, Likelihood (data), and posterior distributions for an experiment. Bayes factors for the three hypotheses are calculated as the ratio of posterior to prior areas or heights.'----
# x-values for plotting
xx <- seq(-5,5, length.out = 401)

# observed data (beta=0.75, se=1)... aka likelihood
obs <- dnorm(xx, 0.75, 1) 

# prior distribution (se is for a 99% CI)
up <- dnorm(xx, 0, 1.29)


# posterior (standard Bayesian updating for normal conjugate prior)
post.b <- ((0.75/1^2) + (0/1.29^2)) / ((1/1^2) + (1/1.29^2))
post.se <- sqrt(1/((1/1^2) + (1/1.29^2)))

# posterior distribution
post <- dnorm(xx, post.b, post.se)



par(mfrow=c(3,1),
    mar=c(4,3,1,2),
    las=0)


# prior
plot(up ~ xx, type="l", ylim=c(0, 0.5), xlab="", yaxt="n")
mtext("Prior", side=4, line=1)

polygon(c(xx[1:201],0), c(up[1:201],0),
        border="darkgrey", col="lightgrey", lwd=1.5)

polygon(c(xx[201:400],0), c(up[201:400],0),
        border="royalblue", col="#348ABD", lwd=1.5)

points(up[201] ~ xx[201], pch=16)

text(x=-1, y=0.1, labels = "a", cex=1.25)
text(x=0, y=0.35, labels = "b", cex=1.25)
text(x=1, y=0.1, labels = "c", cex=1.25)


# likelihood
plot(obs ~ xx, type="l", ylim=c(0, 0.5), xlab="", yaxt="n")
mtext("Likelihood", side=4, line=1)


# posterior
plot(post  ~ xx, type="l", ylim=c(0, 0.5), xlab="", yaxt="n")
mtext("Posterior", side=4, line=1)

polygon(c(xx[1:201],0), c(post[1:201],0),
        border="darkgrey", col="lightgrey")

polygon(c(xx[201:400],0), c(post[201:400],0),
        border="royalblue", col="#348ABD")

points(post[201] ~ xx[201], pch=16)

text(x=-1+0.47, y=0.1, labels = "d", cex=1.25)
text(x=0, y=0.48, labels = "e", cex=1.25)
text(x=1, y=0.1, labels = "f", cex=1.25)

mtext("Effect size", side=1, line=2.5)

## ------------------------------------------------------------------------
x <- pph(beta = -0.252, se.beta = 0.099)
summary(x)

## ---- fig.height=4.5, fig.width=4.5, fig.cap='Prior, likelihood (data), and posterior distributions for the fluoxetine data.'----
par(las=1)
plot(x, leg.loc = "topright", xlab="Effect size (slope of regression line)")

## ---- fig.height=4.5, fig.width=4.5, fig.cap='Prior, likelihood (data), and posterior distributions for the fluoxetine data. Same as Fig. 4 but with a wider prior.'----
x2 <- pph(beta = -0.252, se.beta = 0.099, se.mult = 2)
summary(x2)

par(las=1)
plot(x2, leg.loc = "topright", xlab="Effect size (slope of regression line)")

## ---- fig.height=4.5, fig.width=4.5, fig.cap='Prior, likelihood (data), and posterior distributions for the fluoxetine data. Same as Fig. 4 but with alternative options specified.'----
x3 <- pph(beta = -0.252, se.beta = 0.099, beta0=0, se0=1.2,
          H0 = c(-0.05, 0.05), H.priors=c(0.495, 0.495, 0.01))
summary(x3)

par(las=1)
plot(x3, leg.loc = "topright", xlab="Effect size (slope of regression line)")

## ------------------------------------------------------------------------
x4 <- ev.combo(beta = c(2.3, 1.2, 0.2, 0.44),
	           se.beta = c(1.03, 0.75, 0.16, 0.28))

## ----fig.height=4, fig.width=4, fig.cap='Forest plot showing effect sizes for four hypothetical clinical studies. Positive effect sizes indicate an improvement and grey lines are the priors.'----
par(las=1)
forestplot(x4)
abline(v=0, lty=2)

## ----summaryPPH----------------------------------------------------------
summary(x4)

## ----out.width='50%', fig.height=5, fig.width=5, fig.cap='Accumulation of support for the `H>` hypothesis as studies are added. PPH = Posterior Probability of a Hypothesis.'----
par(las=1)
plot(x4, ylab="PPH", xlab="Study")

## ----out.width='90%', fig.height=5, fig.width=8, fig.cap='Posterior Probabilities for each hypothesis for four studies. Each graph shows the same information and only groups the hypothesis and studies differently.'----
par(mfrow=c(1,2))
dotchart(x4$pph.uniform, xlim=c(0,1), xlab="PPH", pch=21, bg="grey")
dotchart(t(x4$pph.uniform), xlim=c(0,1), xlab="PPH", pch=21, bg="grey")

