library(qdap)


### Name: read.transcript
### Title: Read Transcripts Into R
### Aliases: read.transcript
### Keywords: transcript

### ** Examples

## Not run: 
##D #Note: to view the document below use the path:
##D system.file("extdata/transcripts/", package = "qdap")
##D (doc1 <- system.file("extdata/transcripts/trans1.docx", package = "qdap"))
##D (doc2 <- system.file("extdata/transcripts/trans2.docx", package = "qdap"))
##D (doc3 <- system.file("extdata/transcripts/trans3.docx", package = "qdap"))
##D (doc4 <- system.file("extdata/transcripts/trans4.xlsx", package = "qdap"))
##D 
##D dat1 <- read.transcript(doc1)
##D truncdf(dat1, 40)
##D dat2 <- read.transcript(doc1, col.names = c("person", "dialogue"))
##D truncdf(dat2, 40)
##D dat2b <- rm_row(dat2, "person", "[C") #remove bracket row
##D truncdf(dat2b, 40)
##D 
##D ## read.transcript(doc2) #throws an error (need skip)
##D dat3 <- read.transcript(doc2, skip = 1); truncdf(dat3, 40)
##D 
##D ## read.transcript(doc3, skip = 1) #incorrect read; wrong sep
##D dat4 <- read.transcript(doc3, sep = "-", skip = 1); truncdf(dat4, 40)
##D 
##D dat5 <- read.transcript(doc4); truncdf(dat5, 40) #an .xlsx file
##D trans <- "sam: Computer is fun. Not too fun.
##D greg: No it's not, it's dumb.
##D teacher: What should we do?
##D sam: You liar, it stinks!"
##D 
##D read.transcript(text=trans)
##D 
##D ## Read in text specify spaces as sep
##D ## EXAMPLE 1
##D 
##D read.transcript(text="34    The New York Times reports a lot of words here.
##D 12    Greenwire reports a lot of words.
##D 31    Only three words.
##D  2    The Financial Times reports a lot of words.
##D  9    Greenwire short.
##D 13    The New York Times reports a lot of words again.", 
##D     col.names=qcv(NO,    ARTICLE), sep="   ")
##D 
##D ## EXAMPLE 2
##D 
##D read.transcript(text="34..    The New York Times reports a lot of words here.
##D 12..    Greenwire reports a lot of words.
##D 31..    Only three words.
##D  2..    The Financial Times reports a lot of words.
##D  9..    Greenwire short.
##D 13..    The New York Times reports a lot of words again.", 
##D     col.names=qcv(NO,    ARTICLE), sep="\\.\\.")
## End(Not run)



