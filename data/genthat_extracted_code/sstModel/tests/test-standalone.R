# Rates

# load library
library(sstModel)

# CHF Rates

standalone.rate.CHF <- standalone(name = "standalone CHF rates risk",
                                  rate(name = "2Y_CHF", currency = "CHF", horizon = "k"),
                                  rate(name = "10Y_CHF", currency = "CHF", horizon = "m"),
                                  rate(name = "30Y_CHF", currency = "CHF", horizon = "l"))

# USD Rates

standalone.rate.USD <- standalone(name = "standalone USD rates risk",
                                  rate(name = "2Y_USD", currency = "USD", horizon = "k"),
                                  rate(name = "10Y_USD", currency = "USD", horizon = "m"),
                                  rate(name = "30Y_USD", currency = "USD", horizon = "l"))


# GBP Rates

standalone.rate.GBP <- standalone(name = "standalone GBP rates risk",
                                  rate(name = "2Y_GBP", currency = "GBP", horizon = "k"),
                                  rate(name = "10Y_GBP", currency = "GBP", horizon = "m"),
                                  rate(name = "30Y_GBP", currency = "GBP", horizon = "l"))

# EUR Rates

standalone.rate.EUR <- standalone(name = "standalone EUR rates risk",
                                  rate(name = "2Y_EUR", currency = "EUR", horizon = "k"),
                                  rate(name = "10Y_EUR", currency = "EUR", horizon = "m"),
                                  rate(name = "30Y_EUR", currency = "EUR", horizon = "l"))


# All rates

standalone.rate <- standalone(name = "standalone rates risk",
                              rate(name = "2Y_EUR", currency = "EUR", horizon = "k"),
                              rate(name = "10Y_EUR", currency = "EUR", horizon = "m"),
                              rate(name = "30Y_EUR", currency = "EUR", horizon = "l"),
                              rate(name = "2Y_GBP", currency = "GBP", horizon = "k"),
                              rate(name = "10Y_GBP", currency = "GBP", horizon = "m"),
                              rate(name = "30Y_GBP", currency = "GBP", horizon = "l"),
                              rate(name = "2Y_USD", currency = "USD", horizon = "k"),
                              rate(name = "10Y_USD", currency = "USD", horizon = "m"),
                              rate(name = "30Y_USD", currency = "USD", horizon = "l"),
                              rate(name = "2Y_CHF", currency = "CHF", horizon = "k"),
                              rate(name = "10Y_CHF", currency = "CHF", horizon = "m"),
                              rate(name = "30Y_CHF", currency = "CHF", horizon = "l"))


# Exchange rate

standalone.fx <- standalone(name = "standalone fx risk",
                            currency(name = "EURCHF", from = "EUR", to = "CHF"),
                            currency(name = "USDCHF", from = "USD", to = "CHF"),
                            currency(name = "GBPCHF", from = "GBP", to = "CHF"),
                            currency(name = "JPYCHF", from = "JPY", to = "CHF"))

# Equity

standalone.equity <- standalone(name = "standalone equity risk",
                                equity(name = "MSCI_CHF", type = "equity", currency = "CHF"),
                                equity(name = "MSCI_EUR", type = "equity", currency = "EUR"),
                                equity(name = "MSCI_USD", type = "equity", currency = "USD"),
                                equity(name = "MSCI_GBP", type = "equity", currency = "GBP"),
                                equity(name = "MSCI_JPY", type = "equity", currency = "JPY"))

# Hedge Fund

standalone.hedgefund <- standalone(name = "standalone hedge fund risk",
                                   equity(name = "HFRIFOF", type = "hedge fund", currency = "USD"))

# real estate

standalone.realestate <- standalone(name = "real estate risk",
                                    equity(name = "Rued_Blass", type = "real estate private", currency = "CHF"),
                                    equity(name = "Rued_Blass", type = "real estate commercial", currency = "CHF", scale = 1))

# private equity

standalone.privateequity <- standalone(name = "standalone private equity risk",
                                       equity(name = "LPXIDITR", type = "private equity", currency = "USD"))

# spreads

