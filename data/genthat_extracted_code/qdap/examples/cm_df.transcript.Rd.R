library(qdap)


### Name: cm_df.transcript
### Title: Transcript With Word Number
### Aliases: cm_df.transcript
### Keywords: transcript

### ** Examples

## Not run: 
##D with(DATA, cm_df.transcript(state, person))
##D with(DATA, cm_df.transcript(state, list(sex, adult)))
##D #use it with nested variables just to keep track of demographic info
##D with(DATA, cm_df.transcript(state, list(person, sex, adult)))
##D 
##D #use double tilde "~~" to keep word group as one word
##D DATA$state <- mgsub("be certain", "be~~certain", DATA$state, fixed = TRUE)
##D with(DATA, cm_df.transcript(state, person))
##D DATA <- qdap::DATA
##D 
##D ##  with(mraja1spl, cm_df.transcript(dialogue, list(person)))
##D ##  with(mraja1spl, cm_df.transcript(dialogue, list(sex, fam.aff, died)))
##D ##  with(mraja1spl, cm_df.transcript(dialogue, list(person), file="foo.doc"))
##D ##  library(reports); delete("foo.doc")   #delete the file just created
## End(Not run)



