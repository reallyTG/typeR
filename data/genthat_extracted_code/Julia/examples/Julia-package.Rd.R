library(Julia)


### Name: Julia-package
### Title: Julia
### Aliases: Julia-package Julia
### Keywords: package

### ** Examples

# Julia Set
  imageN <- 5;
  centre <- -1.0
  L <- 2.0
  file <- "julia1a.png"
  C <- 1-1.6180339887;# Golden Ration
  image <- JuliaImage(imageN,centre,L,C);
 # writePNG(image,file);# possible visulisation
# Mandelbrot Set
  imageN <- 5;
  centre <- 0.0
  L <- 4.0
  file <- "mandelbrot1.png"
  image<-MandelImage(imageN,centre,L);
 # writePNG(image,file);# possible visulisation



