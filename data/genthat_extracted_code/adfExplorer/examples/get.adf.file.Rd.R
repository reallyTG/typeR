library(adfExplorer)


### Name: get.adf.file
### Title: Get a file from an amigaDisk object
### Aliases: get.adf.file get.adf.file,amigaDisk,character,missing-method
###   get.adf.file,amigaDisk,character,character-method
###   get.adf.file,amigaDisk,character,ANY-method

### ** Examples

data(adf.example)

## Not run: 
##D ## get the file "Startup-Sequence" from the virtual
##D ## example disk and save as a text file in the
##D ## current working directory:
##D get.adf.file(adf.example, "DF0:S/Startup-Sequence", "startup.txt")
## End(Not run)

## get the same file as raw data
## by omitting the destination:
startup <- get.adf.file(adf.example, "DF0:S/Startup-Sequence")

## Look, it's a text file:
cat(rawToChar(startup))

if (requireNamespace("ProTrackR", quietly = TRUE)) {
  ## look there is a typical ProTracker module on
  ## the example disk. You can load it like this:
  
  ## get the file from the virtual disk
  ## as raw data
  mod.raw <- get.adf.file(adf.example, "DF0:mods/mod.intro")

  ## open a raw connection with the
  ## newly imported raw data
  con <- rawConnection(mod.raw, "rb")

  ## and read it as a ProTracker module
  mod <- ProTrackR::read.module(con)
  close(con)
  
  ## plot the first sample from the module:
  plot(ProTrackR::waveform(ProTrackR::PTSample(mod, 1)),
       type = "l", ylab = "amplitude")
} else {
  cat("You need to install and load the\nProTrackR package for this part of the example.")
}



