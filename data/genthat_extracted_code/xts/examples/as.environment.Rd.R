library(xts)


### Name: as.environment.xts
### Title: Coerce an 'xts' Object to an Environment by Column
### Aliases: as.environment.xts
### Keywords: manip

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
colnames(x) <- "X"
y <- xts(1:10, Sys.Date()+1:10)
colnames(x) <- "Y"
xy <- cbind(x,y)
colnames(xy)
e <- as.environment(xy)    # currently using xts-style positive k 
ls(xy)
ls.str(xy)



