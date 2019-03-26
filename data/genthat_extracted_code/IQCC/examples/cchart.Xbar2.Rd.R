library(IQCC)


### Name: cchart.Xbar2
### Title: X-bar Shewhart Control Chart for phase II.
### Aliases: cchart.Xbar2

### ** Examples


data(pistonrings)
stat <- cchart.Xbar1(pistonrings[1:25, ])
cchart.Xbar2(pistonrings[26:40, ], stat[[1]][1], stat[[1]][2])




