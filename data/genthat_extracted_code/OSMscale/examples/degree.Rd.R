library(OSMscale)


### Name: degree
### Title: decimal degree coordinate conversion
### Aliases: degree
### Keywords: character spatial

### ** Examples

# DECIMAL to DMS notation: --------------------------------------------------
degree(52.366360, 13.024181)
degree(c(52.366360, -32.599203), c(13.024181,-55.809601))
degree(52.366360, 13.024181, drop=TRUE) # vector
degree(47.001, -13.325731, digits=5)

# Use table with values instead of single vectors:
d <- read.table(header=TRUE, sep=",", text="
lat, long
 52.366360,  13.024181
-32.599203, -55.809601")
degree(lat, long, data=d)

# DMS to DECIMAL notation: --------------------------------------------------
# You can use the degree symbol and escaped quotation mark (\") as well.
degree("52'21'58.9'N", "13'1'27.1'E")
print(degree("52'21'58.9'N", "13'1'27.1'E"), digits=15)

d2 <- read.table(header=TRUE, stringsAsFactors=FALSE, text="
lat long
52'21'58.9'N 13'01'27.1'E
32'35'57.1'S 55'48'34.6'W") # columns cannot be comma-separated!
degree(lat, long, data=d2)

# Rounding error checks: ----------------------------------------------------
oo <- options(digits=15)
d
degree(lat, long, data=degree(lat, long, d))
degree(lat, long, data=degree(lat, long, d, digits=3))
options(oo)
stopifnot(all(degree(lat,long,data=degree(lat,long,d, digits=3))==d))




