library(nzilbb.labbcat)


### Name: labbcat.getMatchingGraphIdsPage
### Title: Gets a list of IDs of graphs that match a particular pattern.
### Aliases: labbcat.getMatchingGraphIdsPage
### Keywords: expression graph transcript

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get all transcripts whose names start with "BR"
transcripts <- labbcat.getMatchingGraphIdsPage(labbcat, "id MATCHES 'BR.+'")

## Get the first twenty transcripts in the "QB" corpus
transcripts <- labbcat.getMatchingGraphIdsPage(
        labbcat, "my('corpus').label = 'QB'", 20, 0)

## Get the second transcript that has "QB247_Jacqui" as a speaker
transcripts <- labbcat.getMatchingGraphIdsPage(
        labbcat, "'QB247_Jacqui' IN labels('who')", 1, 1)

## Get all transcripts whose names start with "BR" and have "QB247_Jacqui" as a speaker,
## in word-count order 
transcripts <- labbcat.getMatchingGraphIdsPage(
        labbcat, "my('corpus').label = 'QB' AND 'QB247_Jacqui' IN labels('who')", 1, 1,
        "my('transcript_word_count').label")




