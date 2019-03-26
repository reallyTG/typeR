library(stoRy)


### Name: story
### Title: Story objects
### Aliases: story
### Keywords: datasets

### ** Examples

########################################################################
# Create a story object for the Star Trek The Original Series episode  #
# tos1x19 "The Arena" and manipulate it in various ways                #
########################################################################
story_id <- "tos1x19"
mystory <- story$new(story_id)
print(mystory)

########################################################################
# Add "neo-luddist utopia" as a central theme                          #
########################################################################
mystory$add_theme(theme = "neo-luddist utopia", level = "central")

########################################################################
# Remove "neo-luddist utopia" as a central theme                       #
########################################################################
mystory$remove_theme(theme = "neo-luddist utopia")

########################################################################
# Add "mountain" as a setting                                          #
########################################################################
mystory$add_setting(setting = "mountain")

########################################################################
# Add a new keyword                                                    #
######################################################################## 
mystory$add_keyword(keyword = "Captain Kirk is climbing a mountain")



