library(htmltools)


### Name: htmlPreserve
### Title: Preserve HTML regions
### Aliases: htmlPreserve extractPreserveChunks restorePreserveChunks

### ** Examples

# htmlPreserve will prevent "<script>alert(10*2*3);</script>"
# from getting an <em> tag inserted in the middle
markup <- paste(sep = "\n",
  "This is *emphasized* text in markdown.",
  htmlPreserve("<script>alert(10*2*3);</script>"),
  "Here is some more *emphasized text*."
)
extracted <- extractPreserveChunks(markup)
markup <- extracted$value
# Just think of this next line as Markdown processing
output <- gsub("\\*(.*?)\\*", "<em>\\1</em>", markup)
output <- restorePreserveChunks(output, extracted$chunks)
output




