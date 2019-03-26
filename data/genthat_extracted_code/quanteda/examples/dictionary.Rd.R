library(quanteda)


### Name: dictionary
### Title: Create a dictionary
### Aliases: dictionary

### ** Examples

mycorpus <- corpus_subset(data_corpus_inaugural, Year>1900)
mydict <- dictionary(list(christmas = c("Christmas", "Santa", "holiday"),
                          opposition = c("Opposition", "reject", "notincorpus"),
                          taxing = "taxing",
                          taxation = "taxation",
                          taxregex = "tax*",
                          country = "america"))
head(dfm(mycorpus, dictionary = mydict))

# subset a dictionary
mydict[1:2]
mydict[c("christmas", "opposition")]
mydict[["opposition"]]

# combine dictionaries
c(mydict["christmas"], mydict["country"])

## Not run: 
##D # import the Laver-Garry dictionary from Provalis Research
##D dictfile <- tempfile()
##D download.file("https://provalisresearch.com/Download/LaverGarry.zip", 
##D               dictfile, mode = "wb")
##D unzip(dictfile, exdir = (td <- tempdir()))
##D lgdict <- dictionary(file = paste(td, "LaverGarry.cat", sep = "/"))
##D head(dfm(data_corpus_inaugural, dictionary = lgdict))
##D 
##D # import a LIWC formatted dictionary from http://www.moralfoundations.org
##D download.file("https://goo.gl/5gmwXq", tf <- tempfile())
##D mfdict <- dictionary(file = tf, format = "LIWC")
##D head(dfm(data_corpus_inaugural, dictionary = mfdict))
## End(Not run)



