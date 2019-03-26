## ----compile-settings, include=FALSE-------------------------------------
library("methods")
library("knitr")
opts_chunk$set(tidy = FALSE, warning = FALSE, message = FALSE, 
               cache = FALSE, comment = NA, verbose = TRUE)
basename <- gsub(".Rmd", "", knitr:::knit_concord$get('infile'))

## ------------------------------------------------------------------------
library('RNeXML')
data(bird.orders)

## ------------------------------------------------------------------------
birds <- add_trees(bird.orders)
birds <- add_basic_meta(
  title = "Phylogeny of the Orders of Birds From Sibley and Ahlquist",

  description = "This data set describes the phylogenetic relationships of the
     orders of birds as reported by Sibley and Ahlquist (1990). Sibley
     and Ahlquist inferred this phylogeny from an extensive number of
     DNA/DNA hybridization experiments. The ``tapestry'' reported by
     these two authors (more than 1000 species out of the ca. 9000
     extant bird species) generated a lot of debates.

     The present tree is based on the relationships among orders. The
     branch lengths were calculated from the values of Delta T50H as
     found in Sibley and Ahlquist (1990, fig. 353).",

  citation = "Sibley, C. G. and Ahlquist, J. E. (1990) Phylogeny and
     classification of birds: a study in molecular evolution. New
     Haven: Yale University Press.",

  creator = "Sibley, C. G. and Ahlquist, J. E.",
	nexml=birds)

## ------------------------------------------------------------------------
birds <- add_basic_meta(citation = citation("ape"), nexml = birds)

## ----message=FALSE, results='hide', eval=FALSE---------------------------
#  birds <- taxize_nexml(birds, "NCBI")

## ------------------------------------------------------------------------
prefixes <- get_namespaces(birds)
prefixes["dc"]

## ------------------------------------------------------------------------
modified <- meta(property = "prism:modificationDate", content = "2013-10-04")

## ------------------------------------------------------------------------
birds <- add_meta(modified, birds) 

## ------------------------------------------------------------------------
history <- meta(property = "skos:historyNote",
  content = "Mapped from the bird.orders data in the ape package using RNeXML")

## ------------------------------------------------------------------------
birds <- add_meta(history, 
                birds, 
                level = "trees",
                namespaces = c(skos = "http://www.w3.org/2004/02/skos/core#"))

## ------------------------------------------------------------------------
birds

## ------------------------------------------------------------------------
meta <- get_metadata(birds) 

## ------------------------------------------------------------------------
meta

## ----get_taxa------------------------------------------------------------
get_taxa(birds)

## ------------------------------------------------------------------------
otu_meta <- get_metadata(birds, level="otus/otu")
otu_meta

## ------------------------------------------------------------------------
library("RNeXML")
library("dplyr")
library("geiger")

## ------------------------------------------------------------------------
data("primates")
add_trees(primates$phy) %>% 
  add_characters(primates$dat, ., append=TRUE) %>% 
  taxize_nexml() -> nex 

## ------------------------------------------------------------------------
otu_meta <- get_metadata(nex, "otus/otu")
taxa <- get_taxa(nex)
char <- get_characters(nex, rownames_as_col = TRUE)

## ------------------------------------------------------------------------
otu_meta
taxa
head(char)

## ------------------------------------------------------------------------
taxa %>% 
  left_join(char, by = c("label" = "taxa")) %>% 
  left_join(otu_meta, by = "otu") %>%
  select(otu, label, x, href)

