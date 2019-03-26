library(quanteda)


### Name: summary_character
### Title: Summary statistics on a character vector
### Aliases: summary_character
### Keywords: char internal

### ** Examples

# summarize texts
quanteda:::summary_character(c("Testing this text. Second sentence.", "And this one."))
quanteda:::summary_character(data_char_ukimmig2010)
mysummary_ukimmig2010 <- quanteda:::summary_character(data_char_ukimmig2010)
head(mysummary_ukimmig2010)



