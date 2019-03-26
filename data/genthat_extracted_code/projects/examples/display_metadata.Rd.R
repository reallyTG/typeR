library(projects)


### Name: affiliations
### Title: View the 'projects()', 'authors()', and 'affiliations()' tables
### Aliases: affiliations authors display_metadata projects

### ** Examples

## No test: 
# Included in \donttest{} to save time on example checking.

# SETUP
old_path <- Sys.getenv("PROJECTS_FOLDER_PATH")
setup_projects(path = tempdir(), .Renviron_path = fs::path_temp(".Renviron"))
new_affiliation(department_name = "Math Dept.",
                institution_name = "Springfield College",
                address = "123 College St, Springfield, AB")
new_affiliation(department_name = "Art Department",
                institution_name = "Springfield College",
                address = "321 University Boulevard, Springfield, AB",
                id = 42)
new_affiliation(department_name = "Central Intelligence Agency",
                institution_name = "United States Government",
                address = "888 Classified Dr, Washington DC")
new_affiliation(department_name = "Pyrotechnics",
                institution_name = "ACME")
new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
           affiliations = "Art D", id = 13)
new_author(given_names = "Plato", id = 303)
new_author(given_names = "Condoleezza", last_name = "Rice",
           affiliations = c(1, 42, "Agency", "ACME"))
new_project(title = "Test project 1", current_owner = "Plato")
new_project(title = "Test project 2", current_owner = "eezza")
new_project(title = "Test project 3", current_owner = "Plato")
new_project(title = "Fun project 4",  current_owner = "Rice")
new_project(title = "Fun project 5",  current_owner = "Rice")
#############################################################################

# View entire affiliations table
affiliations()

# View affiliations table joined to authors table
# Notice that multiple rows are created for each affiliation-author combination
affiliations(authors = TRUE)

# Using dplyr functions to query the tables:

# View authors table joined to affiliations table, and filter out duplicate
# author ids, leaving one row for each author, each including the author's
# primary (i.e., first) affiliation
authors(affiliations = TRUE) %>%
  dplyr::distinct(id, .keep_all = TRUE) %>%
  dplyr::select(id, given_names, last_name, email, phone, address)

# View all projects with "Test" in their title
projects(project = "Test")

# View projects table, including only projects with Plato as current owner
projects() %>% dplyr::filter(current_owner == 303)

# Wrapped in if(interactive()) because it requires interactive console input
# and fails automated testing.
if(interactive()) {
  # Archive Fun project 5
  archive_project("Fun project 5")

  # Default behavior is to not include archived projects in projects() table
  projects("Fun")
  projects("Fun", archived = TRUE)
}

#############################################################################
# CLEANUP
Sys.setenv(PROJECTS_FOLDER_PATH = old_path)
fs::file_delete(c(fs::path_temp("projects"), fs::path_temp(".Renviron")))
## End(No test)



