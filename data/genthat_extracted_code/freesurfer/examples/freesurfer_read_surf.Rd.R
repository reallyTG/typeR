library(freesurfer)


### Name: freesurfer_read_surf
### Title: Read Freesurfer Surface file
### Aliases: freesurfer_read_surf

### ** Examples

if (have_fs()) {
   fname = file.path(fs_subj_dir(), "bert", "surf", "lh.inflated")
   out = freesurfer_read_surf(fname)
}



