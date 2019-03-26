library(SASmarkdown)


### Name: sas_output
### Title: A function to provide cleaner output for knitr's SAS engines.
### Aliases: sas_output

### ** Examples


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
##D sas_enginesetup(sashtml=sashtml)
##D 
##D sasexe <- "C:/Program Files/SASHome/SASFoundation/9.4/sas.exe"
##D sasopts <- "-nosplash -ls 75"
##D ```
##D # Then set up SAS code chunks with
##D ```{r, engine="sashtml", engine.path=sasexe, engine.opts=sasopts}
##D proc means data=sashelp.class;
##D run;
##D ```
##D '
##D knitr::knit(text=indoc, output="test.md")
##D rmarkdown::render("test.md")
## End(Not run)



