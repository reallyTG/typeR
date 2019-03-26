library(aws.comprehend)


### Name: detect_language
### Title: Detect language in a source text
### Aliases: detect_language

### ** Examples

## Not run: 
##D   # simple example
##D   detect_language("This is a test sentence in English")
##D   
##D   # two languages in a single text
##D   txt <- "A: ¡Hola! ¿Como está, usted?\nB: Ça va bien. Merci. Et toi?"
##D   detect_language(txt)
##D 
##D   # "batch" mode
##D   detect_language(c("A: ¡Hola! ¿Como está, usted?",
##D                     "B: Ça va bien. Merci. Et toi?"))
## End(Not run)



