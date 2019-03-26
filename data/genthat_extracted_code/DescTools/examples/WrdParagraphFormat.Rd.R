library(DescTools)


### Name: WrdParagraphFormat
### Title: Get or Set the Paragraph Format in Word
### Aliases: WrdParagraphFormat WrdParagraphFormat<-
### Keywords: print

### ** Examples

## Not run: 
##D # Windows-specific example
##D wrd <- GetNewWrd()  # get the handle to a new word instance
##D 
##D WrdParagraphFormat(wrd=wrd) <- list(Alignment=wdConst$wdAlignParagraphLeft,
##D                                     LeftIndent=42.55)
##D 
##D ToWrd("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
##D eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
##D At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd
##D gubergren, no sea takimata sanctus est.\n", wrd=wrd)
##D 
##D # reset
##D WrdParagraphFormat(wrd=wrd) <- list(LeftIndent=0)
## End(Not run)



