library(checkpoint)


### Name: checkpoint
### Title: Configures R session to use packages as they existed on CRAN at
###   time of snapshot.
### Aliases: checkpoint

### ** Examples

## Not run: 
##D 
##D # Create temporary project and set working directory
##D 
##D example_project <- paste0("~/checkpoint_example_project_", Sys.Date())
##D 
##D dir.create(example_project, recursive = TRUE)
##D oldwd <- setwd(example_project)
##D 
##D 
##D # Write dummy code file to project
##D 
##D cat("library(MASS)", "library(foreach)",
##D     sep="\n",
##D     file="checkpoint_example_code.R")
##D 
##D 
##D # Create a checkpoint by specifying a snapshot date
##D 
##D library(checkpoint)
##D checkpoint("2014-09-17")
##D 
##D # Check that CRAN mirror is set to MRAN snapshot
##D getOption("repos")
##D 
##D # Check that library path is set to ~/.checkpoint
##D .libPaths()
##D 
##D # Check which packages are installed in checkpoint library
##D installed.packages()
##D 
##D # cleanup
##D unlink(example_project, recursive = TRUE)
##D setwd(oldwd)
##D 
## End(Not run)




