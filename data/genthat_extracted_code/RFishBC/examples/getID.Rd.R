library(RFishBC)


### Name: getID
### Title: Extracts a fish identification from a vector of image file names
### Aliases: getID

### ** Examples

## These are possible vectors of image file names with the fish ID after
##   the last underscore ... which is the default behavior
ex1 <- c("Scale_1.jpg","Scale_2.jpg")
ex2 <- c("Kiyi_472.bmp","Kiy_567.jpg")
ex3 <- c("PWF_MI345.tiff","PWF_WI567.tiff")
ex4 <- c("LKT_oto_23.jpg","LKT_finray_34.jpg")

## These are extracted fish IDs
getID(ex1)
getID(ex2)
getID(ex3)
getID(ex4)

## These are possible vectors of image file names with the fish ID NOT after
##   the last underscore. This requires judicious use of IDpattern= and
##   IDreplace= (similar to pattern= and replacement- as used in sub()).

### fish ID at the beginning of the name
ex5 <- c("1_Scale.jpg","2_Scale.jpg")
getID(ex5,IDpattern="\\_.*")

### fish ID between two underscores (might be used if multiple images for one ID)
ex6 <- c("DWS_100_1.jpg","DWS_101_2,jpg")
getID(ex6,IDpattern=".*\\_(.+?)\\_.*",IDreplace="\\1")
ex7 <- c("DWS_MI100_1.jpg","DWS_MI100_2,jpg")
getID(ex7,IDpattern=".*\\_(.+?)\\_.*",IDreplace="\\1")

### Will be warned if the returned IDs are not unique
## Not run: 
##D ex8 <- c("Ruffe_456.jpg","Ruffe_456.jpg","Ruffe_567.jpg")
##D getID(ex8)
## End(Not run)




