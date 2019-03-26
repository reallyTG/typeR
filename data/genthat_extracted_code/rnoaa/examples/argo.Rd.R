library(rnoaa)


### Name: argo
### Title: Get Argo buoy data
### Aliases: argo argo_search argo_files argo_qwmo argo_plan
###   argo_buoy_files argo

### ** Examples

## Not run: 
##D # Search Argo metadata 
##D ## Number of profiles
##D argo_search("np", limit = 3)
##D ## Number of floats
##D argo_search("nf", limit = 3)
##D ## Number of both profiles and floats
##D argo_search("n", limit = 3)
##D ## return the coordinates in time and space of profiles
##D argo_search("coord", limit = 3)
##D ## return the coordinates in time and space of profiles, plus other metadata
##D argo_search("fullcoord", limit = 3)
##D 
##D ## List various things, e.g,...
##D ### data assembly centers
##D argo_search("list", "dac")
##D ### data modes
##D argo_search("list", "dmode", limit = 5)
##D ### World Meteorological Organization unique float ID's
##D argo_search("list", "wmo", limit = 5)
##D ### Profile years
##D argo_search("list", "year", limit = 5)
##D 
##D ## coord or fullcoord with specific buoy id
##D argo_search("coord", wmo = 4900881, limit = 3)
##D argo_search("fullcoord", wmo = 4900881, limit = 3)
##D 
##D # Spatial search
##D ### search by bounding box (see param def above)
##D argo_search("coord", box = c(-40, 35, 3, 2))
##D ### search by area
##D argo_search("coord", area = 0)
##D ### search by around
##D argo_search("coord", around = '-40,35,100')
##D 
##D # Time based search
##D ### search by year
##D argo_search("coord", year = 2006)
##D ### search by yearmin and yearmax
##D argo_search("coord", yearmin = 2007)
##D argo_search("coord", yearmin = 2007, yearmax = 2009)
##D ### search by month
##D argo_search("coord", month = '12,1,2')
##D ### search by lr
##D argo_search("coord", lr = 7)
##D ### search by from or to
##D argo_search("coord", from = 20090212)
##D argo_search("coord", to = 20051129)
##D 
##D # Data mode search
##D argo_search("coord", dmode = "R")
##D argo_search("coord", dmode = "R,A")
##D 
##D # Data quality based search
##D argo_search("coord", pres_qc = "A,B")
##D argo_search("coord", temp_qc = "A")
##D argo_search("coord", pres_qc = "A", temp_qc = "A")
##D 
##D # Ticket search
##D argo_search("coord", ticket = 1)
##D 
##D ## Search on partial float id number
##D argo_qwmo(qwmo = 49)
##D argo_qwmo(qwmo = 49, limit = 2)
##D 
##D ## Get files
##D argo_files(wmo = 6900087)
##D argo_files(wmo = 6900087, cyc = 12)
##D argo_files(wmo = 6900087, cyc = 45)
##D 
##D ## Get planned buoys data, accepts no parameters
##D argo_plan()
##D 
##D # Get files for a buoy, must specify data assembly center (dac)
##D argo_buoy_files(dac = "bodc", id = 1901309)
##D argo_buoy_files(dac = "kma", id = 2900308)
##D 
##D # Get data
##D x <- argo_buoy_files(dac = "meds", id = 4900881)
##D argo(dac = "meds", id = 4900881, cycle = 127, dtype = "D")
## End(Not run)



