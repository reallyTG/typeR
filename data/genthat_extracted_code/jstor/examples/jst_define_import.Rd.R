library(jstor)


### Name: jst_define_import
### Title: Define an import specification
### Aliases: jst_define_import

### ** Examples

# articles will be imported via `jst_get_article()` and `jst_get_authors()`
jst_define_import(article = c(jst_get_article, jst_get_authors))

# define a specification for importing article metadata and unigrams (ngram1)
jst_define_import(article = jst_get_article,
                  ngram1 = jst_get_ngram)
                  
                  
# import all four types with one function each
jst_define_import(article = jst_get_article,
                  book = jst_get_book,
                  report = jst_get_book,
                  pamphlet = jst_get_article)
                  
# import all four types with multiple functions
jst_define_import(article = c(jst_get_article, jst_get_authors, jst_get_references),
                  book = c(jst_get_book, jst_get_chapters),
                  report = jst_get_book,
                  pamphlet = jst_get_article)

# if you want to import chapters with authors, you can use an anonymous
# function

chapters_w_authors <- function(x) jst_get_chapters(x, authors = TRUE)
jst_define_import(book = chapters_w_authors)


## Not run: 
##D # define imports
##D imports <- jst_define_import(article = c(jst_get_article, jst_get_authors))
##D 
##D # convert the files to .csv
##D jst_import_zip("my_archive.zip", out_file = "my_out_file", 
##D                  import_spec = imports)
## End(Not run)



