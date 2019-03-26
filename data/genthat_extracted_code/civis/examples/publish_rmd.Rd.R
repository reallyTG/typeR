library(civis)


### Name: publish_rmd
### Title: Publish an R Markdown file to Platform Reports
### Aliases: publish_rmd

### ** Examples

## Not run: 
##D 
##D # Publish a standard report
##D publish_rmd("my_beautiful_doc.Rmd")
##D 
##D # Publish a parameterized R Markdown document
##D # See: http://rmarkdown.rstudio.com/developer_parameterized_reports.html
##D params <- list("region" = "east", start = as.Date("2015-02-01"))
##D publish_rmd("my_parameterized_doc.Rmd", params=params)
## End(Not run)



