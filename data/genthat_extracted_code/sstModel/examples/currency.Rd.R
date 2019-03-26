library(sstModel)


### Name: currency
### Title: Constructing a Currency (FX Exchange Rate Risk Factor)
### Aliases: currency

### ** Examples

# constructing a currency risk factor
# (assuming "EURCHF" exists in marketRisk).
cur <- currency(name = "EURCHF",
                from = "EUR",
                to   = "CHF")




