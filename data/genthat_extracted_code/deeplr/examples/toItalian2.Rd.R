library(deeplr)


### Name: toItalian2
### Title: Translate texts into Italian using DeepL
### Aliases: toItalian2

### ** Examples

## No test: 
# Simple translation
toItalian2("Hallo Welt!")

# Customized translator applied to multiple strings
txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
purrr::map_chr(txt1, toItalian2)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
translator2 <- function(t) toItalian2(text = t, get_detect = T)
purrr::map_df(txt2, translator2)

## End(No test)




