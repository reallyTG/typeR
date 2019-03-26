library(geometa)


### Name: ISODate
### Title: ISODate
### Aliases: ISODate
### Keywords: ISO date

### ** Examples

  md <- ISODate$new()
  d <- ISOBaseDate$new(value = ISOdate(2015, 1, 1, 1))
  md$setDate(d)
  md$setDateType("publication")
  xml <- md$encode()




