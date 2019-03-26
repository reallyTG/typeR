library(BradleyTerry2)


### Name: countsToBinomial
### Title: Convert Contingency Table of Wins to Binomial Counts
### Aliases: countsToBinomial
### Keywords: models

### ** Examples


########################################################
##  Statistics journal citation data from Stigler (1994)
##  -- see also Agresti (2002, p448)
########################################################
citations

## Convert frequencies to success/failure data
citations.sf <- countsToBinomial(citations)
names(citations.sf)[1:2] <- c("journal1", "journal2")
citations.sf




