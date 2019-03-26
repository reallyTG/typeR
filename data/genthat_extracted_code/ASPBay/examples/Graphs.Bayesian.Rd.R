library(ASPBay)


### Name: Graphs.Bayesian
### Title: Graphs
### Aliases: Graphs.Bayesian
### Keywords: Graphs

### ** Examples

data(ASPData)
B <- ASP.Bayesian(1e5, ASPData$Control, ASPData$Index,
                  ASPData$IBD, 15)
G <- Graphs.Bayesian(B, burn = 5000, xbins=100)



