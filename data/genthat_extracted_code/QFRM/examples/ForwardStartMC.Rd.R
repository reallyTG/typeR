library(QFRM)


### Name: ForwardStartMC
### Title: Forward Start option valuation via Monte-Carlo (MC) simulation
### Aliases: ForwardStartMC

### ** Examples

(o = ForwardStartMC())$PxMC

o = OptPx(Opt(Style='ForwardStart'), q = 0.03, r = 0.1, vol = 0.15)
(o = ForwardStartMC(o, tts=0.25))$PxMC

ForwardStartMC(o = OptPx(Opt(Style='ForwardStart', Right='Put')))$PxMC



