library(readtext)


### Name: readtext
### Title: read a text file(s)
### Aliases: readtext

### ** Examples

## No test: 
## get the data directory
DATA_DIR <- system.file("extdata/", package = "readtext")

## read in some text data
# all UDHR files
(rt1 <- readtext(paste0(DATA_DIR, "txt/UDHR/*")))

# manifestos with docvars from filenames
(rt2 <- readtext(paste0(DATA_DIR, "txt/EU_manifestos/*.txt"),
                 docvarsfrom = "filenames", 
                 docvarnames = c("unit", "context", "year", "language", "party"),
                 encoding = "LATIN1"))
                 
# recurse through subdirectories
(rt3 <- readtext(paste0(DATA_DIR, "txt/movie_reviews/*"), 
                 docvarsfrom = "filepaths", docvarnames = "sentiment"))

## read in csv data
(rt4 <- readtext(paste0(DATA_DIR, "csv/inaugCorpus.csv")))

## read in tab-separated data
(rt5 <- readtext(paste0(DATA_DIR, "tsv/dailsample.tsv"), text_field = "speech"))

## read in JSON data
(rt6 <- readtext(paste0(DATA_DIR, "json/inaugural_sample.json"), text_field = "texts"))

## read in pdf data
# UNHDR
(rt7 <- readtext(paste0(DATA_DIR, "pdf/UDHR/*.pdf"), 
                 docvarsfrom = "filenames", 
                 docvarnames = c("document", "language")))
Encoding(rt7$text)

## read in Word data (.doc)
(rt8 <- readtext(paste0(DATA_DIR, "word/*.doc")))
Encoding(rt8$text)

## read in Word data (.docx)
(rt9 <- readtext(paste0(DATA_DIR, "word/*.docx")))
Encoding(rt9$text)

## use elements of path and filename as docvars
(rt10 <- readtext(paste0(DATA_DIR, "pdf/UDHR/*.pdf"), 
                  docvarsfrom = "filepaths", dvsep = "[/_.]"))
## End(No test)



