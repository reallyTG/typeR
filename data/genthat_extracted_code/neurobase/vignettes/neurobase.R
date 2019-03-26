## ----setup, include=FALSE------------------------------------------------
library(neurobase)
library(oro.nifti)
knitr::opts_chunk$set(echo = TRUE)

## ----nifti_obj-----------------------------------------------------------
library(oro.nifti)
set.seed(20161007)
dims = rep(10, 3)
arr = array(rnorm(10*10*10), dim = dims)
nim = oro.nifti::nifti(arr)
print(nim)
print(class(nim))
oro.nifti::is.nifti(nim)

## ----nifti_slot----------------------------------------------------------
nim@cal_max
cal_max(nim)
slot(nim, "cal_max")

## ----nifti_data----------------------------------------------------------
data = slot(nim, ".Data")
class(data)

## ----nifti_data2---------------------------------------------------------
data = oro.nifti::img_data(nim)
class(data)
dim(data)

## ----nifti_slice---------------------------------------------------------
slice = data[,,3]
class(slice)

## ----nifti_arr_slice-----------------------------------------------------
slice = data[,,3, drop = FALSE]
class(slice)

## ----slotnames-----------------------------------------------------------
slotNames(nim)

## ----logical-------------------------------------------------------------
above_zero = nim > 0
class(above_zero)
img_data(above_zero)[1]

## ----multi_log-----------------------------------------------------------
class(nim > 0 & nim < 2)

## ------------------------------------------------------------------------
class(nim * 2)
class(nim + (nim / 4))
class(nim * nim)
class(nim^2)

## ----sum-----------------------------------------------------------------
sum(above_zero)

## ----mean----------------------------------------------------------------
mean(above_zero)

## ----summs---------------------------------------------------------------
min(nim)
max(nim)
range(nim)
class(abs(nim))

## ----eve, cache=FALSE----------------------------------------------------
fname = system.file(
  file.path("nifti", "mniRL.nii.gz"),
  package = "oro.nifti")
eve = readnii(fname)

## ----ortho---------------------------------------------------------------
oro.nifti::orthographic(eve)

## ----ortho2--------------------------------------------------------------
neurobase::ortho2(eve)

## ----ortho2_noorient-----------------------------------------------------
neurobase::ortho2(eve, add.orient = FALSE)

## ----ortho_nona----------------------------------------------------------
orthographic(eve, y = eve > quantile(eve, 0.9))

## ----ortho2_nona---------------------------------------------------------
ortho2(eve, y = eve > quantile(eve, 0.9))

## ----eve2, cache=FALSE---------------------------------------------------
eve2 = eve
eve2[which.max(eve)] = eve2[which.max(eve)] * 5

## ----ortho2_large--------------------------------------------------------
ortho2(eve2)

## ----ortho2_rob----------------------------------------------------------
ortho2(robust_window(eve2))

## ----ortho2_zlim---------------------------------------------------------
ortho2(eve2, zlim = quantile(eve2, probs = c(0, 0.999)))

## ----eve_left------------------------------------------------------------
flipped_fname = system.file(
  file.path("nifti", "mniLR.nii.gz"),
  package = "oro.nifti")
flipped_eve = readnii(flipped_fname)

## ----double_ortho--------------------------------------------------------
double_ortho(flipped_eve, eve)

## ----all_slices----------------------------------------------------------
image(eve, z = 45)

## ----one_slice-----------------------------------------------------------
image(eve, z = 45, plot.type = "single")

## ----two_slice-----------------------------------------------------------
image(eve, z = c(45, 50), plot.type = "single")

## ----one_slice_sag-------------------------------------------------------
image(eve, z = 52, plot.type = "single", plane = "sagittal")

## ----one_slice_overlay---------------------------------------------------
overlay(eve, y = eve > quantile(eve, 0.9), z = 45, plot.type = "single")

## ----one_slice_overlay_right---------------------------------------------
mask = eve > quantile(eve, 0.9)
mask[ mask == 0] = NA
overlay(eve, y = mask, z = 45, plot.type = "single")
rm(list = "mask")

## ----dd, cache=FALSE-----------------------------------------------------
reduced = dropEmptyImageDimensions(eve)
dim(eve)
dim(reduced)

## ----plot_red------------------------------------------------------------
ortho2(reduced)

## ----plot_full_eve-------------------------------------------------------
ortho2(eve)

## ----replace_empty-------------------------------------------------------
dd = dropEmptyImageDimensions(eve, keep_ind = TRUE)
reduced = dd$outimg
reversed = replace_dropped_dimensions(img = reduced, 
                                      inds = dd$inds,
                                      orig.dim = dd$orig.dim)
all(reversed == eve)

## ----nim, cache = FALSE--------------------------------------------------
dims = dim(eve)
arr = array(rnorm(prod(dims)), dim = dims)
nim = nifti(arr)
nim

## ----copyniftiheader, cache = FALSE--------------------------------------
nim = copyNIfTIHeader(img = eve, arr = nim)
nim

## ----zeroes, cache=FALSE-------------------------------------------------
zeroes = niftiarr(eve, 0)

## ----masking-------------------------------------------------------------
eve_masked = mask_img(eve, eve > mean(eve))

## ----plot_mask-----------------------------------------------------------
ortho2(eve_masked)

## ----vec, cache=FALSE----------------------------------------------------
vals = c(eve)
class(vals)

## ----dens----------------------------------------------------------------
plot(density(vals))

## ----masking_2, cache=FALSE----------------------------------------------
vals = eve[ eve > 0 ]
mean(vals)
mean(eve)

## ----na_eve--------------------------------------------------------------
mask = eve > 0
mask[ mask == 0 ] = NA
eve_masked = mask_img(eve, mask)
mean(eve_masked)
mean(eve_masked, na.rm = TRUE)

## ----masking_3-----------------------------------------------------------
vals = eve[ eve > 0 ]

## ----dens_2--------------------------------------------------------------
plot(density(vals))

## ----dens_with_mask------------------------------------------------------
plot(density(eve, mask = eve > 0))

