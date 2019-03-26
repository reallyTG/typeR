library(pathological)


### Name: decompose_path
### Title: Split a path into its components
### Aliases: decompose_path get_extension recompose_path
###   recompose_path.decomposed_path replace_extension strip_extension

### ** Examples

x <- c(
  "somedir/foo.tgz",         # single extension
  "another dir\\bar.tar.gz", # double extension
  "baz",                     # no extension
  "quux. quuux.tbz2",        # single ext, dots in filename
  R.home(),                  # a dir
  "~",                       # another dir
  "~/quuuux.tar.xz",         # a file in a dir
  "",                        # empty 
  ".",                       # current dir
  "..",                      # parent dir
  NA_character_              # missing
)
(decomposed <- decompose_path(x))
get_extension(x)
strip_extension(x)
strip_extension(x, FALSE)
recompose_path(decomposed)



