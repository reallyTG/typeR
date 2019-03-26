library(plm)


### Name: pdim
### Title: Check for the Dimensions of the Panel
### Aliases: pdim pdim.data.frame pdim.pdata.frame pdim.pseries
###   pdim.panelmodel pdim.pgmm pdim.default print.pdim
### Keywords: attribute

### ** Examples

# There are 595 individuals
data("Wages", package = "plm")
pdim(Wages, 595)

# Gasoline contains two variables which are individual and time indexes
# and are the first two variables
data("Gasoline", package="plm")
pdim(Gasoline)

# Hedonic is an unbalanced panel, townid is the individual index
data("Hedonic", package = "plm")
pdim(Hedonic, "townid")

# An example of the panelmodel method
data("Produc", package = "plm")
z <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp,data=Produc,
         model="random", subset = gsp > 5000)
pdim(z)



