library(gemtc)


### Name: mtc.nodesplit
### Title: Node-splitting analysis of inconsistency
### Aliases: mtc.nodesplit mtc.nodesplit.comparisons plot.mtc.nodesplit
###   print.mtc.nodesplit summary.mtc.nodesplit plot.mtc.nodesplit.summary
###   print.mtc.nodesplit.summary

### ** Examples

# Run all relevant node-splitting models
## Not run:  result.ns <- mtc.nodesplit(parkinson, thin=50) 
# (read results from file instead of running:)
result.ns <- readRDS(system.file('extdata/parkinson.ns.rds', package='gemtc'))

# List the individual models 
names(result.ns)

# Time series plots and convergence diagnostics for d.A.C model
plot(result.ns$d.A.C)
gelman.diag(result.ns$d.A.C, multivariate=FALSE)

# Overall summary and plot
summary.ns <- summary(result.ns)
print(summary.ns)
plot(summary.ns)



