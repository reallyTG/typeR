library(essurvey)


### Name: show_rounds_country
### Title: Return countries that participated in *all* of the specified
###   rounds.
### Aliases: show_rounds_country

### ** Examples


# Return countries that participated in round 2

show_rounds_country(2)

# Return countries that participated in all rounds

show_rounds_country(1:8)

# Return countries that didn't participate in the first three rounds

show_rounds_country(1:3, participate = FALSE)




