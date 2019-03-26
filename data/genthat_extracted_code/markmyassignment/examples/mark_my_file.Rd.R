library(markmyassignment)


### Name: mark_my_file
### Title: Mark assignment file
### Aliases: mark_my_file

### ** Examples

assignment_path <- 
  paste0(system.file(package = "markmyassignment"), "/extdata/example_assignment01.yml")
file_path <- paste0(system.file(package = "markmyassignment"), "/extdata/example_lab_file.R")
mark_my_file(mark_file = file_path, assignment_path = assignment_path)




