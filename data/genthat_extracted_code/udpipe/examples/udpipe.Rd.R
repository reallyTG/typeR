library(udpipe)


### Name: udpipe
### Title: Tokenising, Lemmatising, Tagging and Dependency Parsing of raw
###   text in TIF format
### Aliases: udpipe

### ** Examples

ud_dutch <- udpipe_download_model(language = "dutch-lassysmall")
ud_dutch <- udpipe_load_model(ud_dutch)

## Tokenise, Tag and Dependency Parsing Annotation. Output is in CONLL-U format.
txt <- c("Dus. Godvermehoeren met pus in alle puisten, 
  zei die schele van Van Bukburg en hij had nog gelijk ook. 
  Er was toen dat liedje van tietenkonttieten kont tieten kontkontkont, 
  maar dat hoefden we geenseens niet te zingen. 
  Je kunt zeggen wat je wil van al die gesluierde poezenpas maar d'r kwam wel 
  een vleeswarenwinkel onder te voorschijn van heb je me daar nou.
  
  En zo gaat het maar door.",
  "Wat die ransaap van een academici nou weer in z'n botte pan heb gehaald mag 
  Joost in m'n schoen gooien, maar feit staat boven water dat het een gore 
  vieze vuile ransaap is.")
names(txt) <- c("document_identifier_1", "we-like-ilya-leonard-pfeiffer")

##
## TIF tagging: tag if x is a character vector, a data frame or a token sequence
##
x <- udpipe(txt, object = ud_dutch)
x <- udpipe(data.frame(doc_id = names(txt), text = txt, stringsAsFactors = FALSE), 
            object = ud_dutch)
x <- udpipe(strsplit(txt, "[[:space:][:punct:][:digit:]]+"), 
            object = ud_dutch)
       
## You can also directly pass on the language in the call to udpipe
x <- udpipe("Dit werkt ook.", object = "dutch-lassysmall")
x <- udpipe(txt, object = "dutch-lassysmall")
x <- udpipe(data.frame(doc_id = names(txt), text = txt, stringsAsFactors = FALSE), 
            object = "dutch-lassysmall")
x <- udpipe(strsplit(txt, "[[:space:][:punct:][:digit:]]+"), 
            object = "dutch-lassysmall")
            
## cleanup for CRAN only - you probably want to keep your model if you have downloaded it
file.remove("dutch-lassysmall-ud-2.3-181115.udpipe")



