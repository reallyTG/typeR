library(FinancialInstrument)


### Name: next.future_id
### Title: Get the primary_id of the next-to-expire (previously expiring)
###   future_series instrument
### Aliases: next.future_id prev.future_id

### ** Examples

next.future_id("ES_Z1","H,M,U,Z", format=NULL) 
next.future_id("VIXAUG11", 1:12, root='VIX', format=NULL)
next.future_id("YM_Q11", seq(3,12,3)) #gives a warning about 'Q' not being part of month_cycle



