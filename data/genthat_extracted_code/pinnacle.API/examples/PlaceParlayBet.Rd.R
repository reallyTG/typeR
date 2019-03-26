library(pinnacle.API)


### Name: PlaceParlayBet
### Title: PlaceParlayBet
### Aliases: PlaceParlayBet

### ** Examples

## No test: 
SetCredentials("TESTAPI","APITEST")
AcceptTermsAndConditions(accepted=TRUE)
parlay1 <-  list(lineId = 222136736,
                 sportId=1,
                 eventId = 495418854,
                 periodNumber=0,
                 legBetType = "MONEYLINE",
                 team = 'TEAM1')
parlay2 <- list(lineId = 223187865,
                 sportId=1,
                 eventId = 496997901,
                 periodNumber=0,
                 legBetType = "TOTAL_POINTS",
                 side = 'OVER')
legslist <- list(parlay1,parlay2)


PlaceParlayBet(riskAmount=10, 
               legslist=legslist,
               roundRobinOptions="Parlay",
               oddsFormat="AMERICAN" ,
               acceptBetterLine=TRUE)
## End(No test)





