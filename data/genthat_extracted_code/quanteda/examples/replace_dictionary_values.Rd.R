library(quanteda)


### Name: replace_dictionary_values
### Title: Internal function to replace dictionary values
### Aliases: replace_dictionary_values
### Keywords: internal

### ** Examples

dict <- list(KEY1 = list(SUBKEY1 = list("A_B"),
                          SUBKEY2 = list("C_D")),
              KEY2 = list(SUBKEY3 = list("E_F"),
                          SUBKEY4 = list("G_F_I")),
              KEY3 = list(SUBKEY5 = list(SUBKEY7 = list("J_K")),
                          SUBKEY6 = list(SUBKEY8 = list("L"))))
quanteda:::replace_dictionary_values(dict, '_', ' ')



