library(freesurfer)


### Name: mris_convert_vertex
### Title: Convert Surface to vertex file
### Aliases: mris_convert_vertex

### ** Examples

if (have_fs()) {
 bert_surf_dir = file.path(fs_subj_dir(), "bert", "surf")
 asc_file = mris_convert_vertex(
 infile = file.path(bert_surf_dir, "lh.white")
 )  
 readLines(asc_file, n = 6)
 
} 



