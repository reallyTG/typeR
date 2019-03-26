library(SyNet)


### Name: procdnpoint
### Title: Pre-processing of Raw Point Data
### Aliases: procdnpoint
### Keywords: file

### ** Examples

  #####
  # You can recognize the format of a typical input file
  # in the following created .txt:
  write(c("sp", "latitude", "longitude"), file= "proof.txt", ncolumns = 3, append = TRUE, sep = ",")
  # Sample 20 points from a normal distribution and segregate them into two sets equally sized. 
  x <- c(rnorm(10), rnorm(10, 2))
  y <- rnorm(20)
  for (i in 1:20) 
    write(c(LETTERS[ceiling(i/10)], x[i], y[i]),file= "proof.txt", 3, TRUE, sep = ",")
  # Put getwd() to identify the path where
  # the file 'proof.txt' has been located
  # Read the generated file.
  proof <- read.coord(inputfile = "proof.txt", type = "cartesian") 
  procdnpoint(proof) # Show the values returned by this function
  #####
  unlink("proof.txt") # Delete



