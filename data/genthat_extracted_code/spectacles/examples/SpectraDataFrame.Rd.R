library(spectacles)


### Name: SpectraDataFrame
### Title: Constructor for the SpectraDataFrame class.
### Aliases: SpectraDataFrame

### ** Examples


  # Creating a SpectraDataFrame object from scratch
  my.wl <- 350:2500
  my.id <- c("A", "B")
  my.nir <- matrix(runif(2*length(my.wl)), nrow=2)
  my.data <- data.frame(foo = runif(2), bar = LETTERS[1:2])
  my.sdf <- SpectraDataFrame(wl = my.wl, nir = my.nir, id = my.id, data = my.data)

  # Creating a SpectraDataFrame object from an existing Spectra object
  my.s <- Spectra(wl = my.wl, nir = my.nir, id = my.id)
  my.sdf <- SpectraDataFrame(my.s, data = my.data)




