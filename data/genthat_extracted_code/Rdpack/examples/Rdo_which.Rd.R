library(Rdpack)


### Name: Rdo_which
### Title: Find elements of Rd objects for which a condition is true
### Aliases: Rdo_which Rdo_which_tag_eq Rdo_which_tag_in
### Keywords: Rd

### ** Examples

## get the help page for topoc seq()
rdo_seq <- tools::Rd_db("base")[["seq.Rd"]]
## find location of aliases in the topic
( ind <- Rdo_which_tag_eq(rdo_seq, "\alias") )
## extract the first alias
rdo_seq[[ ind[1] ]]
## Not run: 
##D ## extract all aliases
##D rdo_seq[ind]
## End(Not run)

db_bibtex <- tools::Rd_db("bibtex")
names(db_bibtex)
## Rdo object for read.bib()
rdo_read.bib <- db_bibtex[["read.bib.Rd"]]
Rdo_tags(rdo_read.bib)

## which elements of read.bib are aliases?
Rdo_which_tag_eq(rdo_read.bib, "\alias")
rdo_read.bib[[3]]

## which elements of read.bib contain R code?
Rdo_which(rdo_read.bib, function(x) any(Rdo_tags(x) == "RCODE") )
rdo_read.bib[[5]]
## which contain prose?
Rdo_which(rdo_read.bib, function(x) any(Rdo_tags(x) == "TEXT") )



