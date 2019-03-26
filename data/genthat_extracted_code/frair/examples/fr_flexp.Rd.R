library(frair)


### Name: fr_flexp
### Title: Scaling Exponent Response, assuming replacement
### Aliases: fr_flexp flexp flexp_fit flexp_nll

### ** Examples

data(bythotrephes)
# NB: The flexpnr model is not correct for the experimental design of the bythotrephes data

expofit <- frair_fit(eaten~density, data=bythotrephes, 
                response='flexpnr', start=list(b = 0.5, q = 1, h = 0.15), 
                fixed=list(T=12/24))
## Plot
plot(expofit)
lines(expofit, col=2)

## Inspect
summary(expofit$fit) 



