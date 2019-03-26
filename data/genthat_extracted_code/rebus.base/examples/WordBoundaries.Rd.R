library(rebus.base)


### Name: WordBoundaries
### Title: Word boundaries
### Aliases: WordBoundaries BOUNDARY NOT_BOUNDARY whole_word
### Keywords: datasets

### ** Examples

BOUNDARY
NOT_BOUNDARY

# Usage
x <- c("the catfish miaowed", "the tomcat miaowed", "the cat miaowed")
(rx_before <- BOUNDARY %R% "cat")
(rx_after <- "cat" %R% BOUNDARY)
(rx_whole_word <- whole_word("cat"))
stringi::stri_detect_regex(x, rx_before)
stringi::stri_detect_regex(x, rx_after)
stringi::stri_detect_regex(x, rx_whole_word)



