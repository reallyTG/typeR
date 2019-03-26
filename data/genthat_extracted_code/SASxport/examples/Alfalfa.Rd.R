library(SASxport)


### Name: Alfalfa
### Title: Example SAS data set
### Aliases: Alfalfa
### Keywords: datasets

### ** Examples

data(Alfalfa)

# go were the data is...
here <- getwd()
setwd(system.file("extdata",package="SASxport"))

# Description of the file contents
lookup.xport("Alfalfa.xpt")

# Load the file contents
Alfalfa <- read.xport("Alfalfa.xpt")
head(Alfalfa)

# return home
setwd(here)

# Just for fun, plot the data
par(mfrow=c(1,2))
plot( HARV1 ~ POP, data=Alfalfa)
plot( HARV2 ~ POP, data=Alfalfa)



