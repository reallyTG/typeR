library(deeplr)


### Name: toEnglish
### Title: Translate texts into English using the official DeepL Translator
###   API
### Aliases: toEnglish

### ** Examples

## No test: 
# Simple translation
toEnglish("Hallo Welt!", auth_key = "my_key")

# Customized translator applied to multiple strings
txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
translator1 <- function(t) toEnglish(text = t, auth_key = "x")
purrr::map_chr(txt1, translator1)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
translator2 <- function(t) toEnglish(text = t, get_detect = T, auth_key = "x")
purrr::map_df(txt2, translator2)

## End(No test)





