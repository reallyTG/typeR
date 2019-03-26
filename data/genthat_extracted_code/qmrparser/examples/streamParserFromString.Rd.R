library(qmrparser)


### Name: streamParserFromString
### Title: Creates a streamParser from a string
### Aliases: streamParserFromString
### Keywords: streamParser

### ** Examples

# reads one character
streamParserNextChar(streamParserFromString("\U00B6"))

# reads a string
stream  <- streamParserFromString("Hello world")

cstream <- streamParserNextChar(stream)

while( cstream$status == "ok" ) {
    print(streamParserPosition(cstream$stream))
    print(cstream$char)
    cstream <- streamParserNextCharSeq(cstream$stream)

streamParserClose(stream)
}




