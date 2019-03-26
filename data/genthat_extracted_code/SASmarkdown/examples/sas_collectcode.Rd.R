library(SASmarkdown)


### Name: sas_collectcode
### Title: Create a knitr chunk hook for accumlating code.
### Aliases: sas_collectcode

### ** Examples

sas_collectcode()

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
##D 
##D sasexe <- "C:/Program Files/SASHome/SASFoundation/9.4/sas.exe"
##D sasopts <- "-nosplash -ls 75"
##D ```
##D # Then mark SAS code chunks with collectcode=TRUE
##D ```{r, engine="sas", engine.path=sasexe, engine.opts=sasopts, collectcode=TRUE}
##D data class;
##D     set sashelp.class;
##D     keep age;
##D     run;
##D ```
##D 
##D # A later chunk that depends on the first.
##D ```{r, engine="sas", engine.path=sasexe, engine.opts=sasopts}
##D proc means data=class; /* not SASHELP.class */
##D run;
##D ```
##D '
##D knitr::knit(text=indoc, output="test.md")
##D rmarkdown::render("test.md")
## End(Not run)



