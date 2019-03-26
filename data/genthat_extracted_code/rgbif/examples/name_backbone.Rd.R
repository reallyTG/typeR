library(rgbif)


### Name: name_backbone
### Title: Lookup names in the GBIF backbone taxonomy.
### Aliases: name_backbone

### ** Examples

## Not run: 
##D name_backbone(name='Helianthus annuus', kingdom='plants')
##D name_backbone(name='Helianthus', rank='genus', kingdom='plants')
##D name_backbone(name='Poa', rank='genus', family='Poaceae')
##D 
##D # Verbose - gives back alternatives
##D name_backbone(name='Helianthus annuus', kingdom='plants', verbose=TRUE)
##D 
##D # Strictness
##D name_backbone(name='Poa', kingdom='plants', verbose=TRUE, strict=FALSE)
##D name_backbone(name='Helianthus annuus', kingdom='plants', verbose=TRUE,
##D   strict=TRUE)
##D 
##D # Non-existent name - returns list of lenght 3 stating no match
##D name_backbone(name='Aso')
##D name_backbone(name='Oenante')
##D 
##D # Pass on curl options
##D name_backbone(name='Oenante', curlopts = list(verbose=TRUE))
## End(Not run)