standalone.spread <- standalone(name = "standalone spread risk",
                                spread(name = 'AAA_USD_Spread', currency = 'USD', rating = 'AAA'),
                                spread(name = 'AA_USD_Spread', currency = 'USD', rating = 'AA'),
                                spread(name = 'A_USD_Spread', currency = 'USD', rating = 'A'),
                                spread(name = 'BBB_USD_Spread', currency = 'USD', rating = 'BBB'),
                                spread(name = 'BB_USD_Spread', currency = 'USD', rating = 'BB'),
                                spread(name = 'AA_EUR_Spread', currency = 'EUR', rating = 'AA'),
                                spread(name = 'A_EUR_Spread', currency = 'EUR', rating = 'A'),
                                spread(name = 'BBB_EUR_Spread', currency = 'EUR', rating = 'BBB'),
                                spread(name = 'EUR_GOVT_SPREAD', currency = 'EUR', rating = 'EUGO'),
                                spread(name = 'SNB_KT', currency = 'CHF', rating = 'CANT'),
                                spread(name = 'SNB_IND', currency = 'CHF', rating = 'CORP'),
                                spread(name = 'AAA_USD_Spread', currency = 'CHF', rating = 'GOVI', scale = 0),
                                spread(name = 'AAA_USD_Spread', currency = 'CHF', rating = 'AAA', scale = 0.75),
                                spread(name = 'AA_USD_Spread', currency = 'CHF', rating = 'AA', scale = 1),
                                spread(name = 'A_USD_Spread', currency = 'CHF', rating = 'A', scale = 1),
                                spread(name = 'BBB_USD_Spread', currency = 'CHF', rating = 'BBB', scale = 1),
                                spread(name = 'BB_USD_Spread', currency = 'CHF', rating = 'BB', scale = 1),
                                spread(name = 'AAA_USD_Spread', currency = 'EUR', rating = 'GOVI', scale = 0),
                                spread(name = 'BB_USD_Spread', currency = 'EUR', rating = 'BB', scale = 1),
                                spread(name = 'AAA_USD_Spread', currency = 'GBP', rating = 'GOVI', scale = 0),
                                spread(name = 'AAA_USD_Spread', currency = 'GBP', rating = 'AAA', scale = 0.75),
                                spread(name = 'AA_USD_Spread', currency = 'GBP', rating = 'AA', scale = 1),
                                spread(name = 'A_USD_Spread', currency = 'GBP', rating = 'A', scale = 1),
                                spread(name = 'BBB_USD_Spread', currency = 'GBP', rating = 'BBB', scale = 1),
                                spread(name = 'BB_USD_Spread', currency = 'GBP', rating = 'BB', scale = 1),
                                spread(name = 'AAA_USD_Spread', currency = 'JPY', rating = 'GOVI', scale = 0),
                                spread(name = 'AAA_USD_Spread', currency = 'JPY', rating = 'AAA', scale = 1),
                                spread(name = 'AA_USD_Spread', currency = 'JPY', rating = 'AA', scale = 1),
                                spread(name = 'A_USD_Spread', currency = 'JPY', rating = 'A', scale = 1),
                                spread(name = 'BBB_USD_Spread', currency = 'JPY', rating = 'BBB', scale = 1),
                                spread(name = 'BB_USD_Spread', currency = 'JPY', rating = 'BB', scale = 1),
                                spread(name = 'AAA_USD_Spread', currency = 'USD', rating = 'GOVI', scale = 0),
                                spread(name = 'AAA_USD_Spread', currency = 'EUR', rating = 'AAA', scale = 1))


list.standalone <- list(standalone.equity,
                        standalone.fx,
                        standalone.hedgefund,
                        standalone.privateequity,
                        standalone.rate,
                        standalone.rate.CHF,
                        standalone.rate.EUR,
                        standalone.rate.GBP,
                        standalone.rate.USD,
                        standalone.realestate,
                        standalone.spread)

# table.spread <- model$marketRisk$mapping.table[type == "spread"]

# expr <- sapply(1:nrow(table.spread), function(i){
#   if (table.spread$scaled[i]) {
#     return(paste0("spread(name = '", table.spread$name[i],
#            "', currency = '", table.spread$currency[i],
#            "', rating = '", table.spread$rating[i],
#            "', scale = ", table.spread$scale[i],
#            ")"))
#   } else {
#     return(paste0("spread(name = '", table.spread$name[i],
#            "', currency = '", table.spread$currency[i],
#            "', rating = '", table.spread$rating[i],
#            "')"))
#   }
# })
#
# paste(expr[1:10], collapse = ", ")
