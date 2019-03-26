library(circlize)


### Name: circos.genomicInitialize
### Title: Initialize circular plot with any genomic data
### Aliases: circos.genomicInitialize

### ** Examples

## Not run: 
##D 
##D df = read.cytoband()$df
##D circos.genomicInitialize(df)
##D 
##D df = data.frame(name = c("TP53", "TP63", "TP73"),
##D                  start = c(7565097, 189349205, 3569084),
##D                  end = c(7590856, 189615068, 3652765),
##D                  stringsAsFactors = FALSE)
##D circos.genomicInitialize(df)
##D circos.clear()
##D 
##D circos.genomicInitialize(df, major.by = 10000)
##D circos.clear()
##D 
##D circos.genomicInitialize(df, plotType = "labels")
##D circos.clear()
##D 
##D circos.genomicInitialize(df, sector.names = c("tp53", "tp63", "tp73"))
##D circos.clear()
##D 
##D circos.genomicInitialize(df, sector.names = c("tp53x", "tp63x", "tp73"))
##D circos.clear()
##D 
##D df[[1]] = factor(df[[1]], levels = c("TP73", "TP63", "TP53"))
##D circos.genomicInitialize(df)
##D circos.clear()
##D 
## End(Not run)




