library(nlrx)


### Name: analyze_nl
### Title: Analyze NetLogo simulation output
### Aliases: analyze_nl

### ** Examples


# Load nl object including output data from testdata
nl <- nl_sobol

# Define aggregation measurements:
myfuns <- dplyr::funs(mean, sd, min, max)

# Calculate sensitivity indices:
analyze_nl(nl, funs = myfuns)




