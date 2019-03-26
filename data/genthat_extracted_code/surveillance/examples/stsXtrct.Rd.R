library(surveillance)


### Name: [,sts-methods
### Title: Extraction and Subsetting of '"sts"' Objects
### Aliases: [,sts-method [,sts,ANY,ANY,ANY-method
### Keywords: methods array

### ** Examples

data("ha.sts")
haagg <- aggregate(ha.sts, nfreq=13)

plot(haagg[, 3])       # Single series
plot(haagg[1:30, 3])   # Somewhat shorter

#Counts at time 20
plot(haagg[20, ], type = observed ~ unit)



