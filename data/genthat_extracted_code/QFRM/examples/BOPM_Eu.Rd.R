library(QFRM)


### Name: BOPM_Eu
### Title: European option valuation (vectorized computation).
### Aliases: BOPM_Eu

### ** Examples

#Fig.13.11, Hull/9e/p291:
o = Opt(Style='European', Right='Call', S0=810, ttm=.5, K=800)
(o <- BOPM_Eu( OptPx(o, r=.05, q=.02, vol=.2, NSteps=2)))$PxBT

o = Opt('Eu', 'C', 0.61, .5, 0.6, SName='USD/AUD')
o = OptPx(o, r=.05, q=.02, vol=.12, NSteps=2)
(o <- BOPM_Eu(o))$PxBT



