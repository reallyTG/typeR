library(gifti)


### Name: readgii
### Title: Read GIFTI File
### Aliases: readgii readGIfTI read_gifti

### ** Examples

if (have_gifti_test_data(outdir = NULL)) {
   gii_files = download_gifti_data(outdir = NULL)
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
}
## Not run: 
##D if (have_gifti_test_data(outdir = NULL)) {
##D 
##D  if (requireNamespace("rgl", quietly = TRUE)) {
##D     rgl::rgl.open()
##D     rgl::rgl.triangles(surfs[[1]]$pointset, color = cols)
##D     rgl::play3d(rgl::spin3d(), duration = 5)
##D  }
##D }
## End(Not run)




