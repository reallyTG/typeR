library(Rdpack)


### Name: get_bibentries
### Title: Get all references from a Bibtex file
### Aliases: get_bibentries
### Keywords: bibtex programming

### ** Examples

r <- get_bibentries(package = "Rdpack")
r
print(r, style = "html")

b <- get_bibentries(package = "stats")
print(b[[1]], style = "R")
print(b[[1]], style = "citation")

## here the url field contains percent encoding
fn_url <- system.file("examples", "url_with_percents.bib", package = "Rdpack") 
u <- get_bibentries(bibfile = fn_url)

## the links produced by all of the following are valid
## and can be put in a browser
print(u, style = "html")
print(u, style = "bibtex")
print(u, style = "R")
print(u, style = "text")
print(u, style = "citation")

## The link here contains escapes but when put in a LaTeX document
## which uses the JSS style it generates correct clickable link,
## (see Details section) 
print(u, style = "latex")

## here the journal field contains percent encoding
fn_other <- system.file("examples", "journal_with_percents.bib", package = "Rdpack") 
j <- get_bibentries(bibfile = fn_url)
print(j, style = "html")
print(j, style = "bibtex")
print(j, style = "R")
print(j, style = "text")
print(j, style = "citation")
      
print(j, style = "latex")



