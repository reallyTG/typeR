library(textreadr)


### Name: read_document
### Title: Generic Function to Read in a Document
### Aliases: read_document

### ** Examples

## .pdf
pdf_doc <- system.file("docs/rl10075oralhistoryst002.pdf",
    package = "textreadr")
read_document(pdf_doc)

## .html
html_doc <- system.file("docs/textreadr_creed.html", package = "textreadr")
read_document(html_doc)

## .docx
docx_doc <- system.file("docs/Yasmine_Interview_Transcript.docx",
    package = "textreadr")
read_document(docx_doc)

## .doc
doc_doc <- system.file("docs/Yasmine_Interview_Transcript.doc",
    package = "textreadr")
read_document(doc_doc)

## .txt
txt_doc <- system.file('docs/textreadr_creed.txt', package = "textreadr")
read_document(txt_doc)

## .rtf
## Not run: 
##D rtf_doc <- download(
##D     'https://raw.githubusercontent.com/trinker/textreadr/master/inst/docs/trans7.rtf'
##D )
##D read_document(rtf_doc)
## End(Not run)

## Not run: 
##D ## URLs
##D read_document('http://www.talkstats.com/index.php')
## End(Not run)



