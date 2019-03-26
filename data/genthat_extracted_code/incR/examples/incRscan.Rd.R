library(incR)


### Name: incRscan
### Title: Automated scoring of incubation
### Aliases: incRscan

### ** Examples

# incR_procdata is a dataframe processed by incRprep and incRscan and
# contains suitable information to run incRscan
data(incR_procdata)

incubation.analysis <- incRscan (data=incR_procdata, 
                                  temp.name="temperature",
                                  lower.time=22,
                                  upper.time=3,
                                  sensitivity=0.15,
                                  temp.diff.threshold=5,
                                  maxNightVariation=2,
                                  env.temp="env_temp")
inc.data <- incubation.analysis[[1]]
inc.thresholds <- incubation.analysis[[2]]



