library(compareGroups)


### Name: export2md
### Title: Exporting descriptives table to Markdown format
### Aliases: export2md
### Keywords: utilities

### ** Examples


## Not run: 
##D 
##D ---
##D title: "Report"
##D output:
##D   html_document: default
##D ---
##D 
##D ```{r setup, include=FALSE}
##D knitr::opts_chunk$set(echo = FALSE, warning=FALSE, message=FALSE)
##D ```
##D 
##D ```{r}
##D library(compareGroups)
##D data(predimed)
##D res <- compareGroups(group~., predimed)
##D restab <- createTable(res)
##D ```
##D 
##D ## Report section
##D 
##D The following table contains descriptives of **PREDIMED** data
##D 
##D ```{r}
##D export2md(restab, strip = TRUE, first.strip = TRUE)
##D ```
## End(Not run)




