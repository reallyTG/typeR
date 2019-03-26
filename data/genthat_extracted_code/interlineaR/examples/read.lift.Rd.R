library(interlineaR)


### Name: read.lift
### Title: Parse a dictionary in XML LIFT (Lexicon Interchange FormaT)
###   vocabulary and turn it into a set of data.frame
### Aliases: read.lift

### ** Examples

path <- system.file("exampleData", "tuwariDictionary.lift", package="interlineaR")
dictionary <- read.lift(path, vernacular.languages="tww")

# Reduce the size of the data frames by filtering to columns actually containing something...
dictionary <- read.lift(path, vernacular.languages="tww", simplify=TRUE)

# Get information in the different analysis languages used in the document (english and tok pisin)
dictionary <- read.lift(path, vernacular.languages="tww", analysis.languages=c("en", "tpi"))

# Restrict to entries and senses dataframe, and explicitly ask for some fields:
dictionary <- read.lift(
  path,
  vernacular.languages="tww",
  get.example=FALSE,
  get.relation=FALSE,
  entry.fields=c("lexical-unit", "morph-type"),
  sense.fields=c("grammatical-info.value", "gloss", "definition",
  "semantic-domain-ddp4", "grammatical-info.traits")
)




