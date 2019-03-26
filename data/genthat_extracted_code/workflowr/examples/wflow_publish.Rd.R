library(workflowr)


### Name: wflow_publish
### Title: Publish the site
### Aliases: wflow_publish

### ** Examples

## Not run: 
##D # single file
##D wflow_publish("analysis/file.Rmd", "Informative commit message")
##D # All tracked files that have been edited
##D wflow_publish(all = TRUE, message = "Informative commit message")
##D # A new file plus all tracked files that have been edited
##D wflow_publish("analysis/file.Rmd", "Informative commit message", all = TRUE)
##D # Multiple files
##D wflow_publish(c("analysis/file.Rmd", "analysis/another.Rmd"),
##D               "Informative commit message")
##D # All R Markdown files that start with the pattern "new_"
##D wflow_publish("analysis/new_*Rmd", "Informative commit message")
##D # Republish all published files even though they haven't been modified.
##D # Useful for changing some universal aspect of the site, e.g. the theme
##D # specified in _site.yml.
##D wflow_publish("analysis/_site.yml", "Informative commit message",
##D               republish = TRUE)
##D # Publish all previously published files that have been committed more
##D # recently than their corresponding HTML files. This is useful if you like to
##D # manually commit your R Markdown files.
##D wflow_publish(update = TRUE)
## End(Not run)




