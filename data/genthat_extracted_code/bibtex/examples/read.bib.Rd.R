library(bibtex)


### Name: read.bib
### Title: bibtex parser
### Aliases: read.bib

### ** Examples

## this package has a REFERENCES.bib file
bib <- read.bib( package = "bibtex" )

## bibtex collects bibtex entries for R base packages
base.bib <- read.bib( package = "base" )

## Don't show: 
bib <- read.bib( package = "base" )
bib <- read.bib( package = "datasets" )
bib <- read.bib( package = "graphics" )
bib <- read.bib( package = "grDevices" )
bib <- read.bib( package = "methods" )
bib <- read.bib( package = "stats" )
bib <- read.bib( package = "stats4" )
bib <- read.bib( package = "tools" )
bib <- read.bib( package = "utils" )
## End(Don't show)



