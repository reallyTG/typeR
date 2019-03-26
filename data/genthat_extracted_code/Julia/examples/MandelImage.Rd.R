library(Julia)


### Name: MandelImage
### Title: Mandelbrot Set Generator in a Square Domain
### Aliases: MandelImage

### ** Examples

# png image 
  imageN <- 5;
  centre <- 0.0
  L <- 4.0
  image<-MandelImage(imageN,centre,L);
  #file <- "mandelbrot1.png"
  # writePNG(image,file); # possible visualisation
# Closer lookup to set
  imageN <- 5;
  centre <- -0.5
  L <- 2.0
  image<-MandelImage(imageN,centre,L);
  # file <- "mandelbrot.png"
  #writePNG(image,file); # possible visualisation



