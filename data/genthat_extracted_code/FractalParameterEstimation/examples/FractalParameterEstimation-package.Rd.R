library(FractalParameterEstimation)


### Name: FractalParameterEstimation-package
### Title: Simulation and Parameter Estimation of Randomized Sierpinski
###   Carpets using the p-p-p-q-Model
### Aliases: FractalParameterEstimation
### Keywords: package methods array distribution models list

### ** Examples

## Example 1: Original p-Value: 0.2; Original q-value: 0.1
estimationFunction(Data0201, decs = 2)

## Example 2: Original p-value: 0.3; Original q-value: 0.25
estimationFunction(Data03025) # testData2

## Example 3: Original p-value: 0.5; Original q-value: 0.1
estimationFunction(Data0501)

## Example 4: Original p-value: 0.6; Original q-value: 0.3
estimationFunction(Data0603)


### Simulate Sierpinski-Carpet under constant probabilities: 
GSC(p = 0.2, N = 4, sierp = TRUE)
GSC(p = 0.8, N = 2, sierp = FALSE)

## Simulate Sierpinski-Carpet under variable probabilities: 
GSC_seq(p = c(0.1,0.2,0.1,0.4), sierp = TRUE)
GSC_seq(p = c(rep(0.1,3),0.05), sierp = FALSE)  



