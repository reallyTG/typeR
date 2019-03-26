library(gitlabr)


### Name: gl_list_issues
### Title: Get issues of a project or user
### Aliases: gl_list_issues gl_get_issue

### ** Examples

## Not run: 
##D my_project <- gl_project_connection(project = "testor"...) ## fill in login parameters
##D my_project(gl_list_issues)
##D my_project(gl_get_issue, 1)
##D my_project(gl_new_issue, 1, "Implement new feature", description = "It should be awesome.")
## End(Not run)



