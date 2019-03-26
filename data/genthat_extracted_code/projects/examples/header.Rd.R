library(projects)


### Name: header
### Title: Print project header to console
### Aliases: header

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
new_author(given_names = "Rosetta", last_name = "Stone",
           affiliations = c(42, "Math"), degree = "PhD",
           email = "slab@rock.net", phone = "867-555-5309", id = 8888)
new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
           affiliations = "Art D", id = 13)
new_author(given_names = "Plato", id = 303)
new_project(title = "Test Project 1", authors = c(13, "303", "Stone"),
            corresp_auth = "Stone")
#############################################################################

header(1)

#############################################################################
# CLEANUP
Sys.setenv(PROJECTS_FOLDER_PATH = old_path)
fs::file_delete(c(fs::path_temp("projects"), fs::path_temp(".Renviron")))
## End(No test)



