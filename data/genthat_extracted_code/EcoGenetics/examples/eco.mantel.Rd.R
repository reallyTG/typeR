library(EcoGenetics)


### Name: eco.mantel
### Title: Mantel and partial Mantel tests, with truncation option
### Aliases: eco.mantel

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D ### Ordinary Mantel test ###
##D eco.mantel(d1 = dist(eco[["P"]]), d2 = dist(eco[["E"]]), nsim = 99)  
##D 
##D ### Partial Mantel test ###
##D pm <- eco.mantel(d1 = dist(eco[["P"]]), d2 = dist(eco[["E"]]), 
##D dc = dist(eco[["XY"]]), nsim = 99)                               
##D 
##D ### Truncated Mantel test ###
##D # checking threshold in a correlogram:
##D corm <- eco.cormantel(M = dist(eco[["P"]]), XY = eco[["XY"]], nsim = 99)
##D eco.plotCorrelog(corm)
##D # Correlation is around 0 when distance between points is > 5
##D 
##D # creating a weights object for truncation
##D con <- eco.weight(eco@XY, method="circle", d2=5)
##D # compute a truncated mantel test
##D eco.mantel(dist(eco[["P"]]), dist(eco[["XY"]]), con=con)
##D 
##D ### Directional Mantel test ###
##D # analyzing with a Mantel test, in a direction of 35 degrees counterclockwise from E.
##D con2 <- eco.bearing(XY = eco[["XY"]], theta = 37)
##D eco.mantel(dist(eco[["P"]]), dist(eco[["XY"]]), con = con2)
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OBS(pm)     # slot OBS (observed value)
##D ecoslot.PVAL(pm)    # slot PVAL (P-value) 
##D 
## End(Not run)




