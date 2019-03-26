library(textclean)


### Name: replace_emoji
### Title: Replace Emojis With Words/Identifier
### Aliases: replace_emoji replace_emoji_identifier
### Keywords: emoji

### ** Examples

fls <- system.file("docs/emoji_sample.txt", package = "textclean")
x <- readLines(fls)[1]
replace_emoji(x)
replace_emoji_identifier(x)



