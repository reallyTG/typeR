library(DoseFinding)


### Name: Mods
### Title: Define dose-response models
### Aliases: Mods getResp plot.Mods

### ** Examples

## Example on how to specify candidate models

## Suppose one would like to use the following models with the specified
## guesstimates for theta2, in a situation where the doses to be used are
## 0, 0.05, 0.2, 0.6, 1

## Model            guesstimate(s) for theta2 parameter(s) (name)
## linear           -
## linear in log    -
## Emax             0.05 (ED50)
## Emax             0.3 (ED50)
## exponential      0.7 (delta)
## quadratic       -0.85 (delta)
## logistic         0.4  0.09 (ED50, delta)
## logistic         0.3  0.1 (ED50, delta)
## betaMod          0.3  1.3 (delta1, delta2)
## sigmoid Emax     0.5  2 (ED50, h)
## linInt           0.5 0.75 1 1 (perc of max-effect at doses)
## linInt           0.5 1 0.7 0.5 (perc of max-effect at doses)

## for the linInt model one specifies the effect over placebo for
## each active dose.
## The fixed "scal" parameter of the betaMod is set to 1.2
## The fixed "off"  parameter of the linlog is set to 0.1
## These (standardized) candidate models can be specified as follows

models <- Mods(linear = NULL, linlog = NULL, emax = c(0.05, 0.3),
               exponential = 0.7, quadratic = -0.85,
               logistic = rbind(c(0.4, 0.09), c(0.3, 0.1)),
               betaMod = c(0.3, 1.3), sigEmax = c(0.5, 2),
               linInt = rbind(c(0.5, 0.75, 1, 1), c(0.5, 1, 0.7, 0.5)),
               doses = c(0, 0.05, 0.2, 0.6, 1),
               addArgs = list(scal=1.2, off=0.1))
## "models" now contains the candidate model set, as placEff, maxEff and
## direction were not specified a placebo effect of 0 and an effect of 1
## is assumed

## display of specified candidate set
plot(models)

## example for creating a candidate set with decreasing response 
doses <- c(0, 10, 25, 50, 100, 150)
fmodels <- Mods(linear = NULL, emax = 25,
                   logistic = c(50, 10.88111), exponential = 85,
                   betaMod = rbind(c(0.33, 2.31), c(1.39, 1.39)),
                   linInt = rbind(c(0, 1, 1, 1, 1),
                                  c(0, 0, 1, 1, 0.8)), 
                   doses=doses, placEff = 0.5, maxEff = -0.4,
                   addArgs=list(scal=200))
plot(fmodels)
## some customizations (different model names, symbols, line-width)
plot(fmodels, lwd = 3, pch = 3, cex=1.2, col="red",
     modNams = paste("mod", 1:8, sep="-"))

## for a full-model object one can calculate the responses
## in a matrix
getResp(fmodels, doses=c(0, 20, 100, 150))

## calculate doses giving an improvement of 0.3 over placebo
TD(fmodels, Delta=0.3, direction = "decreasing")
## discrete version
TD(fmodels, Delta=0.3, TDtype = "discrete", doses=doses, direction = "decreasing")
## doses giving 50% of the maximum effect
ED(fmodels, p=0.5)
ED(fmodels, p=0.5, EDtype = "discrete", doses=doses)

plot(fmodels, plotTD = TRUE, Delta = 0.3)

## example for specifying all model parameters (fullMod=TRUE)
fmods <- Mods(emax = c(0, 1, 0.1), linear = cbind(c(-0.4,0), c(0.2,0.1)),
              sigEmax = c(0, -1.1, 0.5, 3),
              doses = 0:4, fullMod = TRUE)
getResp(fmods, doses=seq(0,4,length=11))
## calculate doses giving an improvement of 0.3 over placebo
TD(fmods, Delta=0.3)
## discrete version
TD(fmods, Delta=0.3, TDtype = "discrete", doses=0:4)
## doses giving 50% of the maximum effect
ED(fmods, p=0.5)
ED(fmods, p=0.5, EDtype = "discrete", doses=0:4)
plot(fmods)



