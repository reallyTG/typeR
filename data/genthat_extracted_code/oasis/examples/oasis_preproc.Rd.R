library(oasis)


### Name: oasis_preproc
### Title: OASIS Image Preprocessing
### Aliases: oasis_preproc

### ** Examples

library(neurobase)
dl_file = function(url) {
   tfile = tempfile(fileext = ".nii.gz")
   req <- httr::GET(url,
   httr::write_disk(path = tfile))
   httr::stop_for_status(req)
   tfile
}
in_ci <- function() {
 nzchar(Sys.getenv("CI"))
}
on_cran = function() {
 identical(Sys.getenv("NOT_CRAN"), "false")
} 
if (in_ci() || on_cran()) {
  if (fslr::have.fsl() && require(httr)) {
    mods = c("FLAIR", "T1W", "T2W", "consensus_gt", "brainmask")
    base_url = file.path(
      "https://raw.githubusercontent.com/muschellij2/open_ms_data", 
      "master/cross_sectional/coregistered/patient01/")
    files = paste0(base_url, mods, ".nii.gz")
    files = sapply(files, dl_file)
    names(files) = mods

    flair <- readnii(files["FLAIR"])
    t1 <- readnii(files["T1W"])
    t2 <- readnii(files["T2W"])
    brain_mask <- readnii(files["brainmask"])
    gold_standard = readnii(files["consensus_gt"])
    oasis_preprocessed_data <- oasis_preproc(flair, t1, t2, 
      brain_mask = brain_mask)
  } 
}



