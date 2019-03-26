library(seas)


### Name: getstnname
### Title: Get station name
### Aliases: getstnname
### Keywords: utilities

### ** Examples

data(mscdata)

mscdata$id[1]
getstnname(mscdata$id[1])

ids <- levels(mscdata$id)
data.frame(id=I(ids), name=getstnname(ids))



