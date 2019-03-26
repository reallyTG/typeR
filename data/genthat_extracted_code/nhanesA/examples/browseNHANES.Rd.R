library(nhanesA)


### Name: browseNHANES
### Title: Open a browser to NHANES.
### Aliases: browseNHANES

### ** Examples

browseNHANES()                     # Defaults to the main data sets page
browseNHANES(2005)                 # The main page for the specified survey year
browseNHANES(2009, 'EXAM')         # Page for the specified year and survey group
browseNHANES(nh_table = 'VIX_D')   # Page for a specific table
browseNHANES(nh_table = 'DXA')     # DXA main page



