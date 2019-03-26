library(WaterML)


### Name: AddSites
### Title: AddSites
### Aliases: AddSites
### Keywords: waterml

### ** Examples

user <- "admin"
pass <- "password"
server <- "http://worldwater.byu.edu/app/index.php/default/services/cuahsi_1_1.asmx"
#make random site codes
random_codes = sprintf("%04d",sample(1:10000, 2))
random_names = paste("R","Upload", random_codes)
random_lats = runif(2, 35.0, 49.0) #two random latitudes inside U.S
random_lons = runif(2, -110.0, -70.0) #random longitudes inside U.S
my_sites <- data.frame(SiteCode=random_codes, SiteName=random_names,
                       Latitude=random_lats, Longitude=random_lons)

added_sites <- AddSites(server, username=user, password=pass, sites=my_sites)



