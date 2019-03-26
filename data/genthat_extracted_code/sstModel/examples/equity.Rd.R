library(sstModel)


### Name: equity
### Title: Constructing an Equity (Risk Factor)
### Aliases: equity

### ** Examples

# constructing a non-scaled equity risk factor
# (assuming "MSCI_CHF" exists in marketRisk).
e <- equity(name = "MSCI_CHF",
            type = "equity",
            currency = "CHF")

# constructing a scaled equity risk factor
# (assuming "MSCI_CHF" exists in marketRisk).
e <- equity(name = "MSCI_CHF",
            type = "equity",
            currency = "CHF",
            scale = 0.5)




