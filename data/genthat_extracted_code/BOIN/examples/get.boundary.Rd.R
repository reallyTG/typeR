library(BOIN)


### Name: get.boundary
### Title: Generate the optimal dose escalation and deescalation boundaries
###   for conducting the trial.
### Aliases: get.boundary

### ** Examples


## get the dose escalation and deescalation boundaries for BOIN design with
## the target DLT rate of 0.3, maximum sample size of 30, and cohort size of 3
bound <- get.boundary(target=0.3, ncohort=10, cohortsize=3)
summary.boin(bound) # get the descriptive summary of the boundary
# plot.boin(bound)    # plot the flowchart of the design with boundaries





