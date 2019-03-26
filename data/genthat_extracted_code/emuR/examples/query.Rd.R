library(emuR)


### Name: query
### Title: Query emuDB
### Aliases: query
### Keywords: EQL Emu database emuDB query

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D ## Query database ae with EQL query "[Phonetic=t -> Phonetic=s]":
##D ## 'Find all sequences /ts/ in level Phonetics'.
##D ## and store result seglist in variable segListTs
##D 
##D seglistTs=query(ae, "[Phonetic == t -> Phonetic == s]")
##D 
##D ## Query database ae with EQL query "[Syllable == S ^ Phoneme == t]":
##D ## 'Find all items 't' in level Phoneme that are dominated by items 'S' in level Syllable.'
##D ## Return legacy Emu result type 'emusegs'
##D 
##D query(ae, "[Syllable == S ^ Phoneme == t]", resultType="emusegs")
##D 
##D ## Query 'p' items of level Phoneme from bundles whose bundle names start with 'msajc07' 
##D ## and whose session names start with '00'
##D ## (Note that here the query uses the operator '=' (meaning '==') which is kept for 
##D ##  backwards compatibilty to EQL1.)  
##D 
##D query(ae, "Phoneme = p", bundlePattern = "msajc05.*", sessionPattern = "00.*")
##D 
## End(Not run)




