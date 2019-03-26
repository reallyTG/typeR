## ----knit-setup, echo=FALSE, results='hide', eval=TRUE, cache = FALSE, warning = FALSE, message = FALSE----
library(spm12r)
library(neurobase)
library(matlabr)
in_ci <- function() {
  nzchar(Sys.getenv("CI"))
}
have_matlab = function() {
  matlabr::have_matlab() & !in_ci()
}
knitr::opts_chunk$set(eval = have_matlab())

## ----makefiles-----------------------------------------------------------
library(httr)
install_dir = tempdir()
url = paste0("https://ndownloader.figshare.com/articles/",
             "5442298/versions/1")
zipfile = tempfile(fileext = ".zip")
res = GET(
  url, 
  write_disk(path = zipfile),
  if (interactive()) progress())
run_dir = tempfile()
if (!dir.exists(run_dir)) {
  dir.create(run_dir)
}
out_files = utils::unzip(zipfile, exdir = run_dir)
names(out_files) = neurobase::nii.stub(
  out_files, bn = TRUE)
file.remove(zipfile)

## ---- include = FALSE----------------------------------------------------
rm(list = "res"); 
for (i in 1:10) {
  gc()
}

## ------------------------------------------------------------------------
library(neurobase)
##################################
# Added quick reading of nifti header
##################################
oro_pkg = packageVersion("oro.nifti")
neuro_pkg = packageVersion("neurobase")
if (oro_pkg < 0.8 || neuro_pkg < 1.22) {
  get_nifti = neurobase::check_nifti 
} else {
  get_nifti = neurobase::check_nifti_header
}

fmri_filename = out_files["fmri"]
t1_fname = out_files["anat"]
tr = 1.8 # seconds
hdr = get_nifti(fmri_filename) # getting nifti header

nslices = oro.nifti::nsli(hdr)
n_time_points = oro.nifti::ntim(hdr)
time_points = seq(n_time_points)
ta = 0
slice_order = c(
  1740, 1680, 1620, 1560, 1500, 1440, 1380, 
  1320, 1260, 1200, 1140, 1080, 1020, 960, 
  900, 840, 780, 720, 660, 600, 540, 480, 
  420, 360, 300, 240, 180, 120, 60, 0, 
  1740, 1680, 1620, 1560, 1500, 1440, 1380, 
  1320, 1260, 1200, 1140, 1080, 1020, 960, 
  900, 840, 780, 720, 660, 600, 540, 480, 420, 
  360, 300, 240, 180, 120, 60, 0)
ref_slice = 900

## ---- include = FALSE----------------------------------------------------
rm(list = "hdr"); gc(); gc();

## ----have_matlab---------------------------------------------------------
library(matlabr)
have_matlab()

## ---- eval = TRUE--------------------------------------------------------
have_matlab()

## ----realign-------------------------------------------------------------
library(spm12r)
####################################
# Realignment
####################################
if (have_matlab()) {
  
  realigned = spm12_realign( 
    filename = fmri_filename,
    time_points = time_points,
    quality = 0.98, 
    separation = 3,
    register_to = "mean",
    est_interp = "bspline4",
    reslice_interp = "bspline4",
    clean = FALSE,
    install_dir = install_dir
  )
  ################################
  # reading in the mean image
  ##########################
  mean_img = realigned[["mean"]]
  mean_nifti = readnii(mean_img)
  
  rpfile = realigned[['rp']]
  rp = read.table(file = rpfile, header = FALSE)
}

## ----rp_file-------------------------------------------------------------
####################################
# Read in Motion data
####################################
if (have_matlab()) {
  rpfile = realigned[['rp']]
  rp = read.table(file = rpfile, header = FALSE)
  colnames(rp) = c("x", "y", "z", 
                   "roll", "pitch", "yaw")
  rp = as.matrix(rp)
  print(head(rp))
  print(dim(rp))
}

## ----slice_time----------------------------------------------------------
####################################
# Slice Timing Correction
####################################
if (have_matlab()) {
  
  aimg = spm12_slice_timing(
    filename = realigned[['outfiles']],
    nslices = nslices,
    tr = tr, 
    slice_order = slice_order,
    time_points = seq(n_time_points),
    ta = ta, 
    ref_slice = ref_slice,
    prefix = "a", 
    clean = FALSE, 
    retimg = FALSE,
    install_dir = install_dir
    )
  print(aimg)
}

## ---- include = FALSE----------------------------------------------------
gc(); gc(); gc()

## ----acpc----------------------------------------------------------------
# if (have_matlab()) {
#   acpc_reorient(
#     infiles = c(mean_img, aimg),
#     modality = "T1")
# }

## ----coreg---------------------------------------------------------------
if (have_matlab()) {
  # acpc_reorient(
  # infiles = t1_fname,
  # modality = "T1")
  coreg = spm12_coregister_estimate(
    fixed = realigned[["mean"]], 
    moving = t1_fname, 
    cost_fun = "nmi",
    retimg = FALSE,
    install_dir = install_dir
    )
}

## ----seg-----------------------------------------------------------------
if (have_matlab()) {
  seg = spm12_segment(
    filename = coreg$outfile,
    set_origin = FALSE, 
    bias_corrected = TRUE,
    native = TRUE,
    dartel = TRUE,
    unmodulated = TRUE,
    modulated = TRUE,
    affine = "mni",
    sampling_distance = 1.5,
    retimg = FALSE,
    install_dir = install_dir
    )
  print(names(seg))
}

