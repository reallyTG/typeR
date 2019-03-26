library(ltsk)


### Name: tsk
### Title: Ordinary Global Time and Space Kriging
### Aliases: tsk

### ** Examples

## load the data
data(ex)
data(epa_cl)
## apply log transformation
obs[,'pr_pm25'] = log(obs[,'pr_pm25'])
## run kriging
system.time(out <- tsk(ex2.query[1:2,],obs,zcoord='pr_pm25',Large=400))
out$krig



