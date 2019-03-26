library(textTinyR)


### Name: token_stats
### Title: token statistics
### Aliases: token_stats
### Keywords: datasets

### ** Examples



library(textTinyR)

expl = c('one_word_token', 'two_words_token', 'three_words_token', 'four_words_token')

tk <- token_stats$new(x_vec = expl, path_2folder = NULL, path_2file = NULL)

#-------------------------
# frequency distribution:
#-------------------------

tk$freq_distribution()

# tk$print_frequency()


#------------------
# count characters:
#------------------

cnt <- tk$count_character()

# tk$print_count_character(number = 4)


#----------------------
# collocation of words:
#----------------------

col <- tk$collocation_words()

# tk$print_collocations(word = 'five')


#-----------------------------
# string dissimilarity matrix:
#-----------------------------

dism <- tk$string_dissimilarity_matrix(method = 'levenshtein')


#---------------------
# build a look-up-table:
#---------------------

lut <- tk$look_up_table(n_grams = 3)

# tk$print_words_lookup_tbl(n_gram = 'e_w')



