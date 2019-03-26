library(drc)


### Name: G.aparine
### Title: Herbicide applied to Galium aparine
### Aliases: G.aparine
### Keywords: datasets

### ** Examples


## Fitting a model with a common control (so a single upper limit: "1")
G.aparine.m1 <- drm(drymatter ~ dose, treatment, data = G.aparine, 
pmodels = data.frame(treatment, treatment, 1, treatment), fct = LL.4())

## Visual inspection of fit
plot(G.aparine.m1, broken = TRUE)

## Lack of fit test
modelFit(G.aparine.m1)

## Summary output
summary(G.aparine.m1)

## Predicted values with se and confidence intervals
#predict(G.aparine.m1, interval = "confidence")
# long output

## Calculating the relative potency
EDcomp(G.aparine.m1, c(50,50))

## Showing the relative potency as a
## function of the response level
relpot(G.aparine.m1)
relpot(G.aparine.m1, interval = "delta")
# appears constant!

## Response level in percent
relpot(G.aparine.m1, scale = "percent")

## Fitting a reduced model (with a common slope parameter)
G.aparine.m2 <- drm(drymatter ~ dose, treatment, data = G.aparine, 
pmodels = data.frame(1, treatment, 1, treatment), fct = LL.4())

anova(G.aparine.m2, G.aparine.m1)

## Showing the relative potency 
relpot(G.aparine.m2)

## Fitting the same model in a different parameterisation
G.aparine.m3 <- drm(drymatter ~ dose, treatment, data = G.aparine, 
pmodels = data.frame(treatment, treatment, 1, treatment), fct = LL2.4())

EDcomp(G.aparine.m3, c(50, 50), logBase = exp(1))




