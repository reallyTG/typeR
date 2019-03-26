library(textshape)


### Name: tidy_dtm
### Title: Convert a 'DocumentTermMatrix'/'TermDocumentMatrix' into Tidy
###   Form
### Aliases: tidy_dtm tidy_tdm

### ** Examples

data(simple_dtm)

tidy_dtm(simple_dtm)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load_current_gh('trinker/gofastr')
##D pacman::p_load(tidyverse, magrittr, ggstance)
##D 
##D my_dtm <- with(
##D     presidential_debates_2012, 
##D     q_dtm(dialogue, paste(time, tot, sep = "_"))
##D )
##D 
##D tidy_dtm(my_dtm) %>%
##D     tidyr::extract(
##D         col = doc, 
##D         into = c("time", "turn", "sentence"), 
##D         regex = "(\\d)_(\\d+)\\.(\\d+)"
##D     ) %>%
##D     mutate(
##D         time = as.numeric(time),
##D         turn = as.numeric(turn),
##D         sentence = as.numeric(sentence)
##D     ) %>%
##D     tbl_df() %T>%
##D     print() %>%
##D     group_by(time, term) %>%
##D     summarize(n = sum(n)) %>%
##D     group_by(time) %>%
##D     arrange(desc(n)) %>%
##D     slice(1:10) %>%
##D     ungroup() %>%
##D     mutate(
##D         term = factor(paste(term, time, sep = "__"),
##D             levels = rev(paste(term, time, sep = "__")))
##D     ) %>%
##D     ggplot(aes(x = n, y = term)) +
##D         geom_barh(stat='identity') +
##D         facet_wrap(~time, ncol=2, scales = 'free_y') +
##D         scale_y_discrete(labels = function(x) gsub("__.+$", "", x))
## End(Not run)



