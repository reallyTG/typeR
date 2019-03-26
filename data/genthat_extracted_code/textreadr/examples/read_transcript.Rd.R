library(textreadr)


### Name: read_transcript
### Title: Read Transcripts Into R
### Aliases: read_transcript
### Keywords: transcript

### ** Examples

(doc1 <- system.file("docs/trans1.docx", package = "textreadr"))
(doc2 <- system.file("docs/trans2.docx", package = "textreadr"))
(doc3 <- system.file("docs/trans3.docx", package = "textreadr"))
(doc4 <- system.file("docs/trans4.xlsx", package = "textreadr"))
(doc5 <- system.file("docs/trans5.xls", package = "textreadr"))
(doc6 <- system.file("docs/trans6.doc", package = "textreadr"))

dat1 <- read_transcript(doc1)
dat2 <- read_transcript(doc1, col.names = c("person", "dialogue"))

## read_transcript(doc2) #throws an error (need skip)
dat3 <- read_transcript(doc2, skip = 1)

## read_transcript(doc3, skip = 1) #incorrect read; wrong sep
dat4 <- read_transcript(doc3, sep = "-", skip = 1)

## xlsx/xls format
dat5 <- read_transcript(doc4)
dat6 <- read_transcript(doc5)

## MS doc format
## Not run: 
##D dat7 <- read_transcript(doc6) ## need to skip Researcher
##D dat8 <- read_transcript(doc6, skip = 1)
## End(Not run)

## rtf format
## Not run: 
##D rtf_doc <- download(
##D     'https://raw.githubusercontent.com/trinker/textreadr/master/inst/docs/trans7.rtf'
##D )
##D dat9 <- read_transcript(rtf_doc, skip = 1)
## End(Not run)

## text string input
trans <- "sam: Computer is fun. Not too fun.
greg: No it's not, it's dumb.
teacher: What should we do?
sam: You liar, it stinks!"

read_transcript(text=trans)

## Read in text specify spaces as sep
## EXAMPLE 1
read_transcript(text="34    The New York Times reports a lot of words here.
12    Greenwire reports a lot of words.
31    Only three words.
 2    The Financial Times reports a lot of words.
 9    Greenwire short.
13    The New York Times reports a lot of words again.",
    col.names = c("NO", "ARTICLE"), sep = "   ")

## EXAMPLE 2
read_transcript(text="34..    The New York Times reports a lot of words here.
12..    Greenwire reports a lot of words.
31..    Only three words.
 2..    The Financial Times reports a lot of words.
 9..    Greenwire short.
13..    The New York Times reports a lot of words again.",
    col.names = c("NO", "ARTICLE"), sep = "\\.\\.")

## Real Example
real_dat <- read_transcript(
    system.file("docs/Yasmine_Interview_Transcript.docx", package = "textreadr"),
    skip = 19
)



