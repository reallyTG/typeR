library(quanteda)


### Name: char_tolower
### Title: Convert the case of character objects
### Aliases: char_tolower char_toupper

### ** Examples

txt <- c(txt1 = "b A A", txt2 = "C C a b B")
char_tolower(txt) 
char_toupper(txt)

# with acronym preservation
txt2 <- c(text1 = "England and France are members of NATO and UNESCO", 
          text2 = "NASA sent a rocket into space.")
char_tolower(txt2)
char_tolower(txt2, keep_acronyms = TRUE)
char_toupper(txt2)



