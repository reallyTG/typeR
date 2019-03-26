library(freesurfer)


### Name: read_aseg_stats
### Title: Read Anatomical Segmentation Statistics
### Aliases: read_aseg_stats

### ** Examples

if (have_fs()) {
 file = file.path(fs_subj_dir(), "bert", "stats", "aseg.stats")
 out = read_aseg_stats(file)
}



