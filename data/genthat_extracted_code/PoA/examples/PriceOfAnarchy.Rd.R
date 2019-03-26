library(PoA)


### Name: PriceOfAnarchy
### Title: Compoute the Price of Anarchy for a Routing Game.
### Aliases: PriceOfAnarchy

### ** Examples

library(stats, "na.omit")
library(dplyr)
library(tibble)
library(pracma)
library(nloptr)

### 2 player game ###
player2 <- tibble(cost = c(function(x){0}, function(x){0}, function(x){NA},
                 function(x){x^2}, function(x){(3/2)*x},  function(x){x}),
                  flow = c(function(alpha,beta){(1/2)-alpha},function(alpha,beta){(1/2)-beta},
                    function(alpha,beta){NA},function(alpha,beta){alpha},
                    function(alpha,beta){beta},function(alpha, beta){1-alpha-beta}))
PriceOfAnarchy(player2, c((1/2), (1/2)))
## No test: 
### 3 player - 2x2 middle ###
player3middle2x2 <- tibble(cost = c(function(x){0}, function(x){x},function(x){x^2},
function(x){x},function(x){x},function(x){0},function(x){x},function(x){x^2},
function(x){x^2},function(x){x},function(x){(1/2)*x},function(x){x}),
                          flow = c(function(d1,d2,d3,d4,d5){d1},
                          function(d1,d2,d3,d4,d5){1-d1},function(d1,d2,d3,d4,d5){d2},
                          function(d1,d2,d3,d4,d5){1-d2},function(d1,d2,d3,d4,d5){d3},
                          function(d1,d2,d3,d4,d5){1-d3},function(d1,d2,d3,d4,d5){d4},
                          function(d1,d2,d3,d4,d5){d1+d2+d3-d4},function(d1,d2,d3,d4,d5){d5},
                          function(d1,d2,d3,d4,d5){1-d1-d2-d3-d5},
                          function(d1,d2,d3,d4,d5){d4+d5},function(d1,d2,d3,d4,d5){1-d4-d5}))
PriceOfAnarchy(player3middle2x2, c((6/10),(1/10),(3/10),1,1))
## End(No test)



