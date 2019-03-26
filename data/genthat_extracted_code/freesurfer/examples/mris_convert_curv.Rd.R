library(freesurfer)


### Name: mris_convert_curv
### Title: Convert Curvature file
### Aliases: mris_convert_curv

### ** Examples

if (have_fs()) {
 bert_surf_dir = file.path(fs_subj_dir(), "bert", "surf")
 asc_file = mris_convert_curv(
 infile = file.path(bert_surf_dir, "lh.white"),
 curv = file.path(bert_surf_dir, "lh.thickness")
 )  
 res = read_fs_table(asc_file, header = FALSE)
 colnames(res) = c("index", "coord_1", "coord_2", "coord_3", "value")
 head(res)
}  



