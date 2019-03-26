library(freesurfer)


### Name: freesurfer_read3_con
### Title: Freesurfer Read 3 records
### Aliases: freesurfer_read3_con

### ** Examples

if (have_fs()) {
   bert_dir = file.path(fs_subj_dir(), "bert", "surf")
   file = file.path(bert_dir, "lh.thickness")
   fid = file(file, open = "rb")
   out = freesurfer_read3_con(file)
} 



