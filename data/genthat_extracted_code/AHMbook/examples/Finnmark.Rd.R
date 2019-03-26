library(AHMbook)


### Name: Finnmark
### Title: Data from surveys of birds in Finnmark in NE Norway
### Aliases: Finnmark
### Keywords: datasets

### ** Examples

data(Finnmark)
str(Finnmark)

# Create the objects needed for the analysis:
# Extract the numeric covariates and standardise
str(Finnmark$sites)
scov <- scale(Finnmark$sites[, 5:8])
str(scov)

# Convert the 'counts' array to detection/nondetection data:
y <- Finnmark$counts > 0
storage.mode(y) <- "integer"
str(y)

# Get the guild information for each species
guild <- Finnmark$species$assemblage

# Standardise the timeOfDay and replace NAs with 0
tod <- with(Finnmark, (timeOfDay - mean(timeOfDay, na.rm=TRUE))/ sd(timeOfDay, na.rm=TRUE))
tod[is.na(tod)] <- 0
str(tod)




