library(gapfill)


### Name: Validate
### Title: Validation with RMSE
### Aliases: Validate validate

### ** Examples

Validate(c(1, NA, 2, NA), c(1, 2, 2, NA), c(1, 1, 2, 2))

## validate gap-fill predictions: consider the ndvi data
Image(ndvi)

## define some validation points vp
## in the image of the day 145 of the year 2004
vp <- 300 + c(5:10) + rep(21 * c(0:5), each = 6)

## remove the vp values from the data
nn <- ndvi
nn[vp] <- NA
Image(nn)

## predict the vp values 
out <- Gapfill(nn, subset = vp)
Validate(dataObserved = nn, dataFilled = out$fill,
         dataTrue = ndvi)




