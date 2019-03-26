library(seaaroundus)


### Name: getcells
### Title: Get list of cells in a given shape
### Aliases: getcells

### ** Examples

getcells("POLYGON ((-48.177685950413291 15.842380165289299,
-48.177685950413291 15.842380165289299,
-54.964876033057919 28.964280991735578,
-35.960743801652967 27.606842975206646,
-48.177685950413291 15.842380165289299))")

wkt <- "POLYGON((2.37 43.56,13.18 43.56,13.18 35.66,2.37 35.66,2.37 43.56))"
getcells(wkt)

wkt <-
"MULTIPOLYGON(((15 5,5 10,10 20,40 10,15 5)),((30 20,10 40,45 40,30 20)))"
getcells(wkt)



