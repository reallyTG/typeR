library(markmyassignment)


### Name: show_tasks
### Title: Get the name of the tasks in the assignment.
### Aliases: show_tasks

### ** Examples

# We first set the assignment
assignment_path <- 
 file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
set_assignment(assignment_path)
 
show_tasks()




