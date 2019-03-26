library(rmetasim)


### Name: landscape.write.foreign
### Title: Save a landscape to a file in a foreign format
### Aliases: landscape.write.foreign
### Keywords: misc

### ** Examples

  ## Needs write access to the current directory, files created!!
  exampleland <- landscape.new.example()
  landscape.write.foreign(exampleland, fn="exampleland.genepop", fmt="genepop")
  rm(exampleland)



