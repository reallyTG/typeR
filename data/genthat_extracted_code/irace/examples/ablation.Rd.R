library(irace)


### Name: ablation
### Title: Performs ablation between two configurations.
### Aliases: ablation

### ** Examples

## No test: 
irace.logfile <- file.path(system.file(package="irace"), "exdata", "sann.rda")
load(irace.logfile)
# Execute ablation between the first and the best configuration found by irace.
ablation(iraceResults = iraceResults, ablationLogFile = NULL)
# Execute ablation between two selected configurations, and selecting only a
# subset of parameters, directly reading the setup from the irace log file.
ablation(iraceLogFile = irace.logfile, src = 1, target = 10,
         ab.params = c("temp"), ablationLogFile = NULL)
## End(No test)




