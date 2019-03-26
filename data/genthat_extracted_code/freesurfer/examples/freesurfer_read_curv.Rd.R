library(freesurfer)


### Name: freesurfer_read_curv
### Title: Read Freesufer Curv file
### Aliases: freesurfer_read_curv

### ** Examples

if (have_fs()) {
   bert_dir = file.path(fs_subj_dir(), "bert", "surf")
   file = file.path(bert_dir, "lh.thickness")
   fid = file(file, open = "rb")
   out = freesurfer_read_curv(file)
} 



