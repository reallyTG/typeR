library(gitlabr)


### Name: gl_ci_job
### Title: Define Gitlab CI jobs
### Aliases: gl_ci_job gl_default_ci_pipeline use_gitlab_ci

### ** Examples

gl_ci_job("build", allowed_dependencies = "test")
use_gitlab_ci(image = "pointsofinterest/gitlabr:latest")
use_gitlab_ci(image = "pointsofinterest/gitlabr:latest",
 push_to_remotes = list("github" =
 "https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}@github.com/jirkalewandowski/gitlabr.git"))



