library(FinancialInstrument)


### Name: make_spread_id
### Title: Construct a primary_id for a 'spread' 'instrument' from the
###   primary_ids of its members
### Aliases: make_spread_id

### ** Examples

ids <- c('VX_aug1','VX_U11')
make_spread_id(ids, format='CY')
make_spread_id(ids, format=FALSE)
make_spread_id(c("VIX_JAN11","VIX_FEB11"),root='VX',format='CY')



