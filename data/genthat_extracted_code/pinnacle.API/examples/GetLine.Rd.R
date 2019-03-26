library(pinnacle.API)


### Name: GetLine
### Title: Get Lines (Use to get more detail on a single line, but the
###   GetOdds or showOddsDF versions are intended for large amounts of
###   data)
### Aliases: GetLine

### ** Examples

## No test: 
SetCredentials("TESTAPI","APITEST")
AcceptTermsAndConditions(accepted=TRUE)
 GetLine(sportId=1,leagueids=191545,eventId=495418854,
 periodNumber=0,team="TEAM1",betType="Moneyline")
## End(No test)




