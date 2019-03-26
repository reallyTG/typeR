library(FlexScan)


### Name: flexscan
### Title: Flexible Scan Statistics
### Aliases: flexscan

### ** Examples

  data(map)
  data(sample)
  # simple example for checks; turn the warnings back on using 'options(warn=0)'
  options(warn=-1)
  flexscan(map[111:121,],case=sample$case[111:121],pop=sample$pop[111:121],k=3,isplot=FALSE,nsim=10)
## Not run: 
##D  flexscan(map,case=sample$case,pop=sample$pop)
## End(Not run)



