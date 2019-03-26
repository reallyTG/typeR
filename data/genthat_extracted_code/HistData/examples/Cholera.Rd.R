library(HistData)


### Name: Cholera
### Title: William Farr's Data on Cholera in London, 1849
### Aliases: Cholera
### Keywords: datasets

### ** Examples

data(Cholera)

# plot cholera deaths vs. elevation
plot(cholera_drate ~ elevation, data=Cholera, 
	pch=16, cex.lab=1.2, cex=1.2,
	xlab="Elevation above high water mark (ft)",
	ylab="Deaths from cholera in 1849 per 10,000")

# Farr's mortality ~ 1/ elevation law
elev <- c(0, 10, 30, 50, 70, 90, 100, 350)
mort <- c(174, 99, 53, 34, 27, 22, 20, 6)
lines(mort ~ elev, lwd=2, col="blue")

# better plots, using car::scatterplot
library(car)

# show separate regression lines for each water supply

scatterplot(cholera_drate ~ elevation | water, data=Cholera, 
            smooth=FALSE, pch=15:17,
            id=list(n=2, labels=sub(",.*", "", Cholera$district)),
            col=c("red", "darkgreen", "blue"),
            legend=list(coords="topleft", title="Water supply"),
            xlab="Elevation above high water mark (ft)",
            ylab="Deaths from cholera in 1849 per 10,000")

scatterplot(cholera_drate ~ poor_rate | water, data=Cholera, 
            smooth=FALSE, pch=15:17,
            id=list(n=2, labels=sub(",.*", "", Cholera$district)),
            col=c("red", "darkgreen", "blue"),
            legend=list(coords="topleft", title="Water supply"),
            xlab="Poor rate per pound of house value",
            ylab="Deaths from cholera in 1849 per 10,000")


# fit a logistic regression model a la Bingham etal.
fit <- glm( cbind(cholera_deaths, popn) ~ 
            water + elevation + poor_rate + annual_deaths +
            pop_dens + persons_house,
            data=Cholera, family=binomial)
summary(fit)

# odds ratios
cbind( OR = exp(coef(fit))[-1], exp(confint(fit))[-1,] )

if (require(effects)) {
  eff <- allEffects(fit)
  plot(eff)
}




