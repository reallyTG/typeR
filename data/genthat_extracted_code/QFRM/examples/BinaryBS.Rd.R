library(QFRM)


### Name: BinaryBS
### Title: Binary option valuation with Black-Scholes (BS) model
### Aliases: BinaryBS

### ** Examples

(o = BinaryBS())$PxBS

#This example should produce price 4.33 (see Derivagem, DG201.xls)
o = Opt(Style="Binary", Right='Call', S0=50, ttm=5/12, K=52)
o = OptPx(o, r=.1, vol=.40, NSteps=NA)
(o = BinaryBS(o, Q = 10, Type='cash-or-nothing'))$PxBS

BinaryBS(OptPx(Opt(Style="Binary"), q=.01), Type='asset-or-nothing')
BinaryBS(OptPx(Opt(Style="Binary", S0=100, K=80),q=.01))
o = Opt(Style="Binary", Right="Put", S0=50, K=60)
BinaryBS(OptPx(o,q=.04), Type='asset-or-nothing')



