library(sentimentr)


### Name: as_key
### Title: Create/Manipulate Hash Keys
### Aliases: as_key update_key update_polarity_table
###   update_valence_shifter_table is_key
### Keywords: hash key lookup

### ** Examples

key <- data.frame(
    words = sample(letters),
    polarity = rnorm(26),
    stringsAsFactors = FALSE
)

(mykey <- as_key(key))

## Looking up values
mykey[c("a", "k")][[2]]

## Drop terms from key
update_key(mykey, drop = c("f", "h"))

## Add terms to key
update_key(mykey, x = data.frame(x = c("dog", "cat"), y = c(1, -1)))

## Add terms & drop to/from a key
update_key(mykey, drop = c("f", "h"), x = data.frame(x = c("dog", "cat"), y = c(1, -1)))

## Explicity key type (wrapper for `update_key` for sentiment table.
## See `update_valence_shifter_table` a corresponding valence shifter updater.
library(lexicon)
updated_hash_sentiment <- sentimentr:::update_polarity_table(lexicon::hash_sentiment_huliu,
    x = data.frame(
        words = c('frickin', 'hairy'),
        polarity = c(-1, -1),
        stringsAsFactors = FALSE
    )
)

## Checking if you have a key
is_key(mykey)
is_key(key)
is_key(mtcars)
is_key(update_key(mykey, drop = c("f", "h")))

## Using syuzhet's sentiment lexicons
## Not run: 
##D library(syuzhet)
##D (bing_key <- as_key(syuzhet:::bing))
##D as_key(syuzhet:::afinn)
##D as_key(syuzhet:::syuzhet_dict)
##D 
##D sam <- gsub("Sam-I-am", "Sam I am", sam_i_am)
##D sentiment(sam, , polarity_dt = bing_key)
##D 
##D ## The nrc dictionary in syuzhet requires a bit of data wrangling before it 
##D ## is in the correct shape to convert to a key.  
##D 
##D library(syuzhet)
##D library(tidyverse)
##D 
##D nrc_key <- syuzhet:::nrc %>% 
##D     dplyr::filter(
##D         sentiment %in% c('positive', 'negative'),
##D         lang == 'english'
##D     ) %>%
##D     dplyr::select(-lang) %>% 
##D     mutate(value = ifelse(sentiment == 'negative', value * -1, value)) %>%
##D     dplyr::group_by(word) %>%
##D     dplyr::summarize(y = mean(value)) %>%
##D     sentimentr::as_key()
##D     
##D sentiment(sam, polarity_dt = nrc_key)
##D 
##D ## The lexicon package contains a preformatted nrc sentiment hash table that 
##D ## can be used instead.
##D sentiment(sam, polarity_dt = lexicon::hash_sentiment_nrc)
## End(Not run)

## Using 2 vectors of words
## Not run: 
##D install.packages("tm.lexicon.GeneralInquirer", repos="http://datacube.wu.ac.at", type="source")
##D require("tm.lexicon.GeneralInquirer")
##D 
##D positive <- terms_in_General_Inquirer_categories("Positiv")
##D negative <- terms_in_General_Inquirer_categories("Negativ")
##D 
##D geninq <- data.frame(
##D     x = c(positive, negative),
##D     y = c(rep(1, length(positive)), rep(-1, length(negative))),
##D     stringsAsFactors = FALSE
##D ) %>%
##D     as_key()
##D 
##D geninq_pol <- with(presidential_debates_2012,
##D     sentiment_by(dialogue,
##D     person,
##D     polarity_dt = geninq
##D ))
##D 
##D geninq_pol %>% plot()
## End(Not run)



