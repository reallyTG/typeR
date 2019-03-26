library(FinancialInstrument)


### Name: instrument.auto
### Title: Create an instrument based on name alone
### Aliases: instrument.auto

### ** Examples

## Not run: 
##D instrument.auto("CL_H1.U1")
##D getInstrument("CL_H1.U1") #guaranteed_spread
##D 
##D instrument.auto("ES_H1.YM_H1")
##D getInstrument("ES_H1.YM_H1") #synthetic
##D 
##D currency(c("USD","EUR"))
##D instrument.auto("EURUSD")
##D getInstrument("EURUSD") #made an exchange_rate
##D 
##D instrument.auto("VX_H11") #no root future defined yet!
##D getInstrument("VX_H11") #couldn't find future, didnt make future_series
##D future("VX","USD",1000,underlying_id=synthetic("SPX","USD")) #make the root 
##D instrument.auto("VX_H11") #and try again
##D getInstrument("VX_H11") #made a future_series
## End(Not run)



