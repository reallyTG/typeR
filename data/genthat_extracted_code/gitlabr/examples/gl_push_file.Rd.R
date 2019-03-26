library(gitlabr)


### Name: gl_push_file
### Title: Upload a file to a gitlab repository
### Aliases: gl_push_file

### ** Examples

## Not run: 
##D my_project <- gl_project_connection(project = "example-project", ...) ## fill in login parameters
##D my_project(gl_push_file, "data/test_data.csv",
##D            content = readLines("test-data.csv"),
##D            commit_message = "New test data")
## End(Not run)



