library(QFRM)


### Name: GapBS
### Title: Gap option valuation via Black-Scholes (BS) model
### Aliases: GapBS

### ** Examples

#See J.C.Hull, OFOD'2014, 9-ed, Example 26.1, p.601
(o <- GapBS())$PxBS

GapBS(o=OptPx(Opt(Style='Gap',Right='Put',K=57)))

#See http://www.mathworks.com/help/fininst/gapbybls.html
o = Opt(Style='Gap',Right='Put',K=57,ttm=0.5,S0=52)
o = GapBS(OptPx(o,vol=0.2,r=0.09),K2=50)

o = Opt(Style='Gap',Right='Put',K=57,ttm=0.5,S0=50)
(o <- GapBS(OptPx(o,vol=0.2,r=0.09),K2=50))$PxBS



