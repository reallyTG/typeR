## ----setup, include=FALSE------------------------------------------------
library(cifti)
knitr::opts_chunk$set(
  echo = TRUE, cache = FALSE, comment = "")

## ------------------------------------------------------------------------
library(gifti)
library(cifti)
library(rgl)
library(matrixStats)


left_gii = "Q1-Q6_R440.L.inflated.32k_fs_LR.surf.gii"
right_gii = "Q1-Q6_R440.R.inflated.32k_fs_LR.surf.gii"
file = "curvature.32k_fs_LR.dscalar.nii"

left_gii = system.file("extdata", left_gii, package = "cifti")
right_gii = system.file("extdata", right_gii, package = "cifti")
file = system.file("extdata", file, package = "cifti")

#####################################
# Getting the Left coordinates/value mapping for cifti
#####################################
left = cifti_coords_gifti(
  file,
  gii_file = left_gii,
  structure = "CIFTI_STRUCTURE_CORTEX_LEFT")
# gifti surface
left_surf = surf_triangles(left_gii)

#####################################
# Getting the Right coordinates/value mapping for cifti
#####################################
right = cifti_coords_gifti(
  file,
  gii_file = right_gii,
  structure = "CIFTI_STRUCTURE_CORTEX_RIGHT")
right_surf = surf_triangles(right_gii)

all_vals = rbind(as.matrix(left$values), as.matrix(right$values))
vals = all_vals[,1]
ncol = 99
breaks = seq(
  min(vals, na.rm = TRUE),
  max(vals, na.rm = TRUE),
  len = ncol + 1)

ii <- cut(left$values,
          breaks,
          include.lowest = TRUE)
## Use bin indices, ii, to select color from vector of
# n-1 equally spaced colors
# ramp_cols = brewer.pal(11, "Spectral")
# ramp_cols = hotmetal()
# ramp_cols = c("red", "blue")
# ramp_cols = gray(0:64/64)
# ramp_cols = c("white", "black")
ramp_cols = c("black", "white")

colors <- colorRampPalette(
  ramp_cols
  )(ncol)[ii]

rgl.triangles(left_surf$pointset, color = colors)


ii <- cut(right$values,
          breaks,
          include.lowest = TRUE)
## Use bin indices, ii, to select color from vector of
# n-1 equally spaced colors
# colors <- colorRampPalette(
#   c("red", "blue"))(ncol)[ii]
rgl.triangles(right_surf$pointset, color = colors)


# rgl.close()

## ------------------------------------------------------------------------
rgl.open()

rgl.triangles(left_surf$pointset, color = colors)

left_mid = colMeans(left_surf$pointset)
left_ranges = colRanges(left_surf$pointset)
size_left = rowDiffs(left_ranges)
left_text = left_mid
left_text[3] = left_ranges[3,2] + size_left[3]/4
rgl.texts(x = left_text, text = "Left")



right_mid = colMeans(right_surf$pointset)
right_surf$pointset[,2] = right_surf$pointset[,2] + size_left[2] * 1.25
right_surf$pointset[,1] = -1 * right_surf$pointset[,1]
right_surf$pointset[,2] = -1 * right_surf$pointset[,2]

right_mid = colMeans(right_surf$pointset)
right_text = right_mid
right_text[3] =  left_text[3]

rgl.triangles(right_surf$pointset, color = colors)
rgl.texts(x = right_text, text = "Right")
rgl.viewpoint(0, -70)
play3d(spin3d(), duration = 3)

