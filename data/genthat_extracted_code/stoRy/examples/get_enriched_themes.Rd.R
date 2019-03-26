library(stoRy)


### Name: get_enriched_themes
### Title: Find enriched themes in a storyset of interest relative to a
###   background storyset.
### Aliases: get_enriched_themes

### ** Examples

#######################################################################
# Load the Star Trek series storysets smt file and storysets object   #
#######################################################################
file <- system.file("storysets", "series.smt", package = "stoRy")
mystorysets <- storysets$new(file)
print(mystorysets)

#######################################################################
# Perform the theme enrichment analysis for each of TOS, TAS, and TNG #
# relative to default TOS/TAS/TNG background                          #
#######################################################################
results <- get_enriched_themes(mystorysets)

#######################################################################
# Output top twenty enriched TOS themes                               #
#######################################################################
results$TOS[1:20,]

#######################################################################
# Output top ten enriched TAS themes                                  #
#######################################################################
results$TAS[1:10,]

#######################################################################
# Output top twenty enriched TNG themes                               #
#######################################################################
results$TNG[1:20,]



