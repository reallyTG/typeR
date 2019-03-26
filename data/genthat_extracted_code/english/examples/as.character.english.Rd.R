library(english)


### Name: as.character.english
### Title: Integers into English
### Aliases: as.character.english
### Keywords: arith

### ** Examples

oneOone <- english(101, UK = FALSE)
as.character(oneOone)
as.character(as.english(oneOone, UK = TRUE))
as.character(oneOone + 1:10)



