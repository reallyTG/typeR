library(qmrparser)


### Name: streamParser
### Title: Generic interface for character processing, allowing forward and
###   backwards translation.
### Aliases: streamParserNextChar streamParserNextChar
###   streamParserNextCharSeq streamParserPosition streamParserClose
### Keywords: streamParser

### ** Examples


stream<- streamParserFromString("Hello world")

cstream <- streamParserNextChar(stream)

while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)
}

streamParserClose(stream)




