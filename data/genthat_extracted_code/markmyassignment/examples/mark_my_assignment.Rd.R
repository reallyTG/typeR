library(markmyassignment)


### Name: mark_my_assignment
### Title: Mark assignment in global environment
### Aliases: mark_my_assignment

### ** Examples

assignment_path <- 
  file.path(system.file(package = "markmyassignment"), "extdata", "example_assignment01.yml")
set_assignment(assignment_path)
source(file.path(system.file(package = "markmyassignment"), "extdata", "example_lab_file.R"))
mark_my_assignment()




