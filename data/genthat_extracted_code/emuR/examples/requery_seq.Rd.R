library(emuR)


### Name: requery_seq
### Title: Requery sequential context of segment list in an emuDB
### Aliases: requery_seq
### Keywords: database emuDB requery

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D ## Requery previous item of 'p' on level 'Phonetic'
##D sl1 = query(ae, "Phonetic == p")
##D 
##D requery_seq(ae, sl1, offset = -1)
##D 
##D ## Requery context (adding previuos and following elements) of 'p' on phonetic level
##D 
##D requery_seq(ae, sl1, offset = -1, length = 3)
##D 
##D ## Requery previous item of n->t sequence
##D sl2 = query(ae, "[Phoneme == n -> Phoneme == t]")
##D 
##D requery_seq(ae, sl2, offset = -1)
##D 
##D ## Requery last item within n->t sequence
##D 
##D requery_seq(ae, sl2, offsetRef = 'END')
##D 
##D ## Requery following item after n->t sequence
##D 
##D requery_seq(ae, sl2, offset = 1, offsetRef = 'END')
##D 
##D ## Requery context (previous and following items) of n->t sequence
##D 
##D requery_seq(ae, sl2, offset = -1, length = 4)
##D 
##D ## Requery next word contexts (sequence includes target word)
##D 
##D sl3 = query(ae, "Text == to")
##D requery_seq(ae, sl3, length = 2)
##D 
##D ## Requery following two word contexts, ignoring segment 
##D ## sequences that are out of bundle end bounds 
##D requery_seq(ae, sl3, length = 3, ignoreOutOfBounds = TRUE)
##D 
## End(Not run)



