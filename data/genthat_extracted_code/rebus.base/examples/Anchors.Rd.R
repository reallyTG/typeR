library(rebus.base)


### Name: Anchors
### Title: The start or end of a string.
### Aliases: Anchors START END exactly
### Keywords: datasets

### ** Examples

START
END

# Usage
x <- c("catfish", "tomcat", "cat")
(rx_start <- START %R% "cat")
(rx_end <- "cat" %R% END)
(rx_exact <- exactly("cat"))
stringi::stri_detect_regex(x, rx_start)
stringi::stri_detect_regex(x, rx_end)
stringi::stri_detect_regex(x, rx_exact)



