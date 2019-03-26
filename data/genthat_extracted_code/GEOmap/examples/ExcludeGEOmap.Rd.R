library(GEOmap)


### Name: ExcludeGEOmap
### Title: Exclude GEOmap Strokes
### Aliases: ExcludeGEOmap
### Keywords: misc

### ** Examples

data(coastmap)

###  extract (include)  the first 6 strokes from world map


A1 = ExcludeGEOmap(coastmap, 1:6, INOUT="in")
print(A1$STROKES$nam)





