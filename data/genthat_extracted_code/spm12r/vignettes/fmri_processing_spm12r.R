## ----knit-setup, echo=FALSE, results='hide', eval=TRUE, cache = FALSE, warning = FALSE, message = FALSE----
library(spm12r)
library(matlabr)
in_ci <- function() {
  nzchar(Sys.getenv("CI"))
}
have_matlab = function() {
  matlabr::have_matlab() & !in_ci()
}
knitr::opts_chunk$set(eval = have_matlab())

## ----makefiles-----------------------------------------------------------
library(kirby21.t1)
library(kirby21.fmri)
install_dir = tempdir()
outdir = tempfile()
dir.create(outdir)
stopifnot(download_fmri_data(outdir = outdir))
stopifnot(download_t1_data(outdir = outdir))
functional = get_fmri_filenames(ids = 113, visit = 1, outdir = outdir)
anatomical = get_t1_filenames(ids = 113, visit = 1, outdir = outdir)
files = c(anatomical = anatomical,
          functional = functional)
files

## ----include = FALSE, eval = TRUE----------------------------------------
tr = 2 # seconds
DROP = 10 # 20 seconds for stabilization

## ------------------------------------------------------------------------
library(neurobase)
tr = 2 # seconds
DROP = 10 # 20 seconds for stabilization

fmri = readnii(files["functional"])

times = (DROP + 1):ntim(fmri)
run_fmri = copyNIfTIHeader(fmri, fmri[,,,times], drop = TRUE)

## ---- include = FALSE----------------------------------------------------
rm(list = "fmri"); gc(); gc();

## ----nb_version, echo = FALSE, results="hide"----------------------------
library(neurobase)
ip = installed.packages()
ver = ip["neurobase", "Version"]
ver = compareVersion(ver, "1.13")
if (ver < 0) {
  remap_filename = function(
    x, 
    prefix = "", 
    suffix = "") {
    
    ext = parse_img_ext(x)
    ext = paste0(".", ext)
    tx = tolower(x)
    if (grepl("gz$", tx)) {
      ext = paste0(ext, ".gz")
    }
    dn = dirname(x)
    stub = nii.stub(x, bn = TRUE)
    
    file.path(
      dn,
      paste0(
        prefix, 
        stub,
        suffix,
        ext)
    )
  }
}

## ----have_matlab, eval = FALSE-------------------------------------------
#  library(matlabr)
#  have_matlab()

## ---- eval = TRUE--------------------------------------------------------
have_matlab()

