library(qmrparser)


### Name: streamParserFromFileName
### Title: Creates a streamParser from a file name
### Aliases: streamParserFromFileName
### Keywords: streamParser

### ** Examples

  name    <- system.file("extdata","datInTest01.txt", package = "qmrparser")
  
  stream  <- streamParserFromFileName(name)
  
  cstream <- streamParserNextChar(stream)
  
  while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)
  }
  
  streamParserClose(stream)
  



