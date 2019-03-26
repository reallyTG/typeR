library(drake)


### Name: file_store
### Title: Tell 'drake' that you want information on a _file_ (target or
###   import), not an ordinary object.
### Aliases: file_store

### ** Examples

  # Wraps the string in single quotes.
  file_store("my_file.rds") # "'my_file.rds'"
  ## Not run: 
##D   test_with_dir("contain side effects", {
##D   load_mtcars_example() # Get the code with drake_example("mtcars").
##D   make(my_plan) # Run the workflow to build the targets
##D   list.files() # Should include input "report.Rmd" and output "report.md".
##D   head(readd(small)) # You can use symbols for ordinary objects.
##D   # But if you want to read cached info on files, use `file_store()`.
##D   readd(file_store("report.md"), character_only = TRUE) # File fingerprint.
##D   deps_code(file_store("report.Rmd"))
##D   config <- drake_config(my_plan)
##D   dependency_profile(
##D     file_store("report.Rmd"),
##D     config = config,
##D     character_only = TRUE
##D   )
##D   loadd(list = file_store("report.md"))
##D   get(file_store("report.md"))
##D   })
##D   
## End(Not run)



