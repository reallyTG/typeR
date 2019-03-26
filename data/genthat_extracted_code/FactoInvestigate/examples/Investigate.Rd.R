library(FactoInvestigate)


### Name: Investigate
### Title: Resume factorial Analysis
### Aliases: Investigate
### Keywords: multivariate analysis report

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
## Not run: 
##D Investigate(res.pca, file = "PCA.Rmd", document = "html_document", time = "1000L", 
##D             parallel = FALSE)
##D 
##D data(children)
##D res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
##D Investigate(res.ca, file = "CA.Rmd", document = "pdf_document")
##D 
##D data(tea)
##D res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
##D Investigate(res.mca, file = "MCA.Rmd", document = c("word_document", "pdf_document"))
## End(Not run)



