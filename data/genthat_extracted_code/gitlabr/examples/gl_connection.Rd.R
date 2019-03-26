library(gitlabr)


### Name: gl_connection
### Title: Connect to a specific gitlab instance API
### Aliases: gl_connection gl_project_connection

### ** Examples

## Not run: 
##D my_gitlab <- gl_connection("http://gitlab.example.com", "123####89")
##D my_gitlab("projects")
##D my_gitlab(gl_get_file, "test-project", "README.md", ref = "dev")
## End(Not run)




