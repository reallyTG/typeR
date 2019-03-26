library(hexView)


### Name: as.character.rawFormat
### Title: Convert Binary File Format into Strings
### Aliases: as.character.rawFormat
### Keywords: character

### ** Examples

fileFormat <- readFormat(hexViewFile("rawTest.int"),
                         memFormat(int1=integer4, int2=integer4))
as.character(fileFormat)



