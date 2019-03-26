library(QFRM)


### Name: LookbackBS
### Title: Lookback option valuation with Black-Scholes (BS) model
### Aliases: LookbackBS

### ** Examples

(o = LookbackBS())$PxBS
  LookbackBS(OptPx(Opt(Style = 'Lookback'))) #Uses default arguments

  # See Hull 9e Example 26.2, p.608; gives price of 7.79
  o = Opt(Style = 'Lookback', S0 = 50, ttm= .25, Right = "Put")
  o = OptPx(o,r = .1, vol = .4)
  o = LookbackBS(o, Type = "Floating")

  # See Hull 9e Example 26.2, p.608; gives price of 8.04
  o = Opt(Style = 'Lookback', S0 = 50, ttm= .25, Right = "Call")
  o = OptPx(o, r = .1, vol = .4)
  o = LookbackBS(o, Type = "Floating")

  # Price = 17.7129
  o = Opt(Style = 'Lookback', S0 = 50, ttm= 1, Right = "Put", K = 60)
  o = OptPx(o,r = .05, q = .02, vol = .25)
  o = LookbackBS(o, Type = "Fixed")

  # Price = 8.237
  o = Opt(Style = 'Lookback', S0 = 50, ttm= 1, Right = "Call", K = 55)
  o = OptPx(o,r = .1, q = .02, vol = .25)
  o = LookbackBS(o, Type = "Fixed")



