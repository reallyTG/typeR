library(SASmarkdown)


### Name: saslog_hookset
### Title: A function to clean SAS log files
### Aliases: saslog_hookset sasloghook

### ** Examples

saslog_hookset("source")

## Not run: 
##D indoc <- '
##D ---
##D title: "Basic SASmarkdown Doc"
##D author: "Doug Hemken"
##D output: html_document
##D ---
##D # In a first code chunk, set up with
##D ```{r}
##D require(SASmarkdown)
##D saslog_hookset("source")
##D 
##D sasexe <- "C:/Program Files/SASHome/SASFoundation/9.4/sas.exe"
##D sasopts <- "-nosplash -ls 75"
##D ```
##D # Then set up SAS code chunks with
##D ```{r, engine="saslog", engine.path=sasexe, engine.opts=sasopts, SASecho=FALSE}
##D proc means data=sashelp.class;
##D run;
##D ```
##D '
##D knitr::knit(text=indoc, output="test.md")
##D rmarkdown::render("test.md")
## End(Not run)



