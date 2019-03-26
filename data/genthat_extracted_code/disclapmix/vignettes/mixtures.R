## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.width = 5, fig.height = 5)

## ------------------------------------------------------------------------
library(disclapmix)
data(danes)

## ------------------------------------------------------------------------
db <- as.matrix(danes[rep(seq_len(nrow(danes)), danes$n), seq_len(ncol(danes)-1)])
str(db)

## ------------------------------------------------------------------------
donor1 <- db[1, ]
donor2 <- db[20, ]
refdb <- db[-c(1, 20), ]

## ------------------------------------------------------------------------
mix <- generate_mixture(list(donor1, donor2))

## ------------------------------------------------------------------------
pairs <- contributor_pairs(mix)
pairs

## ------------------------------------------------------------------------
fit <- disclapmix(x = refdb, clusters = 4L)

## ------------------------------------------------------------------------
ranked_pairs <- rank_contributor_pairs(pairs, fit)
ranked_pairs

## ------------------------------------------------------------------------
get_rank(ranked_pairs, donor1)
get_rank(ranked_pairs, donor2)

