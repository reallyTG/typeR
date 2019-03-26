library(leafletR)


### Name: styleCat
### Title: Categorized styling
### Aliases: styleCat cats
### Keywords: methods

### ** Examples

## Not run: 
##D # prepare data
##D dat <- system.file(package="leafletR", "files", "park_sk.geojson")
##D 
##D # simple categorizing
##D sty <- styleCat(prop="lynx", val=c("yes", "no"), 
##D   style.val=c("green", "red"), leg="Lynx occurrence")
##D map <- leaflet(data=dat, dest=tempdir(), title="Lynx", 
##D   style=sty)
##D 
##D # just one category
##D sty <- styleCat(prop="wisent", val="yes", style.val="red", 
##D   leg="Wisent occurrence")
##D map <- leaflet(data=dat, dest=tempdir(), title="Wisent", 
##D   style=sty)
##D 
##D # get nice colors using ColorBrewer
##D require(RColorBrewer)
##D pal <- brewer.pal(7, "Dark2")
##D sty <- styleCat(prop="year", val=c("1949", "1967", "1978", "1988", 
##D   "1997", "1998", "2002"), style.val=pal, leg="established:\n")
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   title="National parks", style=sty)
##D 
##D # add 'other'-category to legend
##D require(RColorBrewer)
##D pal <- brewer.pal(7, "Dark2")
##D sty <- styleCat(prop="year", val=c("1997", "1998", "2002"), 
##D   style.val=pal, leg="established:\n")
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   title="National parks", style=sty)
##D 
##D # additional styling parameters
##D sty <- styleCat(prop="brown_bear", val=c("yes", "no"), 
##D   style.val=c("darkgreen", "red"), leg="Brown bear\noccurrence", 
##D   alpha=1, lwd=4, fill=NA)
##D map <- leaflet(data=dat, dest=tempdir(), title="Brown bear", 
##D   style=sty)
## End(Not run)



