library(projects)


### Name: setup_projects
### Title: Set up the projects folder
### Aliases: setup_projects

### ** Examples

# This sequence is used in all other examples in this package.

# Back up old projects_folder()
old_path <- Sys.getenv("PROJECTS_FOLDER_PATH")

# This sets up an example projects_folder() in a temporary directory.
# It will not edit any of the user's .Renviron files.
setup_projects(path = tempdir(), .Renviron_path = fs::path_temp(".Renviron"))

# Cleanup
Sys.setenv(PROJECTS_FOLDER_PATH = old_path)
fs::file_delete(c(fs::path_temp("projects"), fs::path_temp(".Renviron")))



