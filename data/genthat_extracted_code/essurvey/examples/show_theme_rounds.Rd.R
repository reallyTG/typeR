library(essurvey)


### Name: show_theme_rounds
### Title: Return available rounds for a theme in the European Social
###   Survey
### Aliases: show_theme_rounds

### ** Examples


chosen_theme <- show_themes()[3]

# In which rounds was the topic of 'Democracy' asked?
show_theme_rounds(chosen_theme)

# And politics?
show_theme_rounds("Politics")




