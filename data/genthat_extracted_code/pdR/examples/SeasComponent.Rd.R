library(pdR)


### Name: SeasComponent
### Title: Generate a data matrix of seasonal components
### Aliases: SeasComponent

### ** Examples

data(inf_Q)
y=inf_Q[,2]
SeasComponent(y,type="dummyCycle")
SeasComponent(y,type="trgCycle")



