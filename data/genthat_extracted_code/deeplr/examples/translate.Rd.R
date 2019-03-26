library(deeplr)


### Name: translate
### Title: Translate texts using the official DeepL Translator API
### Aliases: translate

### ** Examples

## No test: 
# Simple translation
translate("Hallo Welt!", target_lang = "EN", auth_key = "my_key")

# Customized translator applied to multiple strings
txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
translator1 <- function(t) translate(text = t, target_lang = "FR", auth_key = "x")
purrr::map_chr(txt1, translator1)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
translator2 <- function(t) translate(text = t, target_lang = "ES", get_detect = T, auth_key = "x")
purrr::map_df(txt2, translator2)

## End(No test)




