library(arsenal)


### Name: write2specific
### Title: write2word, write2html, write2pdf
### Aliases: write2specific write2word write2pdf write2html

### ** Examples

## Not run: 
##D data(mockstudy)
##D # tableby example
##D tab1 <- tableby(arm ~ sex + age, data=mockstudy)
##D write2html(tab1, "~/trash.html")
##D 
##D # freqlist example
##D tab.ex <- table(mockstudy[, c("arm", "sex", "mdquality.s")], useNA = "ifany")
##D noby <- freqlist(tab.ex, na.options = "include")
##D write2pdf(noby, "~/trash2.pdf")
##D 
##D # A more complicated example
##D write2word(tab1, "~/trash.doc",
##D   keep.md = TRUE,
##D   reference_docx = mystyles.docx, # passed to rmarkdown::word_document
##D   quiet = TRUE, # passed to rmarkdown::render
##D   title = "My cool new title") # passed to summary.tableby
## End(Not run)



