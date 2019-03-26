library(EpiStats)


### Name: CCTable
### Title: Summary table for univariate analysis of case control studies
### Aliases: CCTable cctable
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

data(Tiramisu)
df <- Tiramisu

# You can see the association between several exposures and being ill.
cctable(df, "ill", exposure=c("sex", "wmousse", "tira", "beer", "mousse"))

# By storing results in res, you can also use individual elements of the results.
# For example if you would like to view a particular odds ratio, 
# you can view it by typing (for example):

res = CCTable(df, "ill", exposure = c("sex", "wmousse", "tira", "beer", "mousse"), exact=TRUE)
res$df$`Odds Ratio`[1]



