library(jstor)


### Name: find_chapters
### Title: Defunct: Extract information on book chapters
### Aliases: find_chapters

### ** Examples

## Not run: 
##D  
##D # extract parts without authors
##D find_chapters(jstor_example("sample_book.xml"))
##D 
##D # import authors too
##D parts <- find_chapters(jstor_example("sample_book.xml"), authors = TRUE)
##D parts
##D 
##D tidyr::unnest(parts)
## End(Not run)



