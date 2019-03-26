library(namer)


### Name: unname_all_chunks
### Title: Unname chunks in a single file
### Aliases: unname_all_chunks

### ** Examples

temp_file_path <- file.path(tempdir(), "test.Rmd")
file.copy(system.file("examples", "example4.Rmd", package = "namer"),
          temp_file_path,
          overwrite = TRUE)
unname_all_chunks(temp_file_path)
if(interactive()){
file.edit(temp_file_path)
}



