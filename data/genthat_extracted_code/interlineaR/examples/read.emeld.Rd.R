library(interlineaR)


### Name: read.emeld
### Title: Read an EMELD XML document containing an interlinearized corpus.
### Aliases: read.emeld

### ** Examples

path <- system.file("exampleData", "tuwariInterlinear.xml", package="interlineaR")
corpus <- read.emeld(path, vernacular="tww", analysis="en")
head(corpus$morphemes)

# In some cases, one may have to combine information coming from various data.frame.
# Lets imagine one needs to have in the same data.frame the morphemes data 
# plus the "note" field attached to sentences:
# - The easy way is to combine all the columns of the two data frame 'morphemes' and 'sentence' :
combined <- merge(corpus$morphemes, corpus$sentences, by.x="sentence_id", by.y="sentence_id")
head(combined)

# - Alternatively, one may use vector extraction in order to add only the desired column
# to the morphemes data frame:
corpus$morphemes$note = corpus$sentences$note.en[ corpus$morphemes$sentence_id ]
head(corpus$morphemes)



