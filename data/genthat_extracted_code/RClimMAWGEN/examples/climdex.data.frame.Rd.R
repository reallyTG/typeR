library(RClimMAWGEN)


### Name: climdex.data.frame
### Title: ClimDex Data Frame
### Aliases: climdex.data.frame

### ** Examples

rm(list=ls())
library(RClimMAWGEN)
#  generated and observed daily temperature data for the considering period
#  (1981-2010)(RMAWGEN output data structure)
data (generation_p1)


#collected generated (realizations) and observed data (realizations$Tx_mes, realizations$Tn_mes)

realizations <- generation_p1$output

realizations$Tx_mes <- generation_p1$input$Tx_mes

realizations$Tn_mes <- generation_p1$input$Tn_mes

# realization scanarios used for 'climdex.data.frame'
realizations_TN <- c("Tn_mes","Tn_gen00002","Tn_gen00003","Tn_gen00004")
realizations_TX <- c("Tx_mes","Tx_gen00002","Tx_gen00003","Tx_gen00004")

stations <- names(realizations$Tn_mes)

start_date = "1981-01-01"
end_date = "2010-12-31"

# The indices climdex.tn90p,climdex.tx90p are considered in this example
climate_indices = c("climdex.tn90p","climdex.tx90p")

frequency =  "monthly"

date.series = seq(as.PCICt(start_date, cal = "gregorian"),
 as.PCICt(end_date, cal = "gregorian"), by = "days")

base.range = c(1990, 2002)
n = 5
prefix = NULL


climdex <- climdex.data.frame(data=realizations, station=stations,
 realization_TN=realizations_TN,realization_TX=realizations_TX,realization_PREC=NULL,
 start_date= start_date, end_date = end_date ,climate_index = climate_indices,
 frequency = frequency,date.series = date.series,base.range = base.range,
 n = n, prefix = prefix)

str(climdex)

## Function 'climdex.data.frame' can be also used with annual frequency
## The following lines are now commented because the elapsed time is too long!!
## Please uncomment to run the following lines to run the function.
# climdex_annual <- climdex.data.frame(data=realizations, station=stations,
# realization_TN=realizations_TN,realization_TX=realizations_TX,realization_PREC=NULL,
# start_date= start_date, end_date = end_date ,climate_index = climate_indices,
# frequency = "yearly",date.series = date.series,base.range = base.range,
# n = n, prefix = prefix)
#
# str(climdex_annual)


# Wilcoxon test between observed and generated climate indices

 observed <- "T0129__Tn_mes__climdex.tx90p"
 generated <- c("T0129__Tn_gen00002__climdex.tx90p","T0129__Tn_gen00003__climdex.tx90p")
 wxt <- wilcox.test(x=climdex,observed=observed,generated=generated)
 wxt
#  Kolgomorov-Smirinov test between observed and generated climate indices

kst <- ks.test.climdex.data.frame(data=climdex,observed=observed,generated=generated)
kst

accepted(wxt)
accepted(kst)



