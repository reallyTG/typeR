library(transcribeR)


### Name: sendAudioGetJobs
### Title: Posts to HP IDOL OnDemand Speech Recognition API and Store the
###   Resulting Job ID
### Aliases: sendAudioGetJobs

### ** Examples

## Not run: 
##D ## Reads files from the specified directory and creates a new CSV at the specified path
##D 
##D fnames <- c('boxer.wav', 'merkley.wav') # Example with 2 files
##D urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
##D lapply(urls, function(x) download.file(x, destfile = basename(x), mode = 'wb'))
##D 
##D WAV_DIR <- getwd()
##D 
##D sendAudioGetJobs(wav.dir = WAV_DIR,
##D                  API_KEY",
##D                  csv.location = CSV_LOCATION)
## End(Not run)