## ----realign-------------------------------------------------------------
library(spm12r)
####################################
# Realignment
####################################
realign_batch = build_spm12_realign( 
  filename = run_fmri, 
  register_to = "mean",
  reslice = "mean"
)
print(names(realign_batch))
print(names(unlist(realign_batch$spm)))
if (have_matlab()) {
  realigned = spm12_realign( 
	filename = run_fmri, 
	register_to = "mean",
	reslice = "mean",
	clean = FALSE,
	install_dir = install_dir
  )
  print(names(realigned))
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
nslices = oro.nifti::nsli(run_fmri)
slice_order = 1:nslices
ref_slice = slice_order[median(seq(nslices))]
ta = tr - tr/nslices
n_time_points = ntim(run_fmri)

# using run_fmri because if you do not have
# matlab, then realigned not available
st_batch = build_spm12_slice_timing(
  filename = run_fmri,
  time_points = seq(n_time_points),
  nslices = nslices,
  tr = tr,
  ref_slice = ref_slice,
  prefix = "a")

print(names(st_batch))
print(names(unlist(st_batch$spm)))

if (have_matlab()) {
  
  st_results = spm12_slice_timing(
    filename = realigned[['outfiles']],
    time_points = seq(n_time_points),
    nslices = nslices,
    tr = tr, 
    slice_order = slice_order,
    ta = ta, 
    ref_slice = ref_slice,
    prefix = "a", 
    clean = FALSE, 
    retimg = FALSE,
    install_dir = install_dir
    )
  aimg = st_results$outfile
  print(aimg)
  mean_img = realigned[["mean"]]
  mean_nifti = readnii(mean_img)
}

## ------------------------------------------------------------------------
if (!have_matlab()) {
  run_fmri = filename_check(run_fmri)
}

## ----acpc----------------------------------------------------------------
if (have_matlab()) {
  acpc_reorient(
    infiles = c(mean_img, aimg),
    modality = "T1",
    install_dir = install_dir
    )
}

## ----direct_norm---------------------------------------------------------
if (have_matlab()) {
  bbox = matrix(
  		c(-90, -126, -72, 
  		90, 90, 108), 
  		nrow = 2, byrow = TRUE)
  print(bbox)
  direct_norm = spm12_normalize(
  	filename = mean_img,
  	other.files = c(mean_img, aimg),
  	bounding_box = bbox,
  	clean = FALSE,
    install_dir = install_dir
  	)
  print(names(direct_norm))
  dnorm_files = direct_norm$outfiles
  dnorm_mean_img = readnii(dnorm_files[1])
}

## ----coreg---------------------------------------------------------------
if (have_matlab()) {
  anatomical = files["anatomical"]
  anat_img = checknii(anatomical)
  print(anat_img)
  acpc_reorient(
    infiles = anat_img,
    modality = "T1",
    install_dir = install_dir
    )

  coreg = spm12_coregister(
  	fixed = mean_img,
  	moving = anat_img,
  	prefix = "r",
    install_dir = install_dir
  	)
  
  coreg_anat = coreg$outfile
  coreg_img = readnii(coreg_anat)
  double_ortho(coreg_img, mean_nifti)
}

## ----seg-----------------------------------------------------------------
if (have_matlab()) {
  seg_res = spm12_segment(
  	filename = coreg_anat,
  	set_origin = FALSE,
  	retimg = FALSE,
  	clean = FALSE,
    install_dir = install_dir
  	)
  print(names(seg_res))
}

## ----segs_to_hard--------------------------------------------------------
alpha = function(col, alpha = 1) {
  cols = t(col2rgb(col, alpha = FALSE)/255)
  rgb(cols, alpha = alpha)
} 
if (have_matlab()) {
  seg_files = check_nifti(seg_res$outfiles)
  hard_seg = spm_probs_to_seg(seg_files)
  hard_seg[ hard_seg > 3] = 0
  
  ortho2(coreg_img, hard_seg, 
         col.y = alpha(c("red", "green", "blue"), 0.5))
}

## ----norm_write----------------------------------------------------------
bbox = matrix(
  c(-90, -126, -72, 
    90, 90, 108), 
  nrow = 2, byrow = TRUE)
if (have_matlab()) {
  norm = spm12_normalize_write(
  	deformation = seg_res$deformation,
  	other.files = c(coreg_anat, mean_img, aimg),
  	bounding_box = bbox,
  	retimg = FALSE,
    install_dir = install_dir
  	)
  print(names(norm))
  norm_data = norm$outfiles
  names(norm_data) = c("anat", "mean", "fmri")
  norm_mean_img = readnii(norm_data["mean"])
  norm_anat_img = readnii(norm_data["anat"])
}

## ----check_norm----------------------------------------------------------
if (have_matlab()) {
  template_path = file.path(spm_dir(), 
                            "canonical", "avg152T1.nii")

  template = readnii(template_path)
  
  dnorm_mask = dnorm_mean_img > quantile(
    dnorm_mean_img[dnorm_mean_img > 0], 
    probs = 0.6)
  norm_mask = norm_mean_img > quantile(
    norm_mean_img[norm_mean_img > 0], 
    probs = 0.6)  
  
  double_ortho(template, norm_anat_img)
  double_ortho(template, norm_mean_img)
  double_ortho(norm_mean_img, norm_anat_img)
  ortho2(template, norm_mask, col.y = alpha("red", 0.5))

  double_ortho(template, dnorm_mean_img)
  ortho2(template, dnorm_mask, col.y = alpha("red", 0.5))
  double_ortho(norm_mean_img, dnorm_mean_img)
}

## ----smooth--------------------------------------------------------------
if (have_matlab()) {
  smoothed = spm12_smooth(
  	filename = norm_data["fmri"],
  	fwhm = 8,
  	prefix = "s",
  	retimg = FALSE,
    install_dir = install_dir
  	)
  smoothed_data = smoothed$outfiles
}

## ----smooth_mean---------------------------------------------------------
if (have_matlab()) {
  smoothed_mean = spm12_smooth(
  	filename = norm_data["mean"],
  	prefix = "s",
  	retimg = FALSE,
    install_dir = install_dir
  	)
  smoothed_mean_data = smoothed_mean$outfiles
}

## ----plot_smoothed_mean--------------------------------------------------
if (have_matlab()) {
  smooth_mean_img = readnii(smoothed_mean_data)
  ortho2(smooth_mean_img)
}

## ---- echo = FALSE-------------------------------------------------------
rm(list = ls()); 
for (i in 1:20) {
  gc()
}

## ------------------------------------------------------------------------
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

