library(freesurfer)


### Name: read_fs_label
### Title: Read Label File
### Aliases: read_fs_label

### ** Examples

if (have_fs()) {
 file = file.path(fs_subj_dir(), "bert", "label", "lh.BA1.label")
 out = read_fs_label(file)
}



