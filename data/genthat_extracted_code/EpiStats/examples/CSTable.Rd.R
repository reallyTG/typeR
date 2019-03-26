library(EpiStats)


### Name: CSTable
### Title: Summary table for univariate analysis of cohort studies
###   measuring risk
### Aliases: CSTable cstable
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

data(Tiramisu)
df <- Tiramisu

# You can see the association between several exposures and being ill.
CSTable(df, "ill", exposure=c("sex", "wmousse", "tira", "beer", "mousse"))

# By storing results in res, you can also use individual elements of the results.
# For example if you would like to view a particular risk ratio, 
# you can view it by typing (for example):
res = CSTable(df, "ill", exposure = c("sex", "wmousse", "tira", "beer", "mousse"), exact=TRUE)
res$df$`Risk Ratio`[1]




