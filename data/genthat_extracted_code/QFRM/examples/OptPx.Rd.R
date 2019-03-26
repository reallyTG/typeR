library(QFRM)


### Name: OptPx
### Title: 'OptPx' object constructor
### Aliases: OptPx

### ** Examples

OptPx()  #Creates an S3 object for an option contract

#See J.C.Hull, OFOD'2014, 9-ed, Fig.13.10, p.289
OptPx(Opt(Right='Put'))

o = OptPx(Opt(Right='Call', S0=42, ttm=.5, K=40), r=.1, vol=.2)



