library(swfscMisc)


### Name: odds
### Title: Odds Conversion
### Aliases: invLogOdds invOdds logOdds odds

### ** Examples

x <- sort(runif(10))
odds.df <- data.frame(x = x, odds = odds(x), logOdds = logOdds(x))
odds.df
invOdds(odds.df$odds)
invLogOdds(odds.df$logOdds)




