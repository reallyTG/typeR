library(rgr)


### Name: crm.plot
### Title: Plot Results of Control Reference Material (CRM) Analyses
### Aliases: crm.plot
### Keywords: univar hplot

### ** Examples

## Make test data available
data(crm.test)
attach(crm.test)

## Plot CRM analyses time-series for CRM-X using the CRM SD estimate
## and the default 2 SD tolerance bounds
crm.plot(Cu[CRM=="X"], "Cu(mgkg) in CRM-X", crm.mean = 34.5, crm.sd = 2.19)

## Plot CRM analyses time-series for CRM-X using the CRM SD estimate
## and 2.5 SD tolerance bounds
crm.plot(Cu[CRM=="X"], "Cu(mg/kg) in CRM-X", crm.mean = 34.5, crm.sd = 2.19,
n.sd = 2.5)

## Plot CRM analyses time-series for CRM-X using a maximum acceptable
## percantage tolerance bound
crm.plot(Cu[CRM=="X"], "Cu(mg/kg) in CRM-X", crm.mean = 34.5, crm.tol = 15)

## Detach test data
detach(crm.test)



