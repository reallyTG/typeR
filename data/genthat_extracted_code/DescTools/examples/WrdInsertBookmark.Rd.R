library(DescTools)


### Name: WrdInsertBookmark
### Title: Insert a Bookmark, Goto Bookmark and Update the Text of a
###   Bookmark
### Aliases: WrdInsertBookmark WrdGoto WrdUpdateBookmark
### Keywords: print

### ** Examples

## Not run: 
##D  # Windows-specific example
##D wrd <- GetNewWrd()
##D WrdText("a)\n\n\nb)", fontname=WrdGetFont()$name, fontsize=WrdGetFont()$size)
##D WrdInsertBookmark("chap_b")
##D WrdText("\n\n\nc)\n\n\n", fontname=WrdGetFont()$name, fontsize=WrdGetFont()$size)
##D 
##D WrdGoto("chap_b")
##D WrdUpdateBookmark("chap_b", "Goto chapter B and set text")
## End(Not run)