## ----norm_write----------------------------------------------------------
if (have_matlab()) {
  norm = spm12_normalize_write(
    deformation = seg$deformation,
    other.files = aimg$outfile,
    bounding_box = matrix(
      c(-78, -112, -70, 
        78, 76, 85), nrow = 2, 
      byrow = TRUE),
    interp = "bspline5",
    retimg = FALSE,
    install_dir = install_dir
    )
  
  anat_norm = spm12_normalize_write(
    deformation = seg$deformation,
    other.files = seg$bias_corrected,
    bounding_box = matrix(
      c(-78, -112, -70, 
        78, 76, 85), nrow = 2, 
      byrow = TRUE),
    interp = "bspline5",
    voxel_size = c(1, 1, 1),
    retimg = FALSE,
    install_dir = install_dir
  )
  
  anat_norm2x2x2 = spm12_normalize_write(
    deformation = seg$deformation,
    other.files = seg$bias_corrected,
    bounding_box = matrix(
      c(-78, -112, -70, 
        78, 76, 85), nrow = 2, 
      byrow = TRUE),
    interp = "bspline5",
    voxel_size = c(2, 2, 2),
    retimg = FALSE,
    install_dir = install_dir
  )  
}

## ----smooth--------------------------------------------------------------
if (have_matlab()) {
  smooth_norm = spm12_smooth(
    norm$outfiles[[1]], 
    fwhm = 5, 
    prefix = "s5",
    retimg = FALSE,
    install_dir = install_dir
    )
}

## ----first_model---------------------------------------------------------
output_directory = file.path(run_dir, "output")
if (!dir.exists(output_directory)) {
  dir.create(output_directory)
}
output_directory = normalizePath(output_directory)

################################
# Same model just using condition list
################################
condition_list = list(
  list(name = "LeftHand",
       onset = c(20, 100, 180, 260, 340, 420),
       duration = c(20, 20, 20, 20, 20, 20)
  ),
  list(name = "RightHand",
       onset = c(60, 140, 220, 300, 380, 460),
       duration = c(20, 20, 20, 20, 20, 20)
  )
)
if (have_matlab()) {
  first_model = spm12_first_level(
    scans = smooth_norm$outfiles,
    n_time_points = n_time_points,
    units = "secs",
    slice_timed = FALSE,
    tr = tr,
    condition_list = condition_list,
    regressor_mat = rpfile,
    outdir = output_directory,
    clean = FALSE,
    install_dir = install_dir
  )
  
  cons = list.files(
    pattern = "beta.*[.]nii", 
    path = output_directory,
    full.names = TRUE)
  print(cons)
}

## ----conman--------------------------------------------------------------
contrasts = list(
  list(
    name = "LeftHand",
    weights = c(1, rep(0, 7)),
    replicate = "none",
    type = "T" ),
  list(name = "RightHand",
       weights = c(0, 1, rep(0, 6)),
       replicate = "none",
       type = "T"), 
  list(name = "AllEffects",
       weights = rbind(
         c(1, rep(0, 7)),
         c(0, 1, rep(0, 6))
       ),
       replicate = "none",
       type = "F")   
)


if (have_matlab()) {
  contrast_res = spm12_contrast_manager(
    spm = first_model$spmmat,
    delete_existing = TRUE,
    contrast_list = contrasts,
    clean = FALSE,
    install_dir = install_dir
  )
}

## ----gzipping------------------------------------------------------------
if (have_matlab()) {
  dir(output_directory)
  
  cons = list.files(
    pattern = "con.*[.]nii", path = output_directory,
    full.names = TRUE)
  print(cons)
  stats = list.files(
    pattern = "spm(T|F).*[.]nii", 
    path = output_directory,
    full.names = TRUE)
  print(stats)
  # anat_img = readnii(anat_norm2x2x2$outfiles)
  # stat_t = readnii(stats[2])
}

## ----tryout--------------------------------------------------------------
contrast_query_list = list(
  list(name = "LeftHand",
       weights = 1,
       threshold_type = "FWE",
       number_extent_voxels = 0,
       mask_type = "None"),
  list(name = "RightHand",
       weights = 2,
       threshold_type = "FWE",
       number_extent_voxels = 0,
       mask_type = "None")  
)

contrast_query_list = 
  list(
    list(
    name = "All Contrasts",
    weights = Inf,
    threshold_type = "FWE",
    number_extent_voxels = 0,
    mask_type = "None")
  )
if (have_matlab()) {
  display = all(Sys.getenv("DISPLAY") != "")
  desktop = display
  result_format = "csv"
  results = spm12_results(
    spm = first_model$spmmat,
    units = "Volumetric",
    result_format = result_format,
    contrast_list = contrast_query_list,
    clean = FALSE,
    display = display,
    desktop = FALSE,
    write_images = "binary_clusters",
    image_basename = "thresholded",
    install_dir = install_dir
    )
  out_results = list.files(
    pattern = paste0("spm.*[.]", result_format),
    path = output_directory,
    full.names = TRUE)  
  # out_dir = spm_directory(spm = first_model$spmmat)
}

## ---- echo = FALSE, results='asis'---------------------------------------
bib = '@article{ashburner2005unified,
  title={Unified segmentation},
  author={Ashburner, John and Friston, Karl J},
  journal={Neuroimage},
  volume={26},
  number={3},
  pages={839--851},
  year={2005},
  publisher={Elsevier}
}'
cat('Ashburner J and Friston KJ (2005). "Unified segmentation."
_Neuroimage_, *26*(3), pp. 839-851.')

