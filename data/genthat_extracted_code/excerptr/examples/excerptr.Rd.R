library(excerptr)


### Name: excerptr
### Title: Excerpt Structuring Comments and Set a Table of Contents.
### Aliases: excerptr

### ** Examples

root <- system.file(package = "excerptr")
test_files <- file.path(root, "excerpts", "tests", "files")
excerptr(file_name = file.path(test_files, "some_file.txt"),
         output_path = tempdir(), run_pandoc = FALSE,
         compile_latex = FALSE,
         pandoc_formats = c("tex", "html"))



