library(neurobase)


### Name: remap_filename
### Title: Build Filename (usually for images)
### Aliases: remap_filename

### ** Examples

fname = file.path("/path/to/file", "original.nii.gz")
remap_filename(fname, prefix = "preproc_", "_with_gz")
fname = "original.nii"
remap_filename(fname, prefix = "note_", "_has_directory")
remap_filename(c(fname, "other.nii.gz"), prefix = "note_", "_has_directory")



