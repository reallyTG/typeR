library(geomorph)


### Name: define.sliders
### Title: Select points to "slide" along curves
### Aliases: define.sliders
### Keywords: utilities

### ** Examples

 
## (not run) Use interactive function in rgl window
 # data(scallops)
 # define.sliders(scallops$coorddata[,,1], nsliders=11,surfsliders = scallops$surfslide) 
 # here the first specimen is used for plotting purposes only
 
## Examples of AUTO mode 
 ## 1 curve of sliding semilandmark
 # Define sliders for scallopdata
 sliders = define.sliders(c(5:16,1))

 ## 2 curves of sliding semilandmarks
 # Define sliders for 10 landmarks, where LMs 1, 5, and 10 fixed
 # 2, 3, and 4 are along a curve between 1 and 5
 # and 6, 7, 8, and 9 are along a curve between 5 and 10.
 sliders = rbind(define.sliders(1:5), define.sliders(5:10)) 



