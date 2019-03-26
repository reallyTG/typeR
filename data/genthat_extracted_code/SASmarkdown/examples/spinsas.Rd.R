library(SASmarkdown)


### Name: spinsas
### Title: Convert a specially marked up SAS file to Markdown and HTML.
### Aliases: spinsas

### ** Examples


## Not run: 
##D indoc <- '
##D ** # Native SASmarkdown
##D First, call the `SASmarkdown`` package in R.;
##D 
##D *R require(SASmarkdown);
##D 
##D ** Then execute some SAS code.  First specify the
##D chunk header, then the code.;
##D *+ example, engine="sas",
##D     engine.path="C:/Program Files/SASHome/SASFoundation/9.4/sas.exe",
##D     engine.opts="-nosplash -ls 75";
##D proc means data=sashelp.class;
##D run;
##D '
##D x<-spinsas(text=indoc)
##D writeLines(x, "indoc.html")
## End(Not run)



