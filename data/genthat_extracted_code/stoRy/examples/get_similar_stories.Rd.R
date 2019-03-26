library(stoRy)


### Name: get_similar_stories
### Title: Recommend stories similar to a user-selected one.
### Aliases: get_similar_stories

### ** Examples

#######################################################################
# Recommend Star Trek stories similar to the Star Trek: Voyager       #
# episode False Profits (voy3x05)                                     #
#######################################################################
story_id <- "voy3x05"
mystory <- story$new(story_id)
result <- get_similar_stories(mystory)

#######################################################################
# Output top ten most similar stories                                 #
#######################################################################
result[1:10,]



