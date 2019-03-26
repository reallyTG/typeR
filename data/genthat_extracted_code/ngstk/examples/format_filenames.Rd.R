library(ngstk)


### Name: format_filenames
### Title: Function to format filenames that can be used to unify the
###   filenames style for more easily download or use
### Aliases: format_filenames

### ** Examples

files_dir <- system.file('extdata', 'demo/format', package = 'ngstk')
pattern <- '*.txt'
x <- format_filenames(files_dir = files_dir, pattern = pattern, profix = 'hg38_')



