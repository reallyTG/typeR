library(rDNAse)


### Name: parGOSim
### Title: DNA Sequence Similarity Calculation based on Gene Ontology (GO)
###   Similarity
### Aliases: parGOSim
### Keywords: GO Ontology similarity

### ** Examples

## Not run: 
##D # Be careful when testing this since it involves GO similarity computation
##D # and might produce unpredictable results in some environments
##D 
##D require(GOSemSim)
##D require(org.Hs.eg.db)
##D 
##D # by GO Terms
##D go1 = c('GO:0005215', 'GO:0005488', 'GO:0005515', 'GO:0005625', 'GO:0005802', 'GO:0005905')  # AP4B1
##D go2 = c('GO:0005515', 'GO:0005634', 'GO:0005681', 'GO:0008380', 'GO:0031202')  # BCAS2
##D go3 = c('GO:0003735', 'GO:0005622', 'GO:0005840', 'GO:0006412')  # PDE4DIP
##D glist = list(go1, go2, go3)
##D gsimmat1 = parGOSim(glist, type = 'go', ont = 'CC')
##D print(gsimmat1)
##D 
##D # by Entrez gene id
##D genelist = list(c('150', '151', '152', '1814', '1815', '1816'))
##D gsimmat2 = parGOSim(genelist, type = 'gene')
##D print(gsimmat2)
## End(Not run)



