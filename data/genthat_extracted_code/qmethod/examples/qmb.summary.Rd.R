library(qmethod)


### Name: qmb.summary
### Title: Q Methodology: Summary of bootstrap results
### Aliases: qmb.summary
### Keywords: Q methodology bootstrapping summary

### ** Examples

data(lipset)
boots <- qmboots(lipset[[1]], nfactors = 3, nsteps = 50, 
                 load = "auto", rotation = "varimax",
                 indet = "qindet", fsi = TRUE)

boots.summary <- qmb.summary(boots)

# First rows of the summary for Q-sorts:
head(boots.summary$qsorts)

# First rows of the summary for statements:
head(boots.summary$statements)



