library(jstor)


### Name: jst_get_chapters
### Title: Extract information on book chapters
### Aliases: jst_get_chapters

### ** Examples

# extract parts without authors
jst_get_chapters(jst_example("book.xml"))

# import authors too
parts <- jst_get_chapters(jst_example("book.xml"), authors = TRUE)
parts

tidyr::unnest(parts)



