## ----setup, echo = FALSE, message = FALSE, warning = FALSE---------------
library(knitr)
opts_chunk$set(
  eval = FALSE,
  echo = TRUE, 
  prompt = FALSE, 
  message = FALSE, 
  warning = FALSE, 
  comment = "", results = 'hide',
  fig.width = 6,
  fig.height = 3,
  cache = TRUE)
library(freesurfer)
library(pander)
library(neurobase)
library(rgl)

## ----eval = FALSE--------------------------------------------------------
#  recon_all(infile, outdir, subjid)

## ---- eval=FALSE---------------------------------------------------------
#  recon_all(infile = "/path/to/T1.nii", subjid = "bert")

## ---- eval = TRUE, warning=FALSE, results='markup'-----------------------
if (have_fs()) {
  list.files(path  = file.path(fs_subj_dir(), "bert"))
}

## ----mri_convert, echo = TRUE, eval = TRUE-------------------------------
if (have_fs()) {
  library(freesurfer)
  bert_dir = file.path(fs_subj_dir(), "bert") # subject directory
  t1_mgz = file.path(bert_dir, "mri", "T1.mgz") # mgz file
  t1_nii_fname = tempfile(fileext = ".nii.gz") # temporary NIfTI file
  freesurfer::mri_convert(t1_mgz, t1_nii_fname) # conversion
  img = neurobase::readnii(t1_nii_fname) # read in outputs
}

## ----comp_mri, echo = TRUE, eval = TRUE, results='markup'----------------
if (have_fs()) {
  img_mgz = readmgz(t1_mgz)
  identical(img, img_mgz)
}

## ----mri_plot, echo = TRUE, eval = TRUE, dependson='mri_convert', fig.cap="Plot of T1-weighted image from bert subject in Freesurfer."----
if (have_fs()) {
  neurobase::ortho2(img, add.orient = FALSE, mask = img > 40)
}

## ----reorient_show, echo = TRUE, eval = FALSE----------------------------
#  if (have_fs()) {
#    L = fslr::rpi_orient(img)
#    reoriented_img = L[["img"]]
#  }

## ----reorient, echo = FALSE, eval = TRUE---------------------------------
if (have_fs()) {
  L = fslr::rpi_orient(img)
  reoriented_img = L$img
  rm(list = "L")
}

## ----mri_plot2, echo = TRUE, eval = TRUE, dependson='reorient', fig.cap="Plot of T1-weighted image from bert subject in Freesurfer after re-orientation to RPI orientation.  Note, the letters denote the orientation of right/left (R/L), posterior/anterior (P/A), inferior/superior (I/S). "----
if (have_fs()) {
  neurobase::ortho2(reoriented_img, mask = reoriented_img > 40)
}

## ----nu_correct_mcn2nii, echo = TRUE, eval = TRUE,  dependson="reorient", results='markup'----
if (have_fs()) {
  mnc = nii2mnc(reoriented_img)
  print(mnc)
}

## ----nu_correct_mcn2nii_show, echo = TRUE, eval = FALSE,  dependson="reorient", results='markup'----
#  if (have_fs()) {
#    nu_from_mnc = nu_correct(file = mnc)
#    class(nu_from_mnc)
#  }

## ----nu_correct_mcn2nii_run, echo = FALSE, eval = TRUE,  dependson="reorient", results='markup'----
if (have_fs()) {
  mnc = nii2mnc(reoriented_img)
  nu_from_mnc = nu_correct(file = mnc)
  class(nu_from_mnc)
}

## ----nu_correct_plot, echo = FALSE, eval = TRUE,  dependson="nu_correct_mcn2nii", results='markup', fig.cap="Inhomogeneity-corrected image output from Freesurfer \\code{nu\\_correct} command and the estimated log bias-field."----
if (have_fs()) {
  bias_field = finite_img(log(reoriented_img / nu_from_mnc))
  double_ortho(nu_from_mnc, bias_field, col.y = hotmetal(), mask = nu_from_mnc > 40)
}

## ----nu_correct_nifti_show, echo = TRUE, eval = FALSE--------------------
#  if (have_fs()) {
#    nu_masked = nu_correct(file = reoriented_img, mask = mask)
#  }

## ----nu_correct_nifti, echo = FALSE, eval = FALSE, results='markup', dependson=c("watershed_plot", "reorient")----
#  if (have_fs()) {
#    nu_masked = nu_correct(file = reoriented_img, mask = mask)
#    rm(list = c("nu_masked", "mask"))
#  }

## ----watershed, echo = FALSE, eval = TRUE, dependson="mri_convert"-------
if (have_fs()) {
  ss = mri_watershed(img)
}

## ----watershed_plot_show, echo = TRUE, eval = FALSE----------------------
#  if (have_fs()) {
#    ss = mri_watershed(img)
#    ortho2(ss, mask = ss)
#  }

