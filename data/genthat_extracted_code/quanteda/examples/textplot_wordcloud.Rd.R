library(quanteda)


### Name: textplot_wordcloud
### Title: Plot features as a wordcloud
### Aliases: textplot_wordcloud
### Keywords: textplot

### ** Examples

# plot the features (without stopwords) from Obama's inaugural addresses
set.seed(10)
obama_dfm <- 
    dfm(corpus_subset(data_corpus_inaugural, President == "Obama"),
        remove = stopwords("english"), remove_punct = TRUE) %>%
    dfm_trim(min_termfreq = 3)
    
# basic wordcloud
textplot_wordcloud(obama_dfm)

# plot in colors with some additional options
textplot_wordcloud(obama_dfm, rotation = 0.25, 
                   color = rev(RColorBrewer::brewer.pal(10, "RdBu")))
  
# other display options
col <- sapply(seq(0.1, 1, 0.1), function(x) adjustcolor("#1F78B4", x))
textplot_wordcloud(obama_dfm, adjust = 0.5, random_order = FALSE, 
                   color = col, rotation = FALSE)
  
# comparison plot of Obama v. Trump
obama_trump_dfm <- 
    dfm(corpus_subset(data_corpus_inaugural, President %in% c("Obama", "Trump")),
        remove = stopwords("english"), remove_punct = TRUE, groups = "President") %>%
    dfm_trim(min_termfreq = 3)

textplot_wordcloud(obama_trump_dfm, comparison = TRUE, max_words = 300,
                   color = c("blue", "red"))



