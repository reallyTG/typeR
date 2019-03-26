library(markmyassignment)


### Name: set_assignment
### Title: Set and remove assignments
### Aliases: set_assignment remove_assignment is_assignment_set
###   show_assignment

### ** Examples

assignment_path <- path <- 
  file.path(system.file(package = "markmyassignment"), "/extdata/example_assignment01.yml")
set_assignment(assignment_path)
assignment_path <- path <- 
  file.path(system.file(package = "markmyassignment"), "/extdata/assignment_template.yml")
set_assignment(assignment_path)




