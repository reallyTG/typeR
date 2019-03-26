library(derivmkts)


### Name: barriers
### Title: Barrier option pricing
### Aliases: barriers cashdicall callupin callupout putupin putupout
###   calldownin calldownout putdownin putdownout uicall uocall dicall
###   docall uiput uoput diput doput cashuicall cashuiput cashdiput
###   assetuicall assetuiput assetdicall assetdiput cashuocall cashuoput
###   cashdocall cashdoput assetuocall assetuoput assetdocall assetdoput dr
###   ur drdeferred urdeferred

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0; H=44
callupin(s, k, v, r, tt, d, H)

## following returns the same price as previous
assetuicall(s, k, v, r, tt, d, H) - k*cashuicall(s, k, v, r, tt, d, H)

## return option prices for different strikes putupin(s, k=38:42,
#v, r, tt, d, H)



