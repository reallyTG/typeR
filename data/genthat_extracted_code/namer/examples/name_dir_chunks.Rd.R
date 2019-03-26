library(namer)


### Name: name_dir_chunks
### Title: Name chunks of all Rmds in a dir
### Aliases: name_dir_chunks

### ** Examples

temp_dir <- tempdir()
# just to make sure we're not overwriting
if(fs::dir_exists(file.path(temp_dir, "examples"))){
fs::dir_delete(file.path(temp_dir, "examples"))
}
fs::dir_copy(system.file("examples", package = "namer"),
            temp_dir)
 # this is an example file that'd fail
fs::file_delete(file.path(temp_dir,
                         "examples", "example4.Rmd"))
name_dir_chunks(temp_dir)
if(interactive()){
file.edit(file.path(temp_dir,
                   "examples", "example1.Rmd"))
}



