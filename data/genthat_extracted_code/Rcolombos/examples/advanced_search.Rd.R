library(Rcolombos)


### Name: advanced_search
### Title: This method mimics the advanced_search functionality of
###   Colombos. It takes a series of parameters, representing the different
###   settings available on Colombos advanced search and returns a list
###   containing the locustags (gene_names), contrasts and M-values for the
###   current selection.
### Aliases: advanced_search

### ** Examples

## Not run: 
##D  library("Rcolombos")
##D 
##D  # modules by gene entities
##D  g.gn <- advanced_search(organism="bsubt",
##D                      g_ids=c("cgeB","yfnG"),
##D                      by="genes", g_search_type="genes")
##D  g.go <- advanced_search(organism="bsubt",
##D                      g_ids="response to antibiotic, transcription",
##D                      by="genes", g_search_type="go")
##D  g.anno <- advanced_search(organism="bsubt",
##D                      g_ids="biotin-carboxyl carrier protein assembly",
##D                      by="genes", g_search_type="annotation", ann_type="Pathway")
##D 
##D  # modules by contrast entities
##D  c.cn <- advanced_search(organism="bsubt",
##D                      c_ids=c("GSM27217.ch2-vs-GSM27217.ch1","GSM27218.ch1-vs-GSM27218.ch2"),
##D                      by="contrasts", c_search_type="contrast_names")
##D  c.go <- advanced_search(organism="bsubt",
##D                      c_ids="response to antibiotic, transcription",
##D                      by="contrasts", c_search_type="go")
##D  c.exp <- advanced_search(organism="bsubt",
##D                      c_ids="GSE22296", by="contrasts", c_search_type="experiment")
##D  c.cond <- advanced_search(organism="bsubt",
##D  c_ids=c("DAPTOMYCIN","H2O2","HPUra","IPTG","MMC","MNCL2","MOENOMYCIN","RAMOPLANIN"),
##D  by="contrasts", c_search_type="condition")
##D 
##D  # modules by both gene and contrast entities
##D  b.go.cn <- advanced_search(organism="bsubt",
##D                      g_ids="response to antibiotic, transcription", geneNames=F,
##D                      c_ids=c("GSM27217.ch2-vs-GSM27217.ch1","GSM27218.ch1-vs-GSM27218.ch2"),
##D                      g_search_type="go", c_search_type="contrast_names", by="both")
##D  b.gn.ge <- advanced_search(organism="bsubt", g_ids=c("BSU00020","BSU00100"),
##D                      geneNames=F, c_ids="GSE22296", g_search_type="genes",
##D                      c_search_type="experiment", by="both")
##D  b.go.ge <- advanced_search(organism="bsubt", g_ids="response to antibiotic, transcription",
##D                      geneNames=F, c_ids="GSE22296", g_search_type="go",
##D                      c_search_type="experiment", by="both")
##D  b.gn.cn <- advanced_search(organism="bsubt",
##D                      g_ids=c("dnaA","dnaN","yaaA","recF","yaaB","gyrB"), geneNames=FALSE,
##D                      c_ids=c("GSM27217.ch2-vs-GSM27217.ch1","GSM27218.ch1-vs-GSM27218.ch2",
##D                      "GSM27219.ch2-vs-GSM27219.ch1","GSM27278.ch2-vs-GSM27278.ch1",
##D                      "GSM27279.ch1-vs-GSM27279.ch2"),
##D                      g_search_type="genes", c_search_type="contrast_names", by="both")
##D  heatmap(as.matrix(b.gn.cn), col=terrain.colors(15))
## End(Not run)



