library(QFRM)


### Name: ForwardStartBS
### Title: ForwardStart option valuation via Black-Scholes (BS) model
### Aliases: ForwardStartBS

### ** Examples

(o = ForwardStartBS())$PxBS

o = OptPx(Opt(Style='ForwardStart', Right='Put'))
(o = ForwardStartBS(o))$PxBS



