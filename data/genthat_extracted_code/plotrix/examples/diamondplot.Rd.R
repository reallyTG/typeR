library(plotrix)


### Name: diamondplot
### Title: Plot multiple variables as polygons on a radial grid
### Aliases: diamondplot
### Keywords: misc

### ** Examples

 data(mtcars)
 mysubset<-mtcars[substr(dimnames(mtcars)[[1]],1,1)=="M",c("mpg","hp","wt","disp")]
 diamondplot(mysubset)



