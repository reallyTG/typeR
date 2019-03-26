library(ltsk)


### Name: tsbk
### Title: Ordinary Global Time and Space Block Kriging
### Aliases: tsbk

### ** Examples

## load the data
data(ex)
data(epa_cl)
## apply log transformation
obs[,'pr_pm25'] = log(obs[,'pr_pm25'])
ex2.query$block <- 1 ## a single block
ex2.query$g <- 1:nrow(ex2.query)
## run kriging
## system.time(out <- tsbk(ex2.query[1:2,],obs,zcoord='pr_pm25',Large=400))



