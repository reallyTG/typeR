library(rgr)


### Name: crm.plot.new
### Title: Plot Results of Control Reference Material (CRM) Analyses Adding
###   New Data
### Aliases: crm.plot.new
### Keywords: univar hplot

### ** Examples

## Make test data available
data(crm.test)
attach(crm.test)
data(crm.test.new)

## Determine the range of the new determinations to be plotted
range(crm.test.new$Cu)

## Plot CRM analyses time-series for 25 CRM-X determinations using
## a historic CRM mean and SD estimate, and the default 2 SD
## tolerance bounds
crm.plot.new(Cu[CRM=="X"], "Cu(mg/kg) in CRM-X", crm.mean = 34.5, crm.sd = 2.19,
crm.new = 10, ylim = c(29, 39))

## Add the 10 new CRM-X determinations to the plot as red asterisks
points(seq(26,35), crm.test.new$Cu, pch = 8, col = 2)

## Plot CRM analyses time-series for 25 CRM-X determinations and
## base the CRM mean, SD estimate and confidence bounds on those
## data, using the default 2 SD tolerance bounds
crm.plot.new(Cu[CRM=="X"], "Cu(mg/kg) in CRM-X", crm.new = 10, ylim = c(29, 39))

## Add the 10 new CRM-X determinations to the plot as red asterisks
points(seq(26,35), crm.test.new$Cu, pch = 8, col = 2)

## Detach test data
detach(crm.test)



