library(deeplr)


### Name: toGerman2
### Title: Translate texts into German using DeepL
### Aliases: toGerman2

### ** Examples

## No test: 
# Simple translation
toGerman2("Hallo Welt!")

# Customized translator applied to multiple strings
txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
purrr::map_chr(txt1, toGerman2)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Wales")
translator2 <- function(t) toGerman2(text = t, get_detect = T)
purrr::map_df(txt2, translator2)

## End(No test)





