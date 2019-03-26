library(sublime)


### Name: SuBLIME_prediction
### Title: Gets predicted probabilities from SuBLIME
### Aliases: SuBLIME_prediction
### Keywords: Sublime_prediction

### ** Examples

## Not run: 
##D download_data()
##D modes = c("FLAIR", "PD", "T2", "VolumetricT1")
##D modals = paste0(modes, "norm.nii.gz")
##D base_files = system.file(file.path("01/Baseline", modals), package="SuBLIME")
##D base_imgs = lapply(base_files, readNIfTI, reorient=FALSE)
##D f_files = system.file(file.path("01/FollowUp", modals), package="SuBLIME")
##D f_imgs = lapply(f_files, readNIfTI, reorient=FALSE) 
##D names(base_imgs) = names(f_imgs) = modes
##D baseline_nawm_file =  system.file("01/Baseline/nawm.nii.gz", package="SuBLIME")
##D baseline_nawm_mask =  readNIfTI(baseline_nawm_file, reorient=FALSE)
##D baseline_nawm_mask = drop(baseline_nawm_mask)
##D follow_up_nawm_file =  system.file("01/FollowUp/nawm.nii.gz", package="SuBLIME")
##D follow_up_nawm_mask =  readNIfTI(follow_up_nawm_file, reorient=FALSE) 
##D brain_file =  system.file("01/duramask.nii.gz", package="SuBLIME")
##D brain_mask =  readNIfTI(brain_file, reorient=FALSE) 
##D brain_mask = drop(brain_mask)
##D 
##D follow_up_nawm_mask = NULL
##D baseline_nawm_mask = NULL
##D smooth.using = "GaussSmoothArray"
##D verbose = TRUE
##D time_diff = 10
##D voxsel = TRUE
##D model = SuBLIME_model
##D #voxsel.sigma = s.sigma =diag(3,3)
##D #s.ksize = 3
##D #voxsel.ksize = 5
##D 
##D outimg = SuBLIME_prediction(
##D baseline_flair = base_imgs[["FLAIR"]],
##D follow_up_flair= f_imgs[["FLAIR"]],
##D baseline_pd = base_imgs[["PD"]],
##D follow_up_pd = f_imgs[["PD"]],
##D baseline_t2 = base_imgs[["T2"]], 
##D follow_up_t2 = f_imgs[["T2"]],
##D baseline_t1 = base_imgs[["VolumetricT1"]],
##D follow_up_t1 = f_imgs[["VolumetricT1"]],
##D time_diff = time_diff,
##D baseline_nawm_mask = baseline_nawm_mask,
##D brain_mask = brain_mask,
##D voxsel = voxsel,
##D model = model, plot.imgs= TRUE,
##D pdfname = "~/Dropbox/SuBLIME_Web_Test/01/pckg_diagnostc.pdf"
##D )
##D 
##D names(base_imgs) = paste0("baseline_", c("flair", "pd", "t2", "t1"))
##D names(f_imgs) = paste0("follow_up_", c("flair", "pd", "t2", "t1"))
##D attach(base_imgs)
##D attach(f_imgs)
## End(Not run)



