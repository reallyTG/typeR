library(malariaAtlas)


### Name: extractRaster
### Title: Extract pixel values from MAP rasters using point coordinates.
### Aliases: extractRaster

### ** Examples

#Download PfPR data for Nigeria and Cameroon and map the locations of these points using autoplot
## No test: 
# Get some data and remove rows with NAs in location or examined or positive columns.
NGA_CMR_PR <- getPR(country = c("Nigeria", "Cameroon"), species = "Pf")
complete <- complete.cases(NGA_CMR_PR[, c(4, 5, 16, 17)])
NGA_CMR_PR <- NGA_CMR_PR[complete, ]

# Extract PfPR data at those locations.
data <- extractRaster(NGA_CMR_PR[, c('latitude', 'longitude')],
                      surface = 'Plasmodium falciparum PR2-10',
                      year = 2015)

# Data are returned in the same order.
all(data$longitude == NGA_CMR_PR$longitude)

# Some rasters are stored with NA encoded as -9999
data$value[data$value == -9999] <- NA

# We can quickly plot a summary
plot((NGA_CMR_PR$positive / NGA_CMR_PR$examined) ~ data$value)
## End(No test)





