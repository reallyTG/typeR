library(EpiStats)


### Name: CCInter
### Title: Stratified analysis for case control studies
### Aliases: CCInter ccinter
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

data(Tiramisu)
DF <- Tiramisu

# Here you can see the association between wmousse and ill for each stratum of tira:
CCInter(DF, "ill", "wmousse", by = "tira")

# By storing the results in the object "res", you can use individual elements of the results.
# For example if you would like to view just the Mantel-Haenszel odds ratio for beer adjusted
# for tportion, you can view it by typing:

res <- CCInter(DF, "ill", "beer", "tportion", full = TRUE)
res$df2$Stats[3]




