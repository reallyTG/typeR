library(documenter)


### Name: document_it
### Title: Generate documentation for the files of a directory.
### Aliases: document_it

### ** Examples

input <- system.file("extdata", "example", package = "documenter")
document_it(
input_directory = input,
output_file = file.path(tempdir(), "documentation"),
annotation_file = NULL
)



