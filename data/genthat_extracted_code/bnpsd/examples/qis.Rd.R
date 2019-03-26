library(bnpsd)


### Name: qis
### Title: Construct admixture proportion matrix for independent
###   subpopulations
### Aliases: qis

### ** Examples

# vector of subpopulation memberships
labs <- c(1,1,1,2,2,3,1)
# admixture matrix with subpopulations (along columns) sorted
Q <- qis(labs)

# declare subpopulations in custom order
subpops <- c(3,1,2)
# columns will be reordered to match subpops as provided
Q <- qis(labs, subpops)

# declare subpopulations with unobserved labels
subpops <- 1:5
# note columns 4 and 5 will be false for all individuals
Q <- qis(labs, subpops)




