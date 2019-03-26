library(udpipe)


### Name: udpipe_load_model
### Title: Load an UDPipe model
### Aliases: udpipe_load_model

### ** Examples

x <- udpipe_download_model(language = "dutch-lassysmall", model_dir = tempdir())
x$file_model
ud_dutch <- udpipe_load_model(x$file_model)
## Not run: 
##D x <- udpipe_download_model(language = "english")
##D x$file_model
##D ud_english <- udpipe_load_model(x$file_model)
##D 
##D x <- udpipe_download_model(language = "hebrew")
##D x$file_model
##D ud_hebrew <- udpipe_load_model(x$file_model)
## End(Not run)

## cleanup for CRAN
file.remove(x$file_model)



