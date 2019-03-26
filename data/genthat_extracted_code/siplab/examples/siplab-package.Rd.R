library(siplab)


### Name: siplab-package
### Title: Spatial Individual-Plant Simulation
### Aliases: siplab-package siplab

### ** Examples

# Pretend that the data is given as a simple data frame
data <- as.data.frame(spruces) #  from a spatstat data set
head(data) # x-y coordinates in a 56x38 m plot, marks are dbh in meters
# Convert to a point pattern object, dbh in cm
datap <- ppp(data$x, data$y, c(0, 56), c(0, 38), marks = data$marks * 100)
# Hegyi (1974) index (as usual without his original 1-foot distance offset)
hegyi <- pairwise(datap, maxR = 6, kernel = powers.ker, kerpar = list(pi=1,
    pj=1, pr=1, smark=1))
head(marks(hegyi))
# ZOI model
zoi <- assimilation(datap, influence=zoi.inf, infpar=c(k=0.2, smark=1),
    asym=1)



