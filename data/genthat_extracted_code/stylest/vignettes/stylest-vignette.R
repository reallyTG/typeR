## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include=FALSE-------------------------------------------------------
library(kableExtra)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("leslie-huang/stylest")

## ----echo=TRUE-----------------------------------------------------------
library(stylest)
library(corpus)

## ----echo=TRUE-----------------------------------------------------------
data(novels_excerpts)

## ----echo=FALSE----------------------------------------------------------
# show a snippet of the data
kable(novels_excerpts[c(1,4,8), ]) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))

## ----echo=TRUE-----------------------------------------------------------
unique(novels_excerpts$author)

## ----echo = TRUE---------------------------------------------------------
set.seed(1234)

## ----echo=TRUE-----------------------------------------------------------
vocab_with_defaults <- stylest_select_vocab(novels_excerpts$text, novels_excerpts$author)

## ----echo=TRUE-----------------------------------------------------------
filter <- corpus::text_filter(drop_punct = TRUE, drop_number = TRUE)

vocab_custom <- stylest_select_vocab(novels_excerpts$text, novels_excerpts$author, 
                                     filter = filter, smooth = 1, nfold = 10, 
                                     cutoff_pcts = c(50, 75, 99))

## ----echo=TRUE-----------------------------------------------------------
# Percentile with best prediction rate
vocab_with_defaults$cutoff_pct_best

# Rate of INCORRECTLY predicted speakers of held-out texts
vocab_with_defaults$miss_pct

# Data on the setup:

# Percentiles tested
vocab_with_defaults$cutoff_pcts

# Number of folds
vocab_with_defaults$nfold


## ----echo=TRUE-----------------------------------------------------------
terms_80 <- stylest_terms(novels_excerpts$text, novels_excerpts$author, 80, filter = filter)

## ----echo=TRUE-----------------------------------------------------------

mod <- stylest_fit(novels_excerpts$text, novels_excerpts$author, terms = terms_80, filter = filter)


## ----echo = TRUE---------------------------------------------------------

odds <- stylest_odds(mod, novels_excerpts$text, novels_excerpts$author)

## ----echo = TRUE---------------------------------------------------------
# Pride and Prejudice
novels_excerpts$text[14]

odds$log_odds_avg[14]

odds$log_odds_se[14]


## ----echo = TRUE---------------------------------------------------------

na_text <- "No one who had ever seen Catherine Morland in her infancy would have supposed 
            her born to be an heroine. Her situation in life, the character of her father 
            and mother, her own person and disposition, were all equally against her. Her 
            father was a clergyman, without being neglected, or poor, and a very respectable 
            man, though his name was Richard—and he had never been handsome. He had a 
            considerable independence besides two good livings—and he was not in the least 
            addicted to locking up his daughters."

pred <- stylest_predict(mod, na_text)

## ----echo = TRUE---------------------------------------------------------
pred$predicted

pred$log_probs

## ----echo = TRUE---------------------------------------------------------

influential_terms <- stylest_term_influence(mod, novels_excerpts$text, novels_excerpts$author)


## ----echo = FALSE--------------------------------------------------------
kable(head(influential_terms[order(influential_terms$infl_avg, decreasing = TRUE), ])) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))

## ----echo = FALSE--------------------------------------------------------
kable(tail(influential_terms[order(influential_terms$infl_avg, decreasing = TRUE), ])) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))


