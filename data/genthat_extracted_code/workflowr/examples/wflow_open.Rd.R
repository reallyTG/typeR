library(workflowr)


### Name: wflow_open
### Title: Open R Markdown analysis file(s)
### Aliases: wflow_open

### ** Examples

## Not run: 
##D wflow_open("analysis/model-data.Rmd")
##D # Multiple files
##D wflow_open(c("analysis/model-data.Rmd", "analysis/another-analysis.Rmd"))
##D # Open all R Markdown files
##D wflow_open("analysis/*Rmd")
##D # Create an R Markdown file in a non-worklowr project
##D wflow_open("model-data.Rmd", project = NULL)
## End(Not run)



