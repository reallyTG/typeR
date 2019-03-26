library(ltsk)


### Name: ltsk
### Title: Ordinary Local Time and Space Kriging
### Aliases: ltsk

### ** Examples

## load the data
data(ex)
data(epa_cl)
## apply log transformation
obs[,'pr_pm25'] = log(obs[,'pr_pm25'])
## run kriging
system.time(out <- ltsk(ex2.query[1:2,],obs,c(0.10,10),zcoord='pr_pm25',verbose=FALSE,cl=0))
table(out$flag)



