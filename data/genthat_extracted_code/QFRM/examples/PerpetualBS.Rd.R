library(QFRM)


### Name: PerpetualBS
### Title: Perpetual option valuation via Black-Scholes (BS) model
### Aliases: PerpetualBS

### ** Examples

#Perpetual American Call and Put
#Verify pricing with \url{http://www.coggit.com/freetools}
(o <- PerpetualBS())$PxBS # Approximately valued at $8.54

#This example should produce approximately $33.66
o = Opt(Style="Perpetual", Right='Put', S0=50, K=55)
o = OptPx(o, r = .03, q = 0.1, vol = .4)
(o = PerpetualBS(o))$PxBS

#This example should produce approximately $10.87
o = Opt(Style="Perpetual", Right='Call', S0=50, K=55)
o = OptPx(o, r = .03, q = 0.1, vol = .4)
(o <- PerpetualBS(o))$PxBS



