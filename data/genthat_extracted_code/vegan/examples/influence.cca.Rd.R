library(vegan)


### Name: influence.cca
### Title: Linear Model Diagnostics for Constrained Ordination
### Aliases: hatvalues.cca hatvalues.rda sigma.cca rstandard.cca
###   rstudent.cca cooks.distance.cca SSD.cca vcov.cca qr.cca
###   df.residual.cca
### Keywords: models multivariate

### ** Examples


data(varespec, varechem)
mod <- cca(varespec ~ Al + P + K, varechem)
## leverage
hatvalues(mod)
plot(hatvalues(mod), type = "h")
## ordination plot with leverages: points with high leverage have
## similar LC and WA scores
plot(mod, type = "n")
ordispider(mod)       # segment from LC to WA scores
points(mod, dis="si", cex=5*hatvalues(mod), pch=21, bg=2) # WA scores
text(mod, dis="bp", col=4)

## deviation and influence
head(rstandard(mod))
head(cooks.distance(mod))

## Influence measures from lm
y <- decostand(varespec, "chi.square") # needed in cca
y1 <- with(y, Cladstel)         # take one species for lm
lmod1 <- lm(y1 ~ Al + P + K, varechem, weights = rowSums(varespec))
## numerically identical within 2e-15
range(cooks.distance(lmod1) - cooks.distance(mod)[, "Cladstel"])

## t-values of regression coefficients based on type = "canoco"
## residuals
coef(mod)
coef(mod)/sqrt(diag(vcov(mod, type = "canoco")))



