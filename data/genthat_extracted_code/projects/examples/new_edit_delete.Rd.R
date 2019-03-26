library(projects)


### Name: edit_project
### Title: Create, edit or delete projects, authors and affiliations
### Aliases: edit_project edit_author edit_affiliation delete_project
###   delete_author delete_affiliation new_edit_delete new_project
###   new_author new_affiliation

### ** Examples

# SETUP
old_path <- Sys.getenv("PROJECTS_FOLDER_PATH")
setup_projects(path = tempdir(), .Renviron_path = fs::path_temp(".Renviron"))
############################################################################

# Creating affiliations
new_affiliation(department_name = "Math Dept.",
                institution_name = "Springfield College",
                address = "123 College St, Springfield, AB")
new_affiliation(department_name = "Art Department",
                institution_name = "Springfield College",
                address = "321 University Boulevard, Springfield, AB",
                id = 42)

# Editing an affiliation
edit_affiliation("Math Dept", department_name = "Mathematics Department")

# Creating authors
new_author(given_names = "Rosetta", last_name = "Stone",
           affiliations = c(42, "Math"), degree = "PhD",
           email = "slab@rock.net", phone = "867-555-5309", id = 8888)
new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
           affiliations = "Art D", id = 13)
new_author(last_name = "Plato", id = 303)

# Editing an author, showcasing the removal of a text element (last_name)
edit_author(author = 303, given_names = "Plato", last_name = NULL)

# Editing an author, showcasing the addition and removal of affiliations
edit_author("Spiro", affiliations = ~ -"Art D" + Math)

# Creating a project
new_project(title = "Understanding the Construction of the United States",
            short_title = "USA", authors = c(13, "Stone"),
            stage = 4, deadline = "2055-02-28", deadline_type = "submission",
            path = "famous_studied/philosophers/rocks",
            corresp_auth = "Stone", current_owner = "agnew",
            make_directories = TRUE, use_bib = TRUE,
            status = "waiting on IRB")

# Editing a project, showcasing the addition and removal of authors
edit_project("Understanding", short_title = "usa1",
             authors = ~ + "303" - 13 - Stone)

# Wrapped in if(interactive()) because it requires interactive console input
# and fails automated package checking and testing.
if(interactive()) {
  delete_project("usa1")
  delete_author(303)
  delete_affiliation("Math")
}

#############################################################################
# CLEANUP
Sys.setenv(PROJECTS_FOLDER_PATH = old_path)
fs::file_delete(c(fs::path_temp("projects"), fs::path_temp(".Renviron")))



