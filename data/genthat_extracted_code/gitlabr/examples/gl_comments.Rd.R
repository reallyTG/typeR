library(gitlabr)


### Name: gl_get_comments
### Title: Get the comments/notes of a commit or issue
### Aliases: gl_get_comments gl_get_issue_comments gl_get_commit_comments
###   gl_comment_commit gl_comment_issue gl_edit_comment
###   gl_edit_issue_comment gl_edit_commit_comment

### ** Examples

## Not run: 
##D my_project <- gl_project_connection(project = "testor"...) ## fill in login parameters
##D my_project(gl_get_comments, "issue", 1)
##D my_project(gl_get_comments, "commit", "8ce5ef240123cd78c1537991e5de8d8323666b15")
##D my_project(gl_comment_issue, 1, text = "Almost done!")
## End(Not run)



