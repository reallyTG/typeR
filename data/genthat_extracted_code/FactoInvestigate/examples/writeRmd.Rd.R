library(FactoInvestigate)


### Name: writeRmd
### Title: Write Rmarkdown file
### Aliases: writeRmd
### Keywords: Rmarkdown

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(decathlon)
##D res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
##D create.rmd(res.pca, file = "PCA.Rmd", document = "pdf_document")
##D 
##D drawn = selection(res.pca)$drawn
##D 
##D writeRmd(start = TRUE, options = "r, echo = FALSE, fig.align = 'center', fig.height = 3.5, 
##D          fig.width = 5.5", file = "PCA.Rmd", end = "")
##D writeRmd("drawn", file = file, dump = TRUE)
##D writeRmd("plot.PCA(res, select = drawn, choix = 'ind', invisible = 'quali', title = '')", 
##D          stop = TRUE, file = "PCA.Rmd")
##D            
##D writeRmd("**", figure.title, " - ", "Individuals factor map (PCA)", "**", file = "PCA.Rmd", 
##D          sep = "")
## End(Not run)



