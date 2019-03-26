library(cg)


### Name: print.cgPairedDifferenceDownweightedTable
### Title: Print Downweighted Observations Table object with some format
###   options
### Aliases: print,cgPairedDifferenceDownweightedTable-method
###   print.cgPairedDifferenceDownweightedTable

### ** Examples


data(anorexiaFT)

anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1,
                                                 logscale=TRUE)

anorexiaFT.fit <- fit(anorexiaFT.data)

anorexiaFT.dw <- downweightedTable(anorexiaFT.fit, cutoffwt=0.25, display='none') 

print(anorexiaFT.dw)  ## No observation




