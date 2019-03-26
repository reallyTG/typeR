library(RAM)


### Name: group.Taxa.bar
### Title: Barplot Of Taxa Distribution In Groups
### Aliases: group.Taxa.bar
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
taxa <- c("Fusarium", "Alternaria", "Cladosporium")
group.Taxa.bar(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
               rank="g", taxa=taxa, meta=meta, 
               meta.factor="City", cex.y=5, cex.x=5, 
               bar.width=1, RAM.theme=RAM.color())
## Not run: 
##D # change default color schemes
##D col <- c("dodgerblue1", "darkcyan")
##D taxa.1 <- c("Fusarium", "Alternaria", "Cladosporium", 
##D             "Verticillium", "Kondoa")
##D group.Taxa.bar(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
##D                rank="g", taxa=taxa.1, meta=meta, 
##D                meta.factor="City", cex.y=5, cex.x=5, 
##D                bar.width=1, RAM.theme=NULL, col.pal=col)
##D group.Taxa.bar(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
##D                rank="g", taxa=taxa.1, meta=meta, 
##D                meta.factor="City", cex.y=5, cex.x=5, 
##D                bar.width=1, RAM.theme=NULL,
##D                col.pal=col, func="mean")
##D # change ggplot theme
##D group.Taxa.bar(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
##D                rank="g", taxa=taxa.1, meta=meta, 
##D                meta.factor="City", cex.y=5, cex.x=5, 
##D                bar.width=1, col.pal=col, RAM.theme=RAM.border())
##D # save the plot
##D group.Taxa.bar(data=list(ITS1=ITS1, ITS2=ITS2), is.OTU=TRUE,
##D                rank="g", taxa=taxa.1, meta=meta, 
##D                meta.factor="City", cex.y=5, cex.x=5, 
##D                bar.width=1, RAM.theme=NULL,
##D                col.pal=col,main="", file="path/to/filename.pdf",
##D                ext="pdf", height=8, width=16)
## End(Not run)



