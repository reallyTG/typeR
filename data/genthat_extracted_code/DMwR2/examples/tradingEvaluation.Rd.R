library(DMwR2)


### Name: tradingEvaluation
### Title: Obtain a set of evaluation metrics for a set of trading actions
### Aliases: tradingEvaluation
### Keywords: models

### ** Examples

## An example partially taken from chapter 3 of my book Data Mining
## with R (Torgo,2010)

## First a trading policy function
## This function implements a strategy to trade on futures with
## long and short positions. Its main ideas are the following:
## - all decisions aretaken at the end of the day, that is, after
## knowing all daily quotes of the current session.
## - if at the end of day d our models issue a sell signal and  we
## currently  do not hold any opened position, we will open a short
## position  by issuing a sell order. When this order is carried out  by
## the market at a price  pr sometime in the  future, we will
## immediately post two other orders. The first is a buy limit order
## with  a limit price of pr - p%, where p% is a target profit margin.
## We will wait 10 days for this target to be reached. If the  order  is
## not carried out by this deadline, we will buy at the closing price
## of  the 10th day. The second order is a buy stop order with a  price
## limit  pr + l%. This order is placed with the goal of limiting our
## eventual  losses with this position. The order will be executed if
## the  market reaches the price pr + l%, thus limiting our possible
## losses  to l%.
## - if the end of the day signal is buy the strategy is more or less
## the inverse
## Not run: 
##D library(xts)
##D policy.1 <- function(signals,market,opened.pos,money,
##D                      bet=0.2,hold.time=10,
##D                      exp.prof=0.025, max.loss= 0.05
##D                      )
##D   {
##D     d <- NROW(market) # this is the ID of today
##D     orders <- NULL
##D     nOs <- NROW(opened.pos)
##D     # nothing to do!
##D     if (!nOs && signals[d] == 'h') return(orders)
##D 
##D     # First lets check if we can open new positions
##D     # i) long positions
##D     if (signals[d] == 'b' && !nOs) {
##D       quant <- round(bet*money/market[d,'Close'],0)
##D       if (quant > 0) 
##D         orders <- rbind(orders,
##D               data.frame(order=c(1,-1,-1),order.type=c(1,2,3), 
##D                          val = c(quant,
##D                                  market[d,'Close']*(1+exp.prof),
##D                                  market[d,'Close']*(1-max.loss)
##D                                 ),
##D                          action = c('open','close','close'),
##D                          posID = c(NA,NA,NA)
##D                         )
##D                        )
##D 
##D     # ii) short positions  
##D     } else if (signals[d] == 's' && !nOs) {
##D       # this is the nr of stocks we already need to buy 
##D       # because of currently opened short positions
##D       need2buy <- sum(opened.pos[opened.pos[,'pos.type']==-1,
##D                                  "N.stocks"])*market[d,'Close']
##D       quant <- round(bet*(money-need2buy)/market[d,'Close'],0)
##D       if (quant > 0)
##D         orders <- rbind(orders,
##D               data.frame(order=c(-1,1,1),order.type=c(1,2,3), 
##D                          val = c(quant,
##D                                  market[d,'Close']*(1-exp.prof),
##D                                  market[d,'Close']*(1+max.loss)
##D                                 ),
##D                          action = c('open','close','close'),
##D                          posID = c(NA,NA,NA)
##D                         )
##D                        )
##D     }
##D     
##D     # Now lets check if we need to close positions
##D     # because their holding time is over
##D     if (nOs) 
##D       for(i in 1:nOs) {
##D         if (d - opened.pos[i,'Odate'] >= hold.time)
##D           orders <- rbind(orders,
##D                 data.frame(order=-opened.pos[i,'pos.type'],
##D                            order.type=1,
##D                            val = NA,
##D                            action = 'close',
##D                            posID = rownames(opened.pos)[i]
##D                           )
##D                          )
##D       }
##D 
##D     orders
##D   }
##D 
##D   ## Now let us play a bit with the SP500 quotes availabe in our package
##D   data(GSPC)
##D 
##D   ## Let us select the last 3 months as the simulation period
##D   market <- last(GSPC,'3 months')
##D   
##D   ## now let us generate a set of random trading signals for
##D   ## illustration purpose only
##D   ndays <- nrow(market)
##D   aRandomIndicator <- rnorm(sd=0.3,ndays)
##D   theRandomSignals <- trading.signals(aRandomIndicator,b.t=0.1,s.t=-0.1)
##D 
##D   ## now lets trade!
##D   tradeR <- trading.simulator(market,theRandomSignals,
##D               'policy.1',list(exp.prof=0.05,bet=0.2,hold.time=10))
##D 
##D   ## a few stats on the trading performance
##D   tradingEvaluation(tradeR)
## End(Not run)



