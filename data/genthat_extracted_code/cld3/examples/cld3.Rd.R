library(cld3)


### Name: cld3
### Title: Compact Language Detector 3
### Aliases: cld3 detect_language detect_language_mixed
###   detect_language_multi

### ** Examples

# Vectorized best guess
text <- c("To be or not to be?", "Ce n'est pas grave.",
  "Hij heeft de klok horen luiden maar weet niet waar de klepel hangt.")
detect_language(text)

# Multiple languages in one text (doesn't seem to work well)
detect_language_mixed(text)



