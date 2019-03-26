## ------------------------------------------------------------------------
library(adfExplorer)
blank.disk <- new("amigaDisk")

## ------------------------------------------------------------------------
## Create with constructor:
blank.block <- new("amigaBlock")

## Extract the first block from an amigaDisk object:
blank.block <- amigaBlock(blank.disk, block = 0)

## ------------------------------------------------------------------------
get.blockID(disktype = "DD", sector = 4, side = 0, cylinder = 35)

## ------------------------------------------------------------------------
get.diskLocation(disktype = "DD", block = 1231)

## ------------------------------------------------------------------------
blank.disk <- blank.amigaDOSDisk(diskname = "empty")
print(blank.disk)

## ------------------------------------------------------------------------
data("adf.example")

## ----eval=FALSE----------------------------------------------------------
#  amigaBlock(adf.example, 880)

## ----eval=FALSE----------------------------------------------------------
#  amigaBlock(adf.example, 881)

## ------------------------------------------------------------------------
list.adf.files(adf.example)

## ------------------------------------------------------------------------
## get the file from the amigaDisk object:
startup <- get.adf.file(adf.example, "df0:s/Startup-Sequence")

## the file content is returned as raw data.
## let's convert it to text:
startup <- rawToChar(startup)

## let's show it
cat(startup)

## ------------------------------------------------------------------------
## first get the file as raw data.
mod.raw <- get.adf.file(adf.example, "df0:mods/mod.intro")

## For the rest of the example we need
## the ProTrackR package
if (requireNamespace("ProTrackR", quietly = TRUE)) {
  con <- rawConnection(mod.raw, "rb")

  ## and read it as a ProTracker module
  mod <- ProTrackR::read.module(con)
  close(con)

  ## plot the first sample from the module:
  par(mar = c(5, 4, 0, 0) + 0.1)
  plot(ProTrackR::waveform(ProTrackR::PTSample(mod, 1)),
       type = "l", ylab = "Amplitude")
  
  ## and to play it, uncomment the following line:
  ## ProTrackR::playMod(mod)
}

## ------------------------------------------------------------------------
adf.example <- dir.create.adf(adf.example, "temp")

## ------------------------------------------------------------------------
adf.example <- put.adf.file(adf.example,
                            system.file("DESCRIPTION", package = "adfExplorer"),
                            "DF0:temp")

## ------------------------------------------------------------------------
adf.example <- put.adf.file(adf.example,
                            charToRaw("This is just some text to create some content"),
                            "DF0:temp/example.txt")

## ------------------------------------------------------------------------
list.adf.files(adf.example, "DF0:temp/")

