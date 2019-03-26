library(EpiStats)


### Name: CSInter
### Title: Stratified analysis for cohort studies measuring risk
### Aliases: CSInter csinter
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

data(Tiramisu)
DF <- Tiramisu

# Here you can see the association between wmousse and ill for each stratum of tira:
csinter(DF, "ill", "wmousse", by = "tira")

# By storing the results in the object "res", you can use individual elements
# of the results. For example if you would like to view just the Mantel-Haenszel
# risk ratio for beer adjusted for tportion, you can view it by typing:
res <- CSInter(DF, "ill", "beer", "tportion", full = TRUE)
res$df2$Stats[3]




