library(arsenal)


### Name: write2
### Title: write2
### Aliases: write2 write2.arsenal_table write2.summary.arsenal_table
###   write2.compare.data.frame write2.summary.compare.data.frame
###   write2.verbatim write2.yaml write2.code.chunk write2.knitr_kable
###   write2.xtable write2.character write2.list write2.default

### ** Examples

## Not run: 
##D data(mockstudy)
##D # tableby example
##D tab1 <- tableby(arm ~ sex + age, data=mockstudy)
##D write2(tab1, tempfile(fileext = ".rtf"),
##D   toc = TRUE, # passed to rmarkdown::rtf_document, though in this case it's not practical
##D   quiet = TRUE, # passed to rmarkdown::render
##D   title = "My cool new title", # passed to summary.tableby
##D   output_format = rmarkdown::rtf_document)
## End(Not run)

write2html(list(
  "# Header 1", # a header
  code.chunk(a <- 1, b <- 2, a + b), # a code chunk
  verbatim("hi there") # verbatim output
),
  tempfile(fileext = ".html"),
  quite = TRUE)



