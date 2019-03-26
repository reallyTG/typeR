library(quanteda)


### Name: bootstrap_dfm
### Title: Bootstrap a dfm
### Aliases: bootstrap_dfm
### Keywords: bootstrap dfm experimental

### ** Examples

# bootstrapping from the original text
txt <- c(textone = "This is a sentence.  Another sentence.  Yet another.", 
         texttwo = "Premiere phrase.  Deuxieme phrase.")
bootstrap_dfm(txt, n = 3)
         



