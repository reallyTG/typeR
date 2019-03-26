library(freesurfer)


### Name: freesurfer_read3
### Title: Freesurfer Read 3 records
### Aliases: freesurfer_read3

### ** Examples

if (have_fs()) {
   bert_dir = file.path(fs_subj_dir(), "bert", "surf")
   file = file.path(bert_dir, "lh.thickness")
   out = freesurfer_read3(file)
}



