library(pinnacle.API)


### Name: PlaceSpecialBet
### Title: Place a Special Bet on a Given Contestant
### Aliases: PlaceSpecialBet

### ** Examples

## No test: 
SetCredentials("TESTAPI", "APITEST")
AcceptTermsAndConditions(accepted = TRUE)

# This contest is unlikely to exist, but serves as an example
# of the format.
line <- GetSpecialLine(specialId = 101, contestantId = 102,
                       oddsFormat = "AMERICAN")

if (!is.na(line$lineId)) {
  PlaceSpecialBet(stake = 100, lineId = line$lineId,
                  specialId = 101, contestantId = 102,
                  acceptBetterLine = TRUE,
                  winRiskStake = "RISK",
                  oddsFormat = "AMERICAN")
}
## End(No test)




