library(riverdist)


### Name: riverdistancemat
### Title: River Distance Matrix
### Aliases: riverdistancemat

### ** Examples

data(Gulk, fakefish)

logi1 <- (fakefish$flight.date==as.Date("2015-11-25"))

riverdistancemat(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, logical=logi1)



