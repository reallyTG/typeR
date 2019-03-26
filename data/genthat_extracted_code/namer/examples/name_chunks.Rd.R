library(namer)


### Name: name_chunks
### Title: Name chunks in a single file
### Aliases: name_chunks

### ** Examples

temp_file_path <- file.path(tempdir(), "test.Rmd")
file.copy(system.file("examples", "example1.Rmd", package = "namer"),
          temp_file_path,
          overwrite = TRUE)
name_chunks(temp_file_path)
if(interactive()){
file.edit(temp_file_path)
}
file.remove(temp_file_path)



