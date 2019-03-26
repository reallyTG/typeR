library(QFRM)


### Name: LookbackMC
### Title: Lookback option valuation via Monte Carlo (MC) simulation
### Aliases: LookbackMC

### ** Examples

(o = LookbackMC())$PxMC   #Use default arguments, Output: approximately 16.31.

 # Floating & Put
 o=OptPx(Opt(S0=50,K=50,ttm=0.25,Right='Put',Style="Lookback"),r=0.1,vol=.4)
 LookbackMC(o,NPaths=5,div=1000) #Output: 7.79 from Hull 9e Example 26.2 Pg 608.

 # Floating & Call
 o=OptPx(Opt(S0=50,K=50,ttm=0.25,Right='Call',Style="Lookback"),r=0.1,vol=.4)
 LookbackMC(o,NPaths=5,div=1000) #Output: 8.04 from Hull 9e Example 26.2 Pg 608

 # Fixed & Put
 o=OptPx(Opt(S0=50,K=60,ttm=1,Right='Put',Style="Lookback"),r=0.05,q=0.02,vol=.25)
 LookbackMC(o,Type="Fixed",NPaths=5,div=1000)

 # Fixed & Call
 o=OptPx(Opt(S0=50,K=55,ttm=1,Right='Call',Style="Lookback"),r=0.1,vol=.25)
 LookbackMC(o,Type="Fixed",NPaths=5,div=1000)



