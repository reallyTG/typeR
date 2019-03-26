library(emuR)


### Name: requery_hier
### Title: Requery hierarchical context of a segment list in an emuDB
### Aliases: requery_hier
### Keywords: database emuDB requery

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D ## Downward requery: find 'Phoneme' sequences of all words 'beautiful' (of level 'Text')
##D ## Note that the resulting segments consists of phoneme sequences and have therefore 
##D ## the same length as the word segments.
##D 
##D sl1 = query(ae, "Text == beautiful")
##D requery_hier(ae, sl1, level = "Phoneme")
##D 
##D ## Upward requery: find all word segments that dominate a 'p' on level 'Phoneme'
##D ## Note that the resulting segments are larger than the input segments,
##D ## because they contain the complete words.
##D 
##D sl1 = query(ae, "Phonetic == p")
##D requery_hier(ae, sl1, level = 'Text')
##D 
##D ## Why is there a 'p' the word 'emphazised'? Requery the whole words back down to 'Phoneme' level:
##D 
##D requery_hier(ae, sl1, level = 'Phoneme')
##D 
##D ## ... because of 'stop epenthesis' a 'p' is inserted between 'm' and 'f'
##D 
##D ## Combined requery: last phonemes of all words beginning with 'an'.
##D ## Note that we use a regular expression 'an.*' (EQL operator '=~') in the query.
##D 
##D sl1=query(ae, "Text =~ an.*")
##D requery_seq(ae, requery_hier(ae, sl1, level = 'Phoneme'), offsetRef = 'END')
##D 
## End(Not run)



