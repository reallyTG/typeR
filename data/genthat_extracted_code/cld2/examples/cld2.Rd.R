library(cld2)


### Name: cld2
### Title: Compact Language Detector 2
### Aliases: cld2 detect_language detect_language_mixed
###   detect_language_multi

### ** Examples

# Vectorized function
text <- c("To be or not to be?", "Ce n'est pas grave.", "Nou breekt mijn klomp!")
detect_language(text)

## Not run: 
##D # Read HTML from connection
##D detect_language(url('http://www.un.org/ar/universal-declaration-human-rights/'), plain_text = FALSE)
##D 
##D # More detailed classification output
##D detect_language_mixed(
##D   url('http://www.un.org/fr/universal-declaration-human-rights/'), plain_text = FALSE)
##D 
##D detect_language_mixed(
##D   url('http://www.un.org/zh/universal-declaration-human-rights/'), plain_text = FALSE)
## End(Not run)



