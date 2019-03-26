library(rDNAse)


### Name: twoGOSim
### Title: DNA Similarity Calculation based on Gene Ontology (GO)
###   Similarity
### Aliases: twoGOSim
### Keywords: GO Ontology similarity

### ** Examples

## Not run: 
##D # Be careful when testing this since it involves GO similarity computation
##D # and might produce unpredictable results in some environments
##D 
##D require(GOSemSim)
##D require(org.Hs.eg.db)
##D 
##D # by GO terms
##D go1 = c("GO:0004022", "GO:0004024", "GO:0004023")
##D go2 = c("GO:0009055", "GO:0020037")
##D gsim1 = twoGOSim(go1, go2, type = 'go', ont = 'MF', measure = 'Wang')
##D print(gsim1)
##D 
##D # by Entrez gene id
##D gene1 = '241'
##D gene2 = '251'
##D gsim2 = twoGOSim(gene1, gene2, type = 'gene', ont = 'BP', measure = 'Lin')
##D print(gsim2)
## End(Not run)



