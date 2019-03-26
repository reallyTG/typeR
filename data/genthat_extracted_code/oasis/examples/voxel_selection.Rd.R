library(oasis)


### Name: voxel_selection
### Title: Voxel Selection Procedure
### Aliases: voxel_selection voxel_selection_with_erosion

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

 flair <- readnii(niis)
 if (have.fsl()) {
   brain_mask = fslbet(niis) > 0
 } else {
   ind = list(c(10L, 81L), c(12L, 101L), c(3L, 78L))
   all.ind = lapply(ind, function(x) seq(x[1], x[2]))
   brain_mask = niftiarr(flair, 0)
   eg = expand.grid(all.ind)
   eg = as.matrix(eg)
   brain_mask[eg] = 1
 }
 voxel_selection_mask <- voxel_selection(flair,
   brain_mask, cutoff = .85)
}



