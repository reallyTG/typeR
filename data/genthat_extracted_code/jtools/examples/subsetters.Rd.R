library(jtools)


### Name: %not%
### Title: Subsetting operators
### Aliases: %not% %not%<- %just% %just%<- %not%.default %not%<-.default
###   %not%.data.frame %not%<-.data.frame %not%.matrix %not%<-.matrix
###   %just%.default %just%<-.default %just%.data.frame %just%<-.data.frame
###   %just%.matrix %just%<-.matrix

### ** Examples


 x <- 1:5
 y <- 3:8
 
 x %just% y # 3 4 5
 x %not% y # 1 2

 # Assignment works too
 x %just% y <- NA # 1 2 NA NA NA
 x %not% y <- NA # NA NA 3 4 5
 
 mtcars %just% c("mpg", "qsec", "cyl") # keeps only columns with those names
 mtcars %not% 1:5 # drops columns 1 through 5

 # Assignment works for data frames as well
 mtcars %just% c("mpg", "qsec") <- gscale(mtcars, c("mpg", "qsec"))
 mtcars %not% c("mpg", "qsec") <- gscale(mtcars %not% c("mpg", "qsec"))
 
 



