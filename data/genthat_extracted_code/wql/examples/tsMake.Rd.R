library(wql)


### Name: tsMake
### Title: Create time series from water quality data
### Aliases: tsMake tsMake,WqData-method
### Keywords: ts

### ** Examples


# Create new WqData object
sfb <- wqData(sfbay, c(1, 3:4), 5:12, site.order = TRUE,
         time.format = "%m/%d/%Y", type = "wide")

# Find means in the 0-10 m layer
y <- tsMake(sfb, focus = 's27', layer = c(0, 10))
plot(y, main = 'Station 27')
# Or select medians in the same layer
y1 <- tsMake(sfb, focus = 's27', layer = c(0, 10), qprob = 0.5)
plot(y1, main = 'Station 27')
# Compare means:medians
apply(y/y1, 2, mean, na.rm=TRUE)

# Combine a layer with a single additional depth
y <- tsMake(sfb, focus = 'chl', layer = list(c(0, 2), 5))
plot(y, main = 'Chlorophyll a, ug/L')

# Use values from the deepest samples
y <- tsMake(sfb, focus = 'dox', layer = "max.depths", type = 'zoo')
head(y)
plot(y, type="h", main = "'Bottom' DO, mg/L")




