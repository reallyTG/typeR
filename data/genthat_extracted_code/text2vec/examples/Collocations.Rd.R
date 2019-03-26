library(text2vec)


### Name: Collocations
### Title: Collocations model.
### Aliases: Collocations
### Keywords: datasets

### ** Examples

library(text2vec)
data("movie_review")

preprocessor = function(x) {
  gsub("[^[:alnum:]\\s]", replacement = " ", tolower(x))
}
sample_ind = 1:100
tokens = word_tokenizer(preprocessor(movie_review$review[sample_ind]))
it = itoken(tokens, ids = movie_review$id[sample_ind])
system.time(v <- create_vocabulary(it))
v = prune_vocabulary(v, term_count_min = 5)

model = Collocations$new(collocation_count_min = 5, pmi_min = 5)
model$fit(it, n_iter = 2)
model$collocation_stat

it2 = model$transform(it)
v2 = create_vocabulary(it2)
v2 = prune_vocabulary(v2, term_count_min = 5)
# check what phrases model has learned
setdiff(v2$term, v$term)
# [1] "main_character"  "jeroen_krabb"    "boogey_man"      "in_order"
# [5] "couldn_t"        "much_more"       "my_favorite"     "worst_film"
# [9] "have_seen"       "characters_are"  "i_mean"          "better_than"
# [13] "don_t_care"      "more_than"       "look_at"         "they_re"
# [17] "each_other"      "must_be"         "sexual_scenes"   "have_been"
# [21] "there_are_some"  "you_re"          "would_have"      "i_loved"
# [25] "special_effects" "hit_man"         "those_who"       "people_who"
# [29] "i_am"            "there_are"       "could_have_been" "we_re"
# [33] "so_bad"          "should_be"       "at_least"        "can_t"
# [37] "i_thought"       "isn_t"           "i_ve"            "if_you"
# [41] "didn_t"          "doesn_t"         "i_m"             "don_t"

# and same way we can create document-term matrix which contains
# words and phrases!
dtm = create_dtm(it2, vocab_vectorizer(v2))
# check that dtm contains phrases
which(colnames(dtm) == "jeroen_krabb")



