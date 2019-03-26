library(dlib)


### Name: dlib-package
### Title: Allow Access to the Dlib C++ Library
### Aliases: dlib-package

### ** Examples

## Not run: 
##D library(Rcpp)
##D library(inline)
##D library(dlib)
##D 
##D ##
##D ## Example adapted from http://dlib.net/surf_ex.cpp.html
##D ## Find the SURF (https://en.wikipedia.org/wiki/Speeded_up_robust_features) 
##D ##   features of an image
##D 
##D ## 
##D ## Step 1: 
##D ## Register a function called dlib_surf to read and extract the FHOG features 
##D ## have a look at the file for how it is structured
##D f <- system.file("extdata", "rcpp_surf.cpp", package = "dlib")
##D cat(readLines(f), sep = "\n")
##D sourceCpp(f)
##D 
##D ## 
##D ## Step 2: 
##D ## Convert image from jpeg to BMP3 format as ine dlib_surf function, 
##D ##   we assume the file is in BMP3 format 
##D library(magick)
##D f <- system.file("extdata", "cruise_boat.jpeg", package = "dlib")
##D img <- image_read(path = f)
##D img 
##D f_bmp <- tempfile(fileext = ".bmp")
##D image_write(img, path = f_bmp, format = "BMP3")
##D 
##D ## 
##D ## Step 3: 
##D ## Apply the function Rcpp function dlib_surf on the image
##D dlib_surf(f_bmp)
## End(Not run)



