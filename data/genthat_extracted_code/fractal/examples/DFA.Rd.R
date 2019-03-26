library(fractal)


### Name: DFA
### Title: Detrended fluctuation analysis
### Aliases: DFA
### Keywords: univar models nonlinear

### ** Examples

## calculate the scaling exponent for a random 
## walk realization 
DFA.walk <- DFA(rnorm(1024), detrend="poly1", sum.order=1)

## print the results 
print(DFA.walk)

## plot a summary of the results 
eda.plot(DFA.walk)



