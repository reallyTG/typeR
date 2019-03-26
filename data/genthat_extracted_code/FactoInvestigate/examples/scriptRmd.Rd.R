library(FactoInvestigate)


### Name: scriptRmd
### Title: File script
### Aliases: scriptRmd
### Keywords: script

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(decathlon)
##D res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
##D create.rmd(res.pca, file = "PCA.Rmd", document = "pdf_document")
##D scriptRmd(file = "PCA.Rmd")
##D 
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D create.rmd(res.ca, file = "CA.Rmd", document = "html_document")
##D scriptRmd(file = "CA.Rmd")
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D create.rmd(res.mca, file = "MCA.Rmd", document = c("word_document", "pdf_document"))
##D scriptRmd(file = "MCA.Rmd")
## End(Not run)



