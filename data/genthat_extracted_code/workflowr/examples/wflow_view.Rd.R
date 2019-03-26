library(workflowr)


### Name: wflow_view
### Title: View research website locally
### Aliases: wflow_view

### ** Examples

## Not run: 
##D 
##D # View index.html
##D wflow_view()
##D 
##D # View the most recently modified HTML file
##D wflow_view(latest = TRUE)
##D 
##D # View a file by specifying the R Markdown file
##D wflow_view("analysis/fname.Rmd")
##D 
##D # View a file by specifying the HTML file
##D wflow_view("docs/fname.html")
##D 
##D # View multiple files
##D wflow_view(c("fname1.Rmd", "fname2.Rmd"))
##D wflow_view("docs/*html")
## End(Not run)



