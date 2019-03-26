library(deeplr)


### Name: toEnglish2
### Title: Translate texts into English using DeepL
### Aliases: toEnglish2

### ** Examples

## No test: 
# Simple translation
toEnglish2("Hallo Welt!")

# Customized translator applied to multiple strings
txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
purrr::map_chr(txt1, toEnglish2)

# Customized translator applied to multiple strings (with language detection response)
txt2 <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
translator2 <- function(t) toEnglish2(text = t, get_detect = T)
purrr::map_df(txt2, translator2)

## End(No test)





