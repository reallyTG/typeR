library(RefManageR)


### Name: Cite
### Title: Cite a BibEntry object in text and print all citations
### Aliases: Cite PrintBibliography PrintBibliography TextCite AutoCite
###   Citep Citet Citep AutoCite Citet TextCite NoCite
### Keywords: methods print

### ** Examples

file <- system.file("Bib", "biblatexExamples.bib", package = "RefManageR")
BibOptions(check.entries = FALSE)
bib <- ReadBib(file)
Citet(bib, 12)
NoCite(bib, title = "Alkanethiolate")
PrintBibliography(bib, .opts = list(style = "latex",
                  bib.style = "authoryear"))

Citep(bib, c("loh", "geer"), .opts = list(cite.style = "numeric"),
      before = "see e.g., ")
Citet(bib, "loh", .opts = list(cite.style = "numeric", super = TRUE))
AutoCite(bib, eprinttype = "arxiv", .opts = list(cite.style = "authoryear"))
AutoCite(bib, eprinttype = "arxiv", .opts = list(cite.style = "pandoc"))
Citep(bib, author = "kant")
## shorthand field in both entries gets used for numeric and alphabetic labels
TextCite(bib, author = "kant", .opts = list(cite.style = "alphabetic"))
TextCite(bib, author = "kant", .opts = list(cite.style = "numeric"))
TextCite(bib, author = "kant", .opts = list(cite.style = "alphabetic",
         style = "html"))
punct <- unlist(BibOptions("bibpunct"))
punct[3:4] <- c("(", ")")
TextCite(bib, 33, .opts = list(bibpunct = punct, cite.style = "alphabetic"))

BibOptions(restore.defaults = TRUE)
## Not run: 
##D library(knitr)
##D ## See also TestNumeric.Rmd and TestAlphabetic.Rmd for more examples
##D old.dir <- setwd(tdir <- tempdir())
##D doc <- system.file("Rmd", "TestRmd.Rmd", package = "RefManageR")
##D file.show(doc)
##D tmpfile <- tempfile(fileext = ".html", tmpdir = tdir)
##D knit2html(doc, tmpfile)
##D browseURL(tmpfile)
##D 
##D doc <- system.file("Rhtml", "TestAuthorYear.Rhtml", package = "RefManageR")
##D file.show(doc)
##D tmpfile <- tempfile(fileext = ".html", tmpdir = tdir)
##D knit2html(doc, tmpfile)
##D browseURL(tmpfile)
##D setwd(old.dir)
##D unlink(tdir)
## End(Not run)



