library(freesurfer)


### Name: convert_surface
### Title: Convert Freesurfer Surface
### Aliases: convert_surface

### ** Examples

if (have_fs()) {
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "rh.pial")
res = convert_surface(infile = infile)
}



