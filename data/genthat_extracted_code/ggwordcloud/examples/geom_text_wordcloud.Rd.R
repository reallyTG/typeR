library(ggwordcloud)


### Name: geom_text_wordcloud
### Title: word cloud text geoms
### Aliases: geom_text_wordcloud geom_text_wordcloud_area

### ** Examples

set.seed(42)
data("love_words_small")

ggplot(love_words_small, aes(label = word, size = speakers)) +
geom_text_wordcloud() +
scale_size_area(max_size = 20) +
theme_minimal()

ggplot(love_words_small, aes(label = word, size = speakers)) +
geom_text_wordcloud_area() +
scale_size_area(max_size = 20) +
theme_minimal()



