library(projects)


### Name: file_management
### Title: file management
### Aliases: file_management new_project_group move_project copy_project
###   archive_project open_project

### ** Examples

# SETUP
old_path <- Sys.getenv("PROJECTS_FOLDER_PATH")
setup_projects(path = tempdir(), .Renviron_path = fs::path_temp(".Renviron"))
#############################################################################

# setting up a simple project directory tree
new_project_group("kidney/clinical")
new_project_group("kidney/genomics")
new_project_group("prostate/clinical")
new_project_group("prostate/genomics")

# Wrapped in if(interactive()) because it requires interactive console input
# and fails automated package checking and testing.
if(interactive()){
  new_project(title = "Sample Authorless Project", path = "kidney")

  # Moving the project folder, then moving it again.
  move_project(project = 1, "kidney/genomics")
  move_project(project = "Sample Authorless Project", "prostate/clinical")

  # Copying the project
  copy_project(project_to_copy = 1, "kidney/clinical")

  # Archiving the copy of the project
  archive_project(2)

  # Opens the project in same session
  open_project("Sample")

  # Opens the project in a new session
  open_project(1, new_session = TRUE)
}
#############################################################################
# CLEANUP
Sys.setenv(PROJECTS_FOLDER_PATH = old_path)
fs::file_delete(c(fs::path_temp("projects"), fs::path_temp(".Renviron")))



