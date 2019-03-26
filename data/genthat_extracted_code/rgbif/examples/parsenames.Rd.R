library(rgbif)


### Name: parsenames
### Title: Parse taxon names using the GBIF name parser.
### Aliases: parsenames

### ** Examples

## Not run: 
##D parsenames(scientificname='x Agropogon littoralis')
##D parsenames(c('Arrhenatherum elatius var. elatius',
##D              'Secale cereale subsp. cereale', 'Secale cereale ssp. cereale',
##D              'Vanessa atalanta (Linnaeus, 1758)'))
##D parsenames("Ajuga pyramidata")
##D parsenames("Ajuga pyramidata x reptans")
##D 
##D # Pass on curl options
##D # res <- parsenames(c('Arrhenatherum elatius var. elatius',
##D #          'Secale cereale subsp. cereale', 'Secale cereale ssp. cereale',
##D #          'Vanessa atalanta (Linnaeus, 1758)'), curlopts=list(verbose=TRUE))
## End(Not run)



