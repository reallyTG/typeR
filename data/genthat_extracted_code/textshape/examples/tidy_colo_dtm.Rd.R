library(textshape)


### Name: tidy_colo_tdm
### Title: Convert a 'DocumentTermMatrix'/'TermDocumentMatrix' into
###   Collocating Words in Tidy Form
### Aliases: tidy_colo_tdm tidy_colo_dtm

### ** Examples

data(simple_dtm)

tidied <- tidy_colo_dtm(simple_dtm)
tidied
unique_pairs(tidied)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load_current_gh('trinker/gofastr', 'trinker/lexicon')
##D pacman::p_load(tidyverse, magrittr, ggstance)
##D 
##D my_dtm <- with(
##D     presidential_debates_2012, 
##D     q_dtm(dialogue, paste(time, tot, sep = "_"))
##D )
##D 
##D tidy_colo_dtm(my_dtm) %>%
##D     tbl_df() %>%
##D     filter(!term_1 %in% c('i', lexicon::sw_onix) & 
##D         !term_2 %in% lexicon::sw_onix
##D     ) %>%
##D     filter(term_1 != term_2) %>%
##D     unique_pairs() %>%
##D     filter(n > 15) %>%
##D     complete(term_1, term_2, fill = list(n = 0)) %>%
##D     ggplot(aes(x = term_1, y = term_2, fill = n)) +
##D         geom_tile() +
##D         scale_fill_gradient(low= 'white', high = 'red') +
##D         theme(axis.text.x = element_text(angle = 45, hjust = 1))
## End(Not run)



