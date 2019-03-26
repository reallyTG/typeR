library(taxize)


### Name: class2tree
### Title: Convert a list of classifications to a tree.
### Aliases: class2tree plot.classtree print.classtree

### ** Examples

## Not run: 
##D spnames <- c('Quercus robur', 'Iris oratoria', 'Arachis paraguariensis',
##D  'Helianthus annuus','Madia elegans','Lupinus albicaulis',
##D  'Pinus lambertiana')
##D out <- classification(spnames, db='itis')
##D tr <- class2tree(out)
##D plot(tr)
##D 
##D spnames <- c('Klattia flava', 'Trollius sibiricus', 'Arachis paraguariensis',
##D  'Tanacetum boreale', 'Gentiana yakushimensis','Sesamum schinzianum',
##D  'Pilea verrucosa','Tibouchina striphnocalyx','Lycium dasystemum',
##D  'Berkheya echinacea','Androcymbium villosum',
##D  'Helianthus annuus','Madia elegans','Lupinus albicaulis',
##D  'Pinus lambertiana')
##D out <- classification(spnames, db='ncbi')
##D tr <- class2tree(out)
##D plot(tr)
## End(Not run)



