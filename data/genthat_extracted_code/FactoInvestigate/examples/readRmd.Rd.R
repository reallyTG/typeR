library(FactoInvestigate)


### Name: readRmd
### Title: Read Rmarkdown file
### Aliases: readRmd
### Keywords: Rmarkdown

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(decathlon)
##D res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
##D create.rmd(res.pca, file = "PCA.Rmd", document = "pdf_document")
##D readRmd(file = "PCA.Rmd", document = "pdf_document")
##D 
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D create.rmd(res.ca, file = "CA.Rmd", document = "html_document")
##D readRmd(file = "CA.Rmd", document = "html_document")
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D create.rmd(res.mca, file = "MCA.Rmd", document = c("word_document", "pdf_document"))
##D readRmd(file = "MCA.Rmd", document = "word_document")
## End(Not run)



