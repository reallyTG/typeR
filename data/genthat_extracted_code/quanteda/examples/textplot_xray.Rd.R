library(quanteda)


### Name: textplot_xray
### Title: Plot the dispersion of key word(s)
### Aliases: textplot_xray
### Keywords: textplot

### ** Examples

## Not run: 
##D data_corpus_inauguralPost70 <- corpus_subset(data_corpus_inaugural, Year > 1970)
##D # compare multiple documents
##D textplot_xray(kwic(data_corpus_inauguralPost70, "american"))
##D textplot_xray(kwic(data_corpus_inauguralPost70, "american"), scale = "absolute")
##D # compare multiple terms across multiple documents
##D textplot_xray(kwic(data_corpus_inauguralPost70, "america*"), 
##D               kwic(data_corpus_inauguralPost70, "people"))
##D 
##D # how to modify the ggplot with different options
##D library(ggplot2)
##D g <- textplot_xray(kwic(data_corpus_inauguralPost70, "american"), 
##D                    kwic(data_corpus_inauguralPost70, "people"))
##D g + aes(color = keyword) + scale_color_manual(values = c('red', 'blue'))
##D 
##D # adjust the names of the document names
##D docnames(data_corpus_inauguralPost70) <- apply(docvars(data_corpus_inauguralPost70, 
##D                                                        c("Year", "President")), 
##D                                               1, paste, collapse = ", ")
##D textplot_xray(kwic(data_corpus_inauguralPost70, "america*"), 
##D               kwic(data_corpus_inauguralPost70, "people"))
## End(Not run)



