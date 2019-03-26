library(nasapower)


### Name: get_power
### Title: Get NASA POWER Data and Return a Tidy Data Frame
### Aliases: get_power

### ** Examples

## No test: 
# Fetch daily "AG" community temperature, relative
# humidity and precipitation for January 1 1985
# for Kingsthorpe, Queensland, Australia
ag_d <- get_power(
   community = "AG",
   lonlat = c(151.81, -27.48),
   pars = c("RH2M", "T2M", "PRECTOT"),
   dates = "1985-01-01",
   temporal_average = "DAILY"
)

ag_d

# Fetch global AG climatology for temperature
ag_c <- get_power(community = "AG",
   pars = "T2M",
   temporal_average = "CLIMATOLOGY")

ag_c

# Fetch interannual solar cooking parameters
# for a given region
sse_i <- get_power(
  community = "SSE",
  lonlat = c(112.5, -55.5, 115.5, -50.5),
  dates = c("1984", "1985"),
  temporal_average = "INTERANNUAL",
  pars = c("CLRSKY_SFC_SW_DWN", "ALLSKY_SFC_SW_DWN")
)

sse_i

## End(No test)




