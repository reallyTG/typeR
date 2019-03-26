library(comtradr)


### Name: ct_commodity_lookup
### Title: UN Comtrade commodities database query
### Aliases: ct_commodity_lookup

### ** Examples

# Look up commodity descriptions related to "halibut"
ct_commodity_lookup("halibut",
                    return_code = FALSE,
                    return_char = FALSE,
                    verbose = TRUE)

# Look up commodity codes related to "shrimp".
ct_commodity_lookup("shrimp",
                    return_code = TRUE,
                    return_char = FALSE,
                    verbose = TRUE)



