library(waterData)


### Name: importDVs
### Title: Imports daily USGS hydrologic times series data
### Aliases: importDVs
### Keywords: IO ts

### ** Examples

 ## Not run: 
##D # import mean daily streamflow for Red River of the North at Fargo, ND
##D q05054000 <- importDVs("05054000", sdate="2000-01-01", edate="2010-12-31")
##D head(q05054000)
##D # additional examples of how to this function follow
##D # import mean daily gage height for Red River of the North at Grand Forks, ND
##D gh05082500 <- importDVs("05082500", code="00065", sdate="2000-01-01", edate="2010-12-31")
##D # import mean daily specific conductance for Red River of the North at Grand Forks, ND
##D sc05082500<- importDVs("05082500", code="00095", sdate="2000-01-01", edate="2010-12-31")
##D # import mean daily water temperature for Red River of the North at Fargo, ND
##D temp05054000<- importDVs("05054000", code="00010", sdate="2000-01-01", edate="2010-12-31")
##D # import median daily pH for Red River of the North at Fargo, ND
##D pH05054000<- importDVs("05054000", code="00400", stat="00008", 
##D sdate="2000-01-01", edate="2010-12-31")
##D # examine the attributes of the data frame to show that the parameter code 
##D # and statistics code are saved with the data frame
##D attributes(pH05054000)[c("code","stat")]
##D # import mean daily oxygen for Red River of the North at Fargo, ND
##D do05054000 <- importDVs("05054000", code="00300", sdate="2000-01-01", edate="2010-12-31")
##D # import mean daily turbidity for Red River of the North at Fargo, ND
##D turb05054000 <- importDVs("05054000", code="63680", sdate="2000-01-01", edate="2010-12-31")
## End(Not run)



