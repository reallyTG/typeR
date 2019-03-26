library(QFRM)


### Name: BS
### Title: Black-Scholes (BS) pricing model
### Aliases: BS

### ** Examples

#See Hull, p.338, Ex.15.6. #Create an option and price it
o = Opt(Style='Eu', Right='Call', S0 = 42, ttm = .5, K = 40)
o = BS( OptPx(o, r=.1, vol=.2, NSteps=NA))
o$PxBS #print call option price computed by Black-Scholes pricing model
o$BS$Px$Put #print put option price computed by Black-Scholes pricing model



