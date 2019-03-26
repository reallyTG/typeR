library(deeplr)


### Name: toItalian
### Title: Translate texts into Italian using the official DeepL Translator
###   API
### Aliases: toItalian

### ** Examples

## No test: 
# Simple translation
toItalian("Hallo Welt!", auth_key = "my_key")

# Customized translator applied to multiple strings
txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
translator1 <- function(t) toItalian(text = t, auth_key = "x")
purrr::map_chr(txt1, translator1)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
translator2 <- function(t) toItalian(text = t, get_detect = T, auth_key = "x")
purrr::map_df(txt2, translator2)

## End(No test)




