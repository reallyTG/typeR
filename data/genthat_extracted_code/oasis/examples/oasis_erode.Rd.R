library(oasis)


### Name: oasis_erode
### Title: OASIS Erode Mask
### Aliases: oasis_erode

### ** Examples

library(neurobase)
library(fslr)
library(oasis)
niis = tempfile(fileext = ".nii.gz")
if (require(httr)) {
   url = paste0("https://s3.us-east-2.amazonaws.com/brainder/software/",
   "flair/templates/GG-853-FLAIR-2.0mm.nii.gz")
   req <- httr::GET(url,
   httr::write_disk(path = niis))
   httr::stop_for_status(req)

 flair <- fast_readnii(niis)
 res = oasis_erode(flair > 50, mm = c(2, 2, 2))
}



