## ----dl_data, eval = FALSE-----------------------------------------------
#  library(WhiteStripe)
#  download_img_data()

## ----dl_data_run, echo = FALSE, eval = TRUE------------------------------
lib.loc = tempdir() 
library(WhiteStripe)
download_img_data(lib.loc = lib.loc)

## ----get_data, eval = FALSE----------------------------------------------
#  files = ws_img_data()

## ----get_data_run, echo = FALSE, eval = TRUE-----------------------------
files = ws_img_data(lib.loc = lib.loc)

## ----t1------------------------------------------------------------------
library(oro.nifti)
t1 = files[grep("T1", basename(files))]
img = readNIfTI(fname = t1, reorient = FALSE)

## ------------------------------------------------------------------------
orthographic(img)

## ----hist----------------------------------------------------------------
vals = img[img > 0]
hist(vals, breaks = 2000)

## ----ws------------------------------------------------------------------
ws = whitestripe(img = img, type = "T1", stripped = TRUE)
names(ws)

## ----norm_ws-------------------------------------------------------------
norm = whitestripe_norm(img = img, indices = ws$whitestripe.ind)

## ----print_ws------------------------------------------------------------
hist(vals, breaks = 2000)
abline(v = ws$mu.whitestripe, col = "blue")
abline(v = ws$whitestripe, col = "red")

## ----ortho_overlay-------------------------------------------------------
mask = ws$mask.img
mask[mask == 0] = NA
orthographic(x = img, y = mask, col.y = "red")

## ----norm_hist-----------------------------------------------------------
norm_vals = norm[img > 0]
hist(norm_vals, breaks = 2000)

