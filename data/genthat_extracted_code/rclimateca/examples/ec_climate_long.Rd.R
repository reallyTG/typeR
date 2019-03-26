library(rclimateca)


### Name: ec_climate_long
### Title: Transform EC Climate Data to Parameter-Long Form
### Aliases: ec_climate_long

### ** Examples

## No test: 
# station 27141 is Kentville CDA CS
monthly <- ec_climate_data(27141, timeframe = "monthly")
ec_climate_long(monthly)

# or use the pipe
ec_climate_data(27141, timeframe = "monthly") %>%
  ec_climate_long()
## End(No test)




