library(bigMap)


### Name: bdm.init
### Title: Create bdm instance
### Aliases: bdm.init

### ** Examples


# --- get a matrix with raw-data
mydata <- matrix(rnorm(10000, mean = 0, sd = 3),  ncol = 2)
mylabels <- apply(mydata, 1, function(row) round(sqrt(sum(row**2)), 0))
# --- create a bdm instance with our raw-data matrix
mybdm <- bdm.init('mydataset', mydata, labels = mylabels)
str(mybdm)



