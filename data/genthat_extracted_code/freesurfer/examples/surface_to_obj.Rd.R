library(freesurfer)


### Name: surface_to_obj
### Title: Convert Freesurfer Surface to Wavefront OBJ
### Aliases: surface_to_obj

### ** Examples

if (have_fs()) {
infile = file.path(fs_subj_dir(), 
                   "bert", "surf", "rh.pial")
res = surface_to_obj(infile = infile)
}



