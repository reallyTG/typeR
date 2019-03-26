## ---- eval = FALSE-------------------------------------------------------
#  outdir = NULL
#  library(gifti)
#  have_gifti_test_data(outdir = outdir)

## ---- include = FALSE----------------------------------------------------
outdir = NULL
library(gifti)
have_gifti_test_data(outdir = outdir)

## ---- eval = FALSE-------------------------------------------------------
#  if (!have_gifti_test_data()) {
#    download_gifti_data()
#  }

## ---- include = FALSE----------------------------------------------------
if (!have_gifti_test_data(outdir = outdir)) {
  download_gifti_data(outdir = outdir)
}

## ---- eval = FALSE-------------------------------------------------------
#  if (have_gifti_test_data(outdir = outdir)) {
#    gii_files = download_gifti_data(outdir = outdir)
#    gii_list = lapply(gii_files, readgii)
#    surf_files = grep("white[.]surf[.]gii", gii_files, value = TRUE)
#    surfs = lapply(surf_files, surf_triangles)
#  
#    col_file = grep("white[.]shape[.]gii", gii_files, value = TRUE)
#    cdata = readgii(col_file)
#    cdata = cdata$data$shape
#    mypal = grDevices::colorRampPalette(colors = c("blue", "black", "red"))
#    n = 4
#    breaks = quantile(cdata)
#    ints = cut(cdata, include.lowest = TRUE, breaks = breaks)
#    ints = as.integer(ints)
#    stopifnot(!any(is.na(ints)))
#    cols = mypal(n)[ints]
#    cols = cols[surfs[[1]]$triangle]
#  
#    if (requireNamespace("rgl", quietly = TRUE)) {
#      rgl::rgl.open()
#      rgl::rgl.triangles(surfs[[1]]$pointset, color = cols)
#      rgl::play3d(rgl::spin3d(), duration = 5)
#    }
#  }

## ---- include = FALSE----------------------------------------------------
if (have_gifti_test_data(outdir = outdir)) {
  gii_files = download_gifti_data(outdir = outdir)
  gii_list = lapply(gii_files, readgii)
  surf_files = grep("white[.]surf[.]gii", gii_files, value = TRUE)
  surfs = lapply(surf_files, surf_triangles)
  
  col_file = grep("white[.]shape[.]gii", gii_files, value = TRUE)
  cdata = readgii(col_file)
  cdata = cdata$data$shape
  mypal = grDevices::colorRampPalette(colors = c("blue", "black", "red"))
  n = 4
  breaks = quantile(cdata)
  ints = cut(cdata, include.lowest = TRUE, breaks = breaks)
  ints = as.integer(ints)
  stopifnot(!any(is.na(ints)))
  cols = mypal(n)[ints]
  cols = cols[surfs[[1]]$triangle]
  
  if (requireNamespace("rgl", quietly = TRUE)) {
    rgl::rgl.open()
    rgl::rgl.triangles(surfs[[1]]$pointset, color = cols)
    rgl::play3d(rgl::spin3d(), duration = 5)
  }
}

