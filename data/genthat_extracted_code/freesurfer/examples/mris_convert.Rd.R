library(freesurfer)


### Name: mris_convert
### Title: Use Freesurfers MRIs Converter
### Aliases: mris_convert

### ** Examples

if (have_fs()) {
 bert_surf_dir = file.path(fs_subj_dir(), "bert", "surf")
 asc_file = mris_convert(
 infile = file.path(bert_surf_dir, "lh.white")
 )  
} 



