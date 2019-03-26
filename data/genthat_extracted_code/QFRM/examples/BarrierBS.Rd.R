library(QFRM)


### Name: BarrierBS
### Title: Barrier option pricing via Black-Scholes (BS) model
### Aliases: BarrierBS

### ** Examples

(o = BarrierBS())$PxBS # Option with default arguments is valued at $9.71

 #Down-and-In-Call
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Call", ContrSize=10)
 o = OptPx(o,  r = .05, q = 0, vol = .25)
 o = BarrierBS(o, dir = "Down", knock = 'In', H = 40)

 #Down-and-Out Call
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Call", ContrSize=10)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Down", knock = 'Out', H = 40)

 #Up-and-In Call
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Call", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Up", knock = 'In', H = 60)

 #Up-and-Out Call
 o = Opt(Style='Barrier', S0 = 50, K = 50, ttm = 1, Right="Call", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Up", knock = 'Out', H = 60)

 #Down-and-In Put
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Put", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Down", knock = 'In', H = 40)

 #Down-and-Out Put
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Put", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Down", knock = 'Out', H = 40)

 #Up-and-In Put
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Put", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Up", knock = 'In', H = 60)

 #Up-and-Out Put
 o = Opt(Style='Barrier', S0=50, K=50, ttm=1, Right="Put", ContrSize=1)
 o = OptPx(o, r = .05, q = .02, vol = .25)
 o = BarrierBS(o, dir = "Up", knock = 'Out', H = 60)



