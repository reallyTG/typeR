library(WaterML)


### Name: GetSites
### Title: GetSites
### Aliases: GetSites
### Keywords: waterml

### ** Examples

#Getting all sites from a service
sites <- GetSites("http://icewater.usu.edu/MudLake/cuahsi_1_0.asmx?WSDL")

#Getting a subset of sites restricted by geographical area
server <- "http://drought.usu.edu/usbrreservoirs/cuahsi_1_1.asmx?WSDL"
sites_subset <- GetSites(server, west=-113.0, south=35.0, east=110.0, north=40.0)