## ----watershed_plot, echo = FALSE, eval = TRUE, dependson="watershed", fig.cap="Brain-extracted image after using Freesurfer \\code{mri\\_watershed} algorithm.  We see that the areas outside of the brain have been removed from the image."----
if (have_fs()) {
  #########################################
  # You cannot reorient beforehand if you use the template
  # in mri_watershed, which is the default
  # so you reorient after
  #########################################
  L = fslr::rpi_orient(ss)
  re_ss_img = L$img
  ortho2(re_ss_img, mask = re_ss_img)
  mask = re_ss_img > 0
  rm(list = c("L"))
}

## ----mask_show, echo = TRUE, eval = FALSE, dependson="watershed"---------
#  if (have_fs()) {
#    mask = ss > 0
#  }

## ----mask_run, echo = FALSE, eval = TRUE, dependson="watershed"----------
if (have_fs()) {
  writenii(mask, "mask.nii.gz")
}

## ----fs_lut, echo=TRUE, eval = TRUE, results='markup'--------------------
if (have_fs()) {
  head(freesurfer::fs_lut, 3)
}

## ----seg_file_show, echo = TRUE, eval = FALSE----------------------------
#  if (have_fs()) {
#    seg_file = file = file.path(fs_subj_dir(), "bert", "mri", "aseg.mgz")
#    seg = readmgz(seg_file)
#    breaks = c(-1, fs_lut$index)
#    colors = rgb(fs_lut$R, fs_lut$G, fs_lut$B, alpha = 255/2, maxColorValue = 255)
#    ortho2(ss, seg, col.y = colors, ybreaks = breaks)
#  }

## ----seg_file, echo = FALSE, eval = TRUE, dependson="watershed_plot", fig.cap="Overlay of segmentation from Freesurfer \\code{recon-all} command.  "----

if (have_fs()) {
  seg_file = file = file.path(fs_subj_dir(), 
                              "bert", "mri", "aseg.mgz")
  seg = readmgz(seg_file)
  L = fslr::rpi_orient(seg)
  seg = L$img
  breaks = c(-1, fs_lut$index)
  colors = rgb(fs_lut$R, fs_lut$G, fs_lut$B,
               alpha = 255/2,
               maxColorValue = 255)
  ortho2(re_ss_img, seg, 
         col.y = colors, 
         ybreaks = breaks,
         mask = re_ss_img)
  rm(list = c("L", "colors", "breaks"))
}

## ----read_aseg_stats, eval = TRUE, results='markup'----------------------
if (have_fs()) {
  file = file.path(fs_subj_dir(), "bert", "stats", "aseg.stats")
  out = read_aseg_stats(file)
  names(out)
}

## ----read_aseg_stats_meas, echo = TRUE, eval = TRUE, results='markup'----
if (have_fs()) {
  head(out$measures[, c("meaning", "value", "units")], n = 3)
}

## ----read_aseg_stats_struct, echo = TRUE, eval = TRUE, results='markup'----
if (have_fs()) {
  head(out$structures, n = 3)
}

## ----rgl_plot_show, cache=FALSE, eval = FALSE, echo = TRUE---------------
#  if (have_fs()) {
#    right_file = file.path(fs_subj_dir(),
#                     "bert", "surf", "rh.pial")
#    right_triangles = surface_to_triangles(infile = right_file)
#    left_file = file.path(fs_subj_dir(),
#                       "bert", "surf", "lh.pial")
#    left_triangles = surface_to_triangles(infile = left_file)
#    rgl::rgl.open()
#    rgl::rgl.triangles(right_triangles,
#                       color = rainbow(nrow(right_triangles)))
#    rgl::rgl.triangles(left_triangles,
#                       color = rainbow(nrow(left_triangles)))
#  }

## ----rgl_plot, cache = TRUE, eval = TRUE, echo = FALSE-------------------
if (have_fs()) {
    # rgl_out_file = "muschelli_files/figure-latex/rgl_plot_out.png"
  # if (!file.exists(rgl_out_file)) {
    right_file = file.path(fs_subj_dir(), 
                           "bert", "surf", "rh.pial")
    right_triangles = surface_to_triangles(infile = right_file)
    left_file = file.path(fs_subj_dir(), 
                          "bert", "surf", "lh.pial")
    left_triangles = surface_to_triangles(infile = left_file) 
    rgl::rgl.open()
    rgl::rgl.triangles(right_triangles, 
                       color = rainbow(nrow(right_triangles)))
    rgl::rgl.triangles(left_triangles, 
                       color = rainbow(nrow(left_triangles)))
    rgl::rgl.viewpoint(0, -70)
    # rpm * duration must equal 15 because 15 seconds / 60 seconds 
    # want 1/4 rotation.  
    # rot/min * 1min/60sec * #seconds = # rotations
    rgl::play3d(rgl::spin3d(axis = c(0,0,1), rpm = 100), 
           duration = .27)
    # rgl::rgl.snapshot(filename = rgl_out_file)
    # rgl::rgl.close()
    # rm(list = c("right_triangles", "left_triangles"))
  # }
}

## ----read_label, eval = TRUE, results='markup'---------------------------
if (have_fs()) {
  file = file.path(fs_subj_dir(), "bert", "label", "lh.cortex.label")
  out = read_fs_label(file)
  head(out)
}

