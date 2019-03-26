library(hydroTSM)


### Name: fdcu
### Title: Flow Duration Curve with uncertainty bounds.
### Aliases: fdcu.data.frame fdcu.default fdcu.matrix fdcu
### Keywords: graphs manip

### ** Examples

## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
q <- OcaEnOnaQts

# Creating a fictitious lower uncertainty band
lband <- q - min(q, na.rm=TRUE)

# Giving a fictitious upper uncertainty band
uband <- q + mean(q, na.rm=TRUE)

# Plotting the flow duration curve corresponding to 'q', with two uncertainty bounds
fdcu(q, lband, uband)



