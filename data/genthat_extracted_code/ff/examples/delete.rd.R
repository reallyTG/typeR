library(ff)


### Name: delete
### Title: Deleting the file behind an ff object
### Aliases: delete delete.ff delete.ffdf delete.ff_pointer delete.default
###   deleteIfOpen deleteIfOpen.ff deleteIfOpen.ff_pointer
### Keywords: IO data

### ** Examples

  message('create the ff file outside getOption("fftempir"), 
    it will have default finalizer "close", so you need to delete it explicitely')
  x <- ff(1:12, pattern="./ffexample")
  delete(x)
  rm(x)



