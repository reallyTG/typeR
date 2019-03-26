library(freesurfer)


### Name: mris_convert_annot
### Title: Convert Annotation file
### Aliases: mris_convert_annot

### ** Examples

if (have_fs()) {
 bert_dir = file.path(fs_subj_dir(), "bert")
 gii_file = mris_convert_annot(
 infile = file.path(bert_dir, "surf", "lh.white"),
 annot = file.path(bert_dir, "label", "lh.aparc.annot"),
 ext = ".gii"
 )  
 gii = mris_convert_annot(
 infile = file.path(bert_dir, "surf", "lh.white"),
 annot = gii_file,
 ext = ".gii"
 )  
}   



