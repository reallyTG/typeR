library(deeplr)


### Name: translate2
### Title: Translate texts using DeepL
### Aliases: translate2

### ** Examples

## No test: 
# Simple translation
translate2("Hallo Welt!", target_lang = "EN")

# Customized translator applied to multiple strings
txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
translator1 <- function(t) translate2(text = t, target_lang = "FR")
purrr::map_chr(txt1, translator1)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
translator2 <- function(t) translate2(text = t, target_lang = "ES", get_detect = T)
purrr::map_df(txt2, translator2)

## End(No test)




