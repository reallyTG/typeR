library(lfstat)


### Name: hydrograph
### Title: Hydrograph
### Aliases: hydrograph

### ** Examples

data(ngaruroro)
#Full period
hydrograph(ngaruroro)
#Hydrological year 1981 and 1982 with annual minima
hydrograph(ngaruroro, startdate = 1981, enddate = 1982, amin = TRUE)
#From 01/01/1981 to 31/03/1981
hydrograph(ngaruroro, startdate = "01/01/1981", enddate = "31/03/1981")
#Log - yaxis
hydrograph(ngaruroro, startdate = "01/01/1981", enddate =
"31/03/1981",log = "y")



