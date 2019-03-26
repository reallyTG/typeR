library(pinnacle.API)


### Name: PlaceBet
### Title: Place Bet
### Aliases: PlaceBet

### ** Examples

## No test: 
SetCredentials("TESTAPI","APITEST")
AcceptTermsAndConditions(accepted=TRUE)
PlaceBet (stake=10,
          sportId=1,
          eventId=495418854,
          periodNumber=0,
          lineId=222136736,
          betType="MONEYLINE",
          team="TEAM2",
          acceptBetterLine=TRUE,
          winRiskStake="WIN",
          oddsFormat="AMERICAN")
## End(No test)



