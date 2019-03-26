library(erp.easy)


### Name: erp.easy
### Title: erp.easy: A user-friendly package for exploring event-related
###   potential (ERP) data
### Aliases: erp.easy erp.easy-package

### ** Examples

library(erp.easy)

data(ERPdata)

grandaverage(ERPdata, electrodes = "V78")

mosaic(ERPdata, electrodes = "V78")

m.measures(ERPdata, electrodes = "V78", window = c(1000, 1500))




