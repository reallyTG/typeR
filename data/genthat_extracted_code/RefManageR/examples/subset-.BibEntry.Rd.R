library(RefManageR)


### Name: [<-.BibEntry
### Title: Update Different Fields of Multiple Entries of a BibEntry Object
### Aliases: [<-.BibEntry
### Keywords: manip methods

### ** Examples

file.name <- system.file("Bib", "RJC.bib", package="RefManageR")
bib <- ReadBib(file.name)
print(bib[seq_len(3L)], .opts = list(sorting = "none", bib.style = "alphabetic"))
## add month to Serban et al., add URL and urldate to Jennings et al., and
##   add DOI and correct journal to Garcia et al.
bib[seq_len(3L)] <- list(c(date="2013-12"), 
                        c(url="https://bsb.eurasipjournals.com/content/2013/1/13", 
                          urldate = "2014-02-02"), 
                        c(doi="10.1093/bioinformatics/btt608", 
                          journal = "Bioinformatics")) 
print(bib[seq_len(3L)], .opts = list(sorting = "none", bib.style = "alphabetic"))
bib2 <- bib[seq_len(3L)]
bib2[2:3] <- bib[5:6]
bib2
bib2[3] <- c(journal='', eprinttype = "arxiv", eprint = "1308.5427", 
  eprintclass = "math.ST", pubstate = "submitted", bibtype = "misc")
bib2                            



