library(spec)


### Name: respecify.spec
### Title: Respecify Specification
### Aliases: respecify.spec

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug,tol = 3)
write.spec(spec, file = file)
drug %matches% spec
drug %matches% file
max <- max(drug$DV,na.rm=TRUE)
drug$DV[!is.na(drug$DV) & drug$DV == max] <- max + 1
drug %matches% file
respecify(file, drug)
drug %matches% file



