## ----setup, include=FALSE------------------------------------------------
library(neurobase)
library(oro.nifti)
library(methods)
library(ggplot2)
library(httr)
library(reshape2)
knitr::opts_chunk$set(
  echo = TRUE,  comment = "")

## ---- eval = FALSE-------------------------------------------------------
#  packages = installed.packages()
#  packages = packages[, "Package"]
#  if (!"oro.nifti" %in% packages) {
#    install.packages("oro.nifti")
#    ### development version
#    # devtools::install_github("bjw34032/oro.nifti")
#  }

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

## ----read_eve, cache = FALSE---------------------------------------------
eve_types = c("T1", "T2", "T1_Brain")
eve_stubs = paste0("JHU_MNI_SS_", eve_types, ".nii.gz")
url = "https://raw.githubusercontent.com/"
paths = paste(c("jfortin1",
                "EveTemplate", 
                "master",
                # "raw",
                "inst",
                "extdata"), 
              collapse = "/")
paths = paste(paths, eve_stubs, sep = "/")
path = paths[1]
eve_fnames = sapply(paths, function(path) {
  tmp = tempfile(fileext = ".nii.gz")
  req <- httr::GET(url, 
                   path = path, 
                   httr::write_disk(path = tmp),
                   httr::progress())
  httr::stop_for_status(req)
  return(tmp)
})
names(eve_fnames) = eve_types
readEve = function(what = c("T1", "T2", "Brain")) {
  what = match.arg(what)
  if (what == "Brain") {
    what = "T1_Brain"
  }
  fname = eve_fnames[what]
  readnii(fname)
}

## ----eve, cache=FALSE----------------------------------------------------
eve = readEve(what = "Brain")

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

## ----eve_full, cache = FALSE---------------------------------------------
eve_full = readEve(what = "T1")

## ----double_ortho--------------------------------------------------------
double_ortho(eve_full, eve)

## ----all_slices----------------------------------------------------------
image(eve, z = 90)

## ----one_slice-----------------------------------------------------------
image(eve, z = 90, plot.type = "single")

## ----two_slice-----------------------------------------------------------
image(eve, z = c(90, 100), plot.type = "single")

## ----one_slice_sag-------------------------------------------------------
image(eve, z = 98, plot.type = "single", plane = "sagittal")

## ----one_slice_overlay---------------------------------------------------
overlay(eve, y = eve > quantile(eve, 0.9), z = 90, plot.type = "single")

## ----one_slice_overlay_right---------------------------------------------
mask = eve > quantile(eve, 0.9)
mask[ mask == 0] = NA
overlay(eve, y = mask, z = 90, plot.type = "single")
rm(list = "mask")

## ----dd, cache=FALSE-----------------------------------------------------
reduced = dropEmptyImageDimensions(eve)
dim(eve)
dim(reduced)

## ----plot_red------------------------------------------------------------
ortho2(reduced)

## ----plot_full_eve-------------------------------------------------------
ortho2(eve)

## ----replace_empty, cache = FALSE----------------------------------------
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

## ----eve_df, cache=FALSE-------------------------------------------------
t2 = readEve(what = "T2")
df = data.frame(T1 = c(eve_full),
                T2 = c(t2),
                mask = c(eve > 0))
head(df)

## ----dplyr_df, cache=FALSE-----------------------------------------------
library(dplyr)
df = df %>% 
  filter(mask) %>% 
  select(-mask)

## ----make_hex, cache = FALSE---------------------------------------------
library(ggplot2)
g = ggplot(df) + stat_binhex()
g + aes(x = T1, y = T2)

## ----make_long, cache = FALSE--------------------------------------------
long = reshape2::melt(as.matrix(df))
colnames(long) = c("ind", "sequence", "value")
long$ind = NULL

## ----make_dists, cache = FALSE-------------------------------------------
library(ggplot2)
ggplot(long, aes(x = value)) + 
  geom_line(stat = "density") +
  facet_wrap(~ sequence, 
             scales = "free_x")

