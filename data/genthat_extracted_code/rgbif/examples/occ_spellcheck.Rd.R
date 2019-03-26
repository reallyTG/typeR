library(rgbif)


### Name: occ_spellcheck
### Title: Spell check search term for occurrence searches
### Aliases: occ_spellcheck

### ** Examples

## Not run: 
##D # incorrectly spelled, with suggested alternative
##D occ_spellcheck(search = "kajsdkla")
##D 
##D # incorrectly spelled, without > 1 suggested alternative
##D occ_spellcheck(search = "helir")
##D 
##D # incorrectly spelled, without no alternatives
##D occ_spellcheck(search = "asdfadfasdf")
##D 
##D # correctly spelled,  alternatives
##D occ_spellcheck(search = "helianthus")
## End(Not run)



