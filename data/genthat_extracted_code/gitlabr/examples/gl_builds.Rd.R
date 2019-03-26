library(gitlabr)


### Name: gl_pipelines
### Title: Access the Gitlab CI builds
### Aliases: gl_pipelines gl_jobs gl_builds gl_latest_build_artifact

### ** Examples

## Not run: 
##D my_gitlab <- gl_connection(...) ## fill in login parameters
##D my_gitlab(gl_pipelines, "test-project")
##D my_gitlab(gl_jobs, "test-project")
##D my_gitlab(gl_latest_build_artifact, "test-project", job = "build")
## End(Not run)



