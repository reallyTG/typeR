library(drc)


### Name: maED
### Title: Estimation of ED values using model-averaging
### Aliases: maED
### Keywords: models nonlinear

### ** Examples


## Fitting an example dose-response model
ryegrass.m1 <- drm(rootl~conc, data = ryegrass, fct = LL.4())
  
## Comparing models (showing the AIC values)  
mselect(ryegrass.m1, 
list(LL.5(), LN.4(), W1.4(), W2.4(), FPL.4(-1,1), FPL.4(-2,3), FPL.4(-0.5,0.5)))
  
## Doing the actual model-averaging  
maED(ryegrass.m1, 
list(LL.5(), LN.4(), W1.4(), W2.4(), FPL.4(-1,1), FPL.4(-2,3), FPL.4(-0.5,0.5)), 
c(10, 50, 90))  
  
## With confidence intervals according to Buckland et al. (1997)  
maED(ryegrass.m1, 
list(LL.5(), LN.4(), W1.4(), W2.4(), FPL.4(-1,1), FPL.4(-2,3), FPL.4(-0.5,0.5)), 
c(10, 50, 90), "buckland")

## With confidence intervals according to Kang et al. (2000)
maED(ryegrass.m1, 
list(LL.5(), LN.4(), W1.4(), W2.4(), FPL.4(-1,1), FPL.4(-2,3), FPL.4(-0.5,0.5)), 
c(10, 50, 90), "kang")

## Comparing to model-averaged ED values with simple linear regression included
maED(ryegrass.m1, 
list(LL.5(), LN.4(), W1.4(), W2.4(), FPL.4(-1,1), FPL.4(-2,3), FPL.4(-0.5,0.5)), 
c(10, 50, 90), interval = "buckland", linreg = TRUE)



## Example with a model fit involving two compounds/curves
S.alba.m1 <- drm(DryMatter~Dose, Herbicide, data=S.alba, fct = LL.4(),
pmodels=data.frame(Herbicide,1,1,Herbicide)) 

## Model-averaged ED50 for both compounds
maED(S.alba.m1, list(LL.3(), LN.4()), 50)

## Model-averaged ED50 only for one compound (glyphosate)
maED(S.alba.m1, list(LL.3(), LN.4()), 50, clevel="Glyphosate")

## With confidence intervals
maED(S.alba.m1, list(LL.3(), LN.4()), 50, interval="buckland")

## For comparison model-specific confidence intervals
ED(S.alba.m1, 50, interval="delta")  # wider!




