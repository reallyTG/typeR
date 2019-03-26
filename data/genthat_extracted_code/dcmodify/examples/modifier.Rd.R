library(dcmodify)


### Name: modifier
### Title: Create or read a set of data modification rules
### Aliases: modifier

### ** Examples

m <- modifier( if (height < mean(height)) height <- 2*height
, if ( weight > mean(weight) ) weight <- weight/2  )
modify(women,m)





