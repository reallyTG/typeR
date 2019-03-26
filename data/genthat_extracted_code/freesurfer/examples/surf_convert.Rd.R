library(freesurfer)


### Name: surf_convert
### Title: Convert Surface Data to ASCII
### Aliases: surf_convert

### ** Examples

if (have_fs()) {
   fname = file.path(fs_subj_dir(), "bert", "surf", "lh.thickness")
   out = surf_convert(fname)
}



