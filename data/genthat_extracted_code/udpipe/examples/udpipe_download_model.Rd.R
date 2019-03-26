library(udpipe)


### Name: udpipe_download_model
### Title: Download an UDPipe model provided by the UDPipe community for a
###   specific language of choice
### Aliases: udpipe_download_model

### ** Examples

## Not run: 
##D x <- udpipe_download_model(language = "dutch-alpino")
##D x <- udpipe_download_model(language = "dutch-lassysmall")
##D x <- udpipe_download_model(language = "russian")
##D x <- udpipe_download_model(language = "french")
##D x <- udpipe_download_model(language = "english-partut")
##D x <- udpipe_download_model(language = "english-ewt")
##D x <- udpipe_download_model(language = "german-gsd")
##D x <- udpipe_download_model(language = "spanish-gsd")
##D x <- udpipe_download_model(language = "spanish-gsd", overwrite = FALSE)
##D 
##D x <- udpipe_download_model(language = "english", udpipe_model_repo = "bnosac/udpipe.models.ud")
##D x <- udpipe_download_model(language = "dutch", udpipe_model_repo = "bnosac/udpipe.models.ud")
##D x <- udpipe_download_model(language = "afrikaans", udpipe_model_repo = "bnosac/udpipe.models.ud")
##D x <- udpipe_download_model(language = "spanish-ancora", 
##D                            udpipe_model_repo = "bnosac/udpipe.models.ud")
##D x <- udpipe_download_model(language = "dutch-ud-2.1-20180111.udpipe", 
##D                            udpipe_model_repo = "bnosac/udpipe.models.ud")                           
##D x <- udpipe_download_model(language = "english", 
##D                            udpipe_model_repo = "jwijffels/udpipe.models.conll18.baseline")
## End(Not run)
x <- udpipe_download_model(language = "sanskrit", 
                           udpipe_model_repo = "jwijffels/udpipe.models.ud.2.0", 
                           model_dir = tempdir())
x
x$file_model

## cleanup for CRAN
file.remove(x$file_model)



