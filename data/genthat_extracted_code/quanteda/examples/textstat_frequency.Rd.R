library(quanteda)


### Name: textstat_frequency
### Title: Tabulate feature frequencies
### Aliases: textstat_frequency
### Keywords: plot

### ** Examples

dfm1 <- dfm(c("a a b b c d", "a d d d", "a a a"))
textstat_frequency(dfm1)
textstat_frequency(dfm1, groups = c("one", "two", "one"))

obamadfm <- 
    corpus_subset(data_corpus_inaugural, President == "Obama") %>%
    dfm(remove_punct = TRUE, remove = stopwords("english"))
freq <- textstat_frequency(obamadfm)
head(freq, 10)

## No test: 
# plot 20 most frequent words
library("ggplot2")
ggplot(freq[1:20, ], aes(x = reorder(feature, frequency), y = frequency)) +
    geom_point() + 
    coord_flip() +
    labs(x = NULL, y = "Frequency")

# plot relative frequencies by group
dfm_weight_pres <- data_corpus_inaugural %>% 
    corpus_subset(Year > 2000) %>% 
    dfm(remove = stopwords("english"), remove_punct = TRUE) %>% 
    dfm_group(groups = "President") %>%
    dfm_weight(scheme = "prop")

# calculate relative frequency by president
freq_weight <- textstat_frequency(dfm_weight_pres, n = 10,
                                  groups = "President")

# plot frequencies
ggplot(data = freq_weight, aes(x = nrow(freq_weight):1, y = frequency)) +
    geom_point() +
    facet_wrap(~ group, scales = "free") +
    coord_flip() +
    scale_x_continuous(breaks = nrow(freq_weight):1,
                       labels = freq_weight$feature) +
    labs(x = NULL, y = "Relative frequency")
## End(No test)



