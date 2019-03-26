library(readtext)


### Name: data_files_encodedtexts
### Title: a .zip file of texts containing a variety of differently encoded
###   texts
### Aliases: data_files_encodedtexts

### ** Examples

## Not run: 
##D # unzip the files to a temporary directory
##D FILEDIR <- tempdir()
##D unzip(system.file("extdata", "data_files_encodedtexts.zip", package = "readtext"), 
##D       exdir = FILEDIR)
##D 
##D # get encoding from filename
##D filenames <- list.files(FILEDIR, "\\.txt$")
##D # strip the extension
##D filenames <- gsub(".txt$", "", filenames)
##D parts <- strsplit(filenames, "_")
##D fileencodings <- sapply(parts, "[", 3)
##D fileencodings
##D 
##D # find out which conversions are unavailable (through iconv())
##D cat("Encoding conversions not available for this platform:")
##D notAvailableIndex <- which(!(fileencodings %in% iconvlist()))
##D fileencodings[notAvailableIndex]
##D 
##D # try readtext
##D require(quanteda)
##D txts <- readtext(paste0(FILEDIR, "/", "*.txt"))
##D substring(texts(txts)[1], 1, 80) # gibberish
##D substring(texts(txts)[4], 1, 80) # hex
##D substring(texts(txts)[40], 1, 80) # hex
##D 
##D # read them in again
##D txts <- readtext(paste0(FILEDIR,  "/", "*.txt"), encoding = fileencodings)
##D substring(texts(txts)[1], 1, 80)  # English
##D substring(texts(txts)[4], 1, 80)  # Arabic, looking good 
##D substring(texts(txts)[40], 1, 80) # Cyrillic, looking good
##D substring(texts(txts)[7], 1, 80)  # Chinese, looking good
##D substring(texts(txts)[26], 1, 80) # Hindi, looking good
##D 
##D txts <- readtext(paste0(FILEDIR, "/", "*.txt"), encoding = fileencodings,
##D                   docvarsfrom = "filenames", 
##D                   docvarnames = c("document", "language", "inputEncoding"))
##D encodingCorpus <- corpus(txts, source = "Created by encoding-tests.R") 
##D summary(encodingCorpus)
## End(Not run)



