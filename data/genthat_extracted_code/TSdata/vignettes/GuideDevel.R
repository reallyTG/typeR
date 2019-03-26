### R code from vignette source 'GuideDevel.Stex'

###################################################
### code chunk number 1: GuideDevel.Stex:10-11 (eval = FALSE)
###################################################
##  options(continue="  ")


###################################################
### code chunk number 2: GuideDevel.Stex:24-38 (eval = FALSE)
###################################################
## require("TSsdmx")
## require("tfplot")
## con <- TSconnect("sdmx", dbname="FRB") 
## z <- TSget("G19.79d3b610380314397facd01b59b37659", con=con)
## tfplot(z, Title="From Federal Reserve Board")
## TSdescription(z) 
## z <- TSget("H3.a0e6e4ca4fd8cd3d7227e549939ec0ff", con=con)
## tfplot(z, Title="From Federal Reserve Board")
## TSdescription(z) 
## 
## con <- TSconnect("sdmx", dbname="BoC") 
## z <- TSget(c("CDOR", "OIS", "SWAPPEDTOFLOAT"), con=con)
## tfplot(z, Title="From Bank of Canada")
## TSdescription(z) 


