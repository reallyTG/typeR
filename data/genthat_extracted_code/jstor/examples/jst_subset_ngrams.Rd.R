library(jstor)


### Name: jst_subset_ngrams
### Title: Define a subset of ngrams
### Aliases: jst_subset_ngrams

### ** Examples

# create sample output
tmp <- tempdir()
jst_import_zip(jst_example("pseudo_dfr.zip"),
               import_spec = jst_define_import(book = jst_get_book),
               out_file = "test", out_path = tmp)

# re-import as our selection for which we would like to import ngrams
selection <- jst_re_import(file.path(tmp, 
                                     "test_book_chapter_jst_get_book-1.csv"))

# get location of file
zip_loc <- jst_subset_ngrams(jst_example("pseudo_dfr.zip"), "ngram1",
                             selection) 

# import ngram
jst_get_ngram(zip_loc[[1]])



