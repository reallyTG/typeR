library(R3port)


### Name: ltx_doc
### Title: Prints latex code for a table, listing, plot, or text to a a
###   file or console
### Aliases: ltx_doc

### ** Examples


## Not run: 
##D   txt <- "\\section{example}"
##D   tbl <- "\\begin{tabular}{|l|c|r|} 1 & 2 & 3 \\\\ 4 & 5 & 6 \\\\ \\end{tabular}"
##D   add <- "\\\\ Including some additional text"
##D   ltx_doc(c(txt,tbl,add),out=paste0(tempfile(),".tex"),show=FALSE)
##D 
##D   # You can use xtable (and any other packages that output tex)
##D   library(xtable)
##D   data(Theoph)
##D   xtbl <- print(xtable(Theoph),tabular.environment="longtable",floating=FALSE,print.results=FALSE)
##D   ltx_doc(xtbl,out=tempfile(fileext = ".tex"))
##D 
## End(Not run)



