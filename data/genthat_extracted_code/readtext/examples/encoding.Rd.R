library(readtext)


### Name: encoding
### Title: detect the encoding of texts
### Aliases: encoding

### ** Examples

encoding(data_char_encodedtexts)
# show detected value for each text, versus known encoding
data.frame(labelled = names(data_char_encodedtexts), 
           detected = encoding(data_char_encodedtexts)$all)

## Not run: 
##D # Russian text, Windows-1251
##D myreadtext <- readtext("http://www.kenbenoit.net/files/01_er_5.txt")
##D encoding(myreadtext)
## End(Not run)



