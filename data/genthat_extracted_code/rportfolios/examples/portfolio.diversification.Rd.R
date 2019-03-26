library(rportfolios)


### Name: portfolio.diversification
### Title: Portfolio Diversification Measure
### Aliases: portfolio.diversification
### Keywords: math

### ** Examples

onePortfolio <- random.longonly( 100, 75 )
naive <- portfolio.diversification( onePortfolio, method = "naive" )
herfindahl <- portfolio.diversification( onePortfolio, method = "herfindahl" )
herfindahl.hirschman <- portfolio.diversification( onePortfolio, method = "herfindahl-hirschman" )
hannah.kay <- portfolio.diversification( onePortfolio, method = "hannah-kay" )
shannon <- portfolio.diversification( onePortfolio, method = "shannon" )




