library(freesurfer)


### Name: surface_to_triangles
### Title: Convert Freesurfer Surface to Triangles
### Aliases: surface_to_triangles

### ** Examples

if (have_fs()) {
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "rh.pial")
right_triangles = surface_to_triangles(infile = infile)
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "lh.pial")
left_triangles = surface_to_triangles(infile = infile) 
if (requireNamespace("rgl", quietly = TRUE)) {
  rgl::rgl.open()
  rgl::rgl.triangles(right_triangles, 
  color = rainbow(nrow(right_triangles)))
  rgl::rgl.triangles(left_triangles, 
  color = rainbow(nrow(left_triangles)))
}
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "rh.inflated")
right_triangles = surface_to_triangles(infile = infile)  
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "lh.inflated") 
left_triangles = surface_to_triangles(infile = infile)  
if (requireNamespace("rgl", quietly = TRUE)) {
  rgl::rgl.open()
  rgl::rgl.triangles(left_triangles, 
  color = rainbow(nrow(left_triangles)))
  rgl::rgl.triangles(right_triangles, 
  color = rainbow(nrow(right_triangles)))   
} 
}



