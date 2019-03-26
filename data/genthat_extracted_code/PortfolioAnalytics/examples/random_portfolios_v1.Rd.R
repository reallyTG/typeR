library(PortfolioAnalytics)


### Name: random_portfolios_v1
### Title: generate an arbitary number of constrained random portfolios
### Aliases: random_portfolios_v1

### ** Examples

rpconstraint<-constraint_v1(assets=10, 
                         min_mult=-Inf, 
                         max_mult=Inf, 
                         min_sum=.99, 
                         max_sum=1.01, 
                         min=.01, 
                         max=.4, 
                         weight_seq=generatesequence())
                         
rp<- random_portfolios_v1(rpconstraints=rpconstraint,permutations=1000)
head(rp)



