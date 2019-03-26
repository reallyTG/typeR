library(udunits2)


### Name: ud.get.name
### Title: Retrieve the udunits name or symbol from the database for a
###   given units string
### Aliases: ud.get.name ud.get.symbol

### ** Examples

units.to.display <- c("celsius", # has no name, messed up symbol (maybe a bug in R?)
                      "kg",
                      "hr",      # has no symbol
                      "K",
                      "degrees",
                      "m",
                      "ohm")

for (u in units.to.display) {
  print(ud.get.name(u))
  print(ud.get.symbol(u))
}



