library(textclean)


### Name: has_endmark
### Title: Test for Incomplete Sentences
### Aliases: has_endmark
### Keywords: incomplete

### ** Examples

x <- c(
    "I like it.", 
    "Et tu?",  
    "Not so much", 
    "Oh, I understand.",  
    "At 3 p.m., we go",
    NA
)
has_endmark(x)



