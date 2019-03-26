library(udpipe)


### Name: as.data.frame.udpipe_connlu
### Title: Convert the result of udpipe_annotate to a tidy data frame
### Aliases: as.data.frame.udpipe_connlu

### ** Examples

x <- udpipe_download_model(language = "dutch-lassysmall")
ud_dutch <- udpipe_load_model(x$file_model)
txt <- c("Ik ben de weg kwijt, kunt u me zeggen waar de Lange Wapper ligt? Jazeker meneer", 
         "Het gaat vooruit, het gaat verbazend goed vooruit")
x <- udpipe_annotate(ud_dutch, x = txt)
x <- as.data.frame(x)
head(x)


## cleanup for CRAN only - you probably want to keep your model if you have downloaded it
file.remove("dutch-lassysmall-ud-2.3-181115.udpipe")



