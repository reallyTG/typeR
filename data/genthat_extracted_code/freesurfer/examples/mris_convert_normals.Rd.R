library(freesurfer)


### Name: mris_convert_normals
### Title: Convert Surface to Surface normals
### Aliases: mris_convert_normals

### ** Examples

if (have_fs()) {
 bert_dir = file.path(fs_subj_dir(), "bert")
 asc_file = mris_convert_normals(
 infile = file.path(bert_dir, "surf", "lh.white")
 )  
readLines(asc_file, n = 6)
}   



