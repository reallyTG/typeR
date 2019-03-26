library(banR)


### Name: reverse_geocode_tbl
### Title: Reverse geocode tbl
### Aliases: reverse_geocode_tbl

### ** Examples


table_reverse <- tibble::tibble(
x = c(2.279092, 2.375933,2.308332), 
y = c(48.84683, 48.84255, 48.85032), 
z = rnorm(3)
)

reverse_geocode_tbl(tbl = table_reverse, longitude = x, latitude = y)




