library(bhm)


### Name: data
### Title: dataset
### Aliases: data glm.gendat surv.gendat
### Keywords: datasets

### ** Examples

#data(data)
## maybe str(data) ; plot(data) ...
c0 = 0.4
b = c(-0.5, 1.5, 1.3)
data = surv.gendat(n=300, c0 = c0, beta = b)



