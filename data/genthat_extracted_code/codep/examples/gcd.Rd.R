library(codep)


### Name: gcd
### Title: Great circle distances
### Aliases: gcd.slc gcd.hf gcd.vife

### ** Examples

#
# Calculating the distances between Canada's capital cities:
CapitalCitiesOfCanada <-
    matrix(c(45.417,-75.7,53.533333,-113.5,48.422151,-123.3657,
             49.899444,-97.139167,45.95,-66.666667,47.5675,-52.707222,
             44.647778,-63.571389,43.7,-79.4,46.24,-63.1399,
             46.816667,-71.216667,50.454722,-104.606667,62.442222,-114.3975,
             63.748611,-68.519722,60.716667,-135.05),14L,2L,byrow=TRUE,
             dimnames=list(c("Ottawa","Edmonton","Victoria","Winnipeg",
                             "Fredericton","St-John's","Halifax","Toronto",
                             "Charlottetown","Quebec City","Regina",
                             "Yellowknife","Iqaluit","Whitehorse"),c("Lon","Lat")))
#
sphericalcosdists <- gcd.slc(CapitalCitiesOfCanada)
vincentydists <- gcd.vife(CapitalCitiesOfCanada)
#
cor(as.numeric(sphericalcosdists),as.numeric(vincentydists))
percentdev <- 100*(vincentydists-sphericalcosdists)/vincentydists
mean(percentdev)
# Spherical Law of Cosines underestimated these distances by ~0.26
# percent.
#



