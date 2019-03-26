library(GWRM)


### Name: gw
### Title: Fitting GWRM Models
### Aliases: gw gw.fit

### ** Examples

data(goals)
gw(goals ~ position + offset(log(played)), data = goals)



