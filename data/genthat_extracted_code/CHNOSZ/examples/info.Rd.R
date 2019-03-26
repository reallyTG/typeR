library(CHNOSZ)


### Name: info
### Title: Search the Thermodynamic Database
### Aliases: info

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## summary of available data
info()

## species information
# search for something named (or whose formula is) "Fe"
si <- info("Fe")
# use the number to get the full record
info(si)
# it is possible to get a range of records
info(si:(si+3))

## dealing with states
# default order of preference for names: aq > gas > cr,liq
info(c("methane","ethanol","glycinate"))  # aq, aq, aq
info(c("adenosine","alanine","hydroxyapatite"))  # aq, aq, cr
# state argument overrides the default
info(c("ethanol","adenosine"),state=c("gas","cr"))
# formulas default to aqueous species, if available
info(c("CH4","CO2","CS2","MgO"))  # aq, aq, gas, cr
# state argument overrides the default
info(c("CH4","CO2","MgO"),"gas")  # gas, gas, NA
# exceptions to the aqueous default is O2
info("O2")  # gas

## partial name or formula searches
info("ATP")
info("thiol")
info("MgC")
# add an extra character to refine a search
# or to search using terms that have exact matches
info("MgC ")
info("acetate ")
info(" H2O")



