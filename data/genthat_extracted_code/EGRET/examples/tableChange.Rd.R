library(EGRET)


### Name: tableChange
### Title: Create a table of the changes in flow-normalized values between
###   various points in time in the record
### Aliases: tableChange tableChangeSingle
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water Year:
## Not run: 
##D tableChange(eList, fluxUnit=6, yearPoints=c(2001,2005,2008,2009))
##D tableChange(eList, fluxUnit=9) 
##D tableChange(eList, fluxUnit=9, flowNormYear=c(2001:2006, 2008:2009)) 
##D # Winter:
##D eList <- setPA(eList, paStart=12,paLong=3)
##D tableChange(eList, fluxUnit=6,yearPoints=c(2001,2005,2008,2009))
##D 
##D # Water Year:
##D #This returns concentration ASCII table in the console:
##D tableChangeSingle(eList, fluxUnit=6,yearPoints=c(2001,2005,2008,2009), flux=FALSE)
##D #Returns a data frame:
##D change <- tableChangeSingle(eList, fluxUnit=6,yearPoints=c(2001,2005,2008,2009), 
##D                   flowNormYears=c(2003:2004, 2006:2009), flux=FALSE)
##D #This returns flux values ASCII table in the console
##D df <- tableChangeSingle(eList, fluxUnit=6,yearPoints=c(2001,2005,2008,2009), flux=TRUE)  
##D # Winter:
##D eList <- setPA(eList, paStart=12,paLong=3)
##D tableChangeSingle(eList, fluxUnit=6,yearPoints=c(2001,2005,2008,2009), flux=FALSE)
##D 
## End(Not run)



