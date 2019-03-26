library(dcmodify)


### Name: modify
### Title: Modify a data set
### Aliases: modify modify,data.frame,modifier-method

### ** Examples

m <- modifier( if (height < mean(height)) height <- 2*height
, if ( weight > mean(weight) ) weight <- weight/2  )
modify(women,m)



