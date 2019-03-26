library(bio3d)


### Name: plot.fluct
### Title: Plot Fluctuations
### Aliases: plot.fluct
### Keywords: hplot

### ** Examples

## Not run: 
##D ## load transducin example data
##D attach(transducin)
##D 
##D ## subset of pdbs to analyze
##D inds = c(1:5, 16:20)
##D pdbs <- trim(pdbs, row.inds=inds)
##D gaps.res = gap.inspect(pdbs$ali)
##D 
##D ## reference RESNO and SSE for axis annotations
##D resno <- pdbs$resno[1, gaps.res$f.inds]
##D sse <- pdbs$sse[1, gaps.res$f.inds]
##D 
##D ## eNMA calculation and obtain modes of motion including atomic fluctuations
##D modes <- nma(pdbs, ncore=NULL)
##D x = modes$fluctuation
##D 
##D ## simple line plot with SSE annotation
##D plot.fluct(x, sse=sse, resno=resno)
##D 
##D ## group data by specifying colors of each fluctuation line; same color indicates
##D ## same group. Also do significance calculation and annotation
##D col = c(rep('red', 5), rep('blue', 5))
##D plot.fluct(x, col=col, signif=TRUE, sse=sse, resno=resno)
##D 
##D ## spread lines
##D plot.fluct(x, col=col, signif=TRUE, sse=sse, resno=resno, typ='l', spread=TRUE)
##D 
##D ## show only line of mean values for each group. 
##D ## Nicer plot with area shaded for the first group.
##D plot.fluct(x, col=col, signif=TRUE, sse=sse, resno=resno, mean=TRUE, 
##D            polygon=TRUE, label=c('GTP', 'GDI'))
##D 
##D detach(transducin)
## End(Not run)



