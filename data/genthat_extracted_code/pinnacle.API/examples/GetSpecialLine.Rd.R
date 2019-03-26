library(pinnacle.API)


### Name: GetSpecialLine
### Title: Get the Line for a Special Contestant
### Aliases: GetSpecialLine

### ** Examples

## No test: 
SetCredentials("TESTAPI", "APITEST")
AcceptTermsAndConditions(accepted = TRUE)

# This contest is unlikely to exist, but serves as an example
# of the format.
GetSpecialLine(specialId = 101, contestantId = 102,
               oddsFormat = "AMERICAN")
## End(No test)




