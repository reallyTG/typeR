library(Julia)


### Name: JuliaImage
### Title: Julia Set Generator in a Square Region
### Aliases: JuliaImage

### ** Examples

# 
# Generating png of the Julia set
# C is 1 minus the golden ratio
#
  imageN <- 5;
  centre <- 0.0
  L <- 4.0
  C <- 1-1.6180339887;# Golden Ratio
  image <- JuliaImage(imageN,centre,L,C);
  #library(png)
  #file <- "julia1.png"
  #writePNG(image,file); # possible visulation
#
#  Generating png of the Julia set
# different coefficient.
#
  imageN <- 5;
  centre <- 0.0
  L <- 4.0
  C <- -0.70176-0.3842i
  image <- JuliaImage(imageN,centre,L,C);
  #library(png)
  #file <- "julia2.png"
  #writePNG(image,file); # possible visulation




