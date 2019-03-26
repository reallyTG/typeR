library(rcrossref)


### Name: cr_cn
### Title: Get citations in various formats from CrossRef.
### Aliases: cr_cn

### ** Examples

## Not run: 
##D cr_cn(dois="10.1126/science.169.3946.635")
##D cr_cn(dois="10.1126/science.169.3946.635", "citeproc-json")
##D cr_cn(dois="10.1126/science.169.3946.635", "citeproc-json-ish")
##D cr_cn("10.1126/science.169.3946.635", "rdf-xml")
##D cr_cn("10.1126/science.169.3946.635", "crossref-xml")
##D cr_cn("10.1126/science.169.3946.635", "text")
##D 
##D # return an R bibentry type
##D cr_cn("10.1126/science.169.3946.635", "bibentry")
##D cr_cn("10.6084/m9.figshare.97218", "bibentry")
##D 
##D # return an apa style citation
##D cr_cn("10.1126/science.169.3946.635", "text", "apa")
##D cr_cn("10.1126/science.169.3946.635", "text", "harvard3")
##D cr_cn("10.1126/science.169.3946.635", "text", "elsevier-harvard")
##D cr_cn("10.1126/science.169.3946.635", "text", "ecoscience")
##D cr_cn("10.1126/science.169.3946.635", "text", "heredity")
##D cr_cn("10.1126/science.169.3946.635", "text", "oikos")
##D 
##D # example with many DOIs
##D dois <- cr_r(2)
##D cr_cn(dois, "text", "apa")
##D 
##D # Cycle through random styles - print style on each try
##D stys <- get_styles()
##D foo <- function(x){
##D  cat(sprintf("<Style>:%s\n", x), sep = "\n\n")
##D  cat(cr_cn("10.1126/science.169.3946.635", "text", style=x))
##D }
##D foo(sample(stys, 1))
##D 
##D # Using DataCite DOIs
##D ## some formats don't work
##D # cr_cn("10.5284/1011335", "crossref-xml")
##D # cr_cn("10.5284/1011335", "crossref-tdm")
##D ## But most do work
##D cr_cn("10.5284/1011335", "text")
##D cr_cn("10.5284/1011335", "datacite-xml")
##D cr_cn("10.5284/1011335", "rdf-xml")
##D cr_cn("10.5284/1011335", "turtle")
##D cr_cn("10.5284/1011335", "citeproc-json-ish")
##D cr_cn("10.5284/1011335", "ris")
##D cr_cn("10.5284/1011335", "bibtex")
##D cr_cn("10.5284/1011335", "bibentry")
##D 
##D # Using Medra DOIs
##D cr_cn("10.3233/ISU-150780", "onix-xml")
##D 
##D # Get raw output
##D cr_cn(dois = "10.1002/app.27716", format = "citeproc-json", raw = TRUE)
##D 
##D # sometimes messy DOIs even work
##D ## in this case, a DOI minting agency can't be found
##D ## but we proceed anyway, just assuming it's "crossref"
##D cr_cn("10.1890/0012-9615(1999)069[0569:EDILSA]2.0.CO;2")
##D 
##D # Use a different base url
##D cr_cn("10.1126/science.169.3946.635", "text", url = "https://data.datacite.org")
##D cr_cn("10.1126/science.169.3946.635", "text", url = "http://dx.doi.org")
##D cr_cn("10.1126/science.169.3946.635", "text", "heredity", url = "http://dx.doi.org")
##D cr_cn("10.5284/1011335", url = "https://citation.crosscite.org/format", 
##D    style = "oikos")
##D cr_cn("10.5284/1011335", url = "https://citation.crosscite.org/format", 
##D    style = "plant-cell-and-environment")
##D cr_cn("10.5284/1011335", url = "https://data.datacite.org", 
##D    style = "plant-cell-and-environment")
## End(Not run)



