library(obAnalytics)


### Name: tradeImpacts
### Title: Trade impacts.
### Aliases: tradeImpacts

### ** Examples


# get impacts data.frame from trades data.
impacts <- tradeImpacts(lob.data$trades)

# impacts (in bps) 
sell.bps <- with(impacts[impacts$dir == "sell", ], {
  (max.price-min.price)/max.price
})
10000*summary(sell.bps[sell.bps > 0])




