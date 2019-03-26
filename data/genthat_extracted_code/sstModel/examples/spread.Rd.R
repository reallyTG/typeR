library(sstModel)


### Name: spread
### Title: Constructing a Spread (Risk Factor)
### Aliases: spread

### ** Examples

# constructing a non-scaled spread risk factor
# (assuming "AA_EUR_Spread" exists in marketRisk).

e <- spread(name     = "AA_EUR_Spread",
            rating   = "AA",
            currency = "EUR")
# constructing a scaled spread risk factor
# (assuming "AA_EUR_Spread" exists in marketRisk).

e <- spread(name     = "AA_EUR_Spread",
            rating   = "AA",
            currency = "EUR",
            scale    = 0.5)




