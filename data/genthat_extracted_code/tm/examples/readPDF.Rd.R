library(tm)


### Name: readPDF
### Title: Read In a PDF Document
### Aliases: readPDF
### Keywords: file

### ** Examples

uri <- paste0("file://",
              system.file(file.path("doc", "tm.pdf"), package = "tm"))
engine <- if(nzchar(system.file(package = "pdftools"))) {
    "pdftools" 
} else {
    "ghostscript"
}
reader <- readPDF(engine)
pdf <- reader(elem = list(uri = uri), language = "en", id = "id1")
cat(content(pdf)[1])
VCorpus(URISource(uri, mode = ""),
        readerControl = list(reader = readPDF(engine = "ghostscript")))



