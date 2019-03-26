library(ACSWR)


### Name: shelf_stock
### Title: The Shelf-Stocking Data
### Aliases: shelf_stock
### Keywords: linear regression model

### ** Examples

data(shelf_stock)
sslm <- lm(Time ~ Cases_Stocked -1, data=shelf_stock)



