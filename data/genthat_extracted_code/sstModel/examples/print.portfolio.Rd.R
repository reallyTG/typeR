library(sstModel)


### Name: print.portfolio
### Title: Printing a Portfolio
### Aliases: print.portfolio

### ** Examples

# Creating a new portfolio.
asset1 <- asset("equity", "USD", 1000)
asset2 <- asset("hedge fund", "EUR", 2000)
life1 <- life(name        = c("pandemy", "longetivity", "storno"),
              currency    = c("CHF", "CHF", "CHF"),
              sensitivity = c(100, 150, 130))
health1 <- health(name        = c("pandemy", "longetivity", "storno"),
                  currency    = c("CHF", "CHF", "CHF"),
                  sensitivity = c(100, 150, 130))
participation1 <- participation("CHF", 1000)
   valid.param <- list(mvm = list(mvm.life = 2, mvm.health = 4, mvm.nonlife = 3),
                       rtkr = 0,
                       rtkg = 0,
                       correction.term = 2,
                       credit.risk = 3,
                       expected.insurance.result =  10^6,
                       expected.financial.result =  10^5)
pf <- portfolio(market.items   = list(asset1, asset2),
                participation.item  = participation1,
                life.item       = life1,
                health.item     = health1,
                base.currency  = "CHF",
                portfolio.parameters = valid.param)
# printing the portfolio
print(pf)




