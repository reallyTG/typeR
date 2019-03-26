library(vegdata)


### Name: syntab
### Title: Syntaxonomic frequency tables
### Aliases: syntab print.syntab freqtab
### Keywords: misc

### ** Examples

## Not run: 
##D elbaue <- tv.veg('elbaue')
##D elbaue.env <- tv.site('elbaue')
##D clust <- vector('integer', nrow(elbaue.env))
##D clust[elbaue.env$MGL < -50 & elbaue.env$SDGL < 50] <- 1
##D clust[elbaue.env$MGL < -50 & elbaue.env$SDGL >= 50] <- 2
##D clust[elbaue.env$MGL >= -50 & elbaue.env$SDGL >= 50] <- 3
##D clust[elbaue.env$MGL >= -50 & elbaue.env$SDGL < 50] <- 4
##D levels(clust) <- c('dry.ld','dry.hd', 'wet.hd','wet.ld')
##D traits <- tv.traits()
##D m <- match(rownames(st$syntab), traits$LETTERCODE, nomatch = 0)
##D trait <- traits[m, c("OEK_F","OEK_N")]
##D rownames(trait) <- traits$LETTERCODE[m]
##D st <- syntab(elbaue, clust, mupa=TRUE)
##D print(st, limit=30, trait=trait)
##D # Manipulation of the syntaxonomic table
##D sttable <- st$syntab
##D sttable <- sttable[sttable$p.value < 0.05 & !is.na(sttable$p.value), !names(sttable) ##D 
##D taxa <- tax(rownames(sttable))
##D rownames(sttable) <- taxa[match(rownames(sttable), taxa$LETTERCODE, nomatch = 0),'TaxonName']
##D write.csv(sttable, 'sttable.csv')
## End(Not run)



