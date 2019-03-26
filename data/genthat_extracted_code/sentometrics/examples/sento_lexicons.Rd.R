library(sentometrics)


### Name: sento_lexicons
### Title: Set up lexicons (and valence word list) for use in sentiment
###   analysis
### Aliases: sento_lexicons

### ** Examples

data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# lexicons straight from built-in word lists
l1 <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")])

# including a self-made lexicon, with and without valence shifters
lexIn <- c(list(myLexicon = data.table(w = c("nice", "boring"), s = c(2, -1))),
           list_lexicons[c("GI_en")])
valIn <- list_valence_shifters[["en"]]
l2 <- sento_lexicons(lexIn)
l3 <- sento_lexicons(lexIn, valIn)
l4 <- sento_lexicons(lexIn, valIn[, c("x", "y")], do.split = TRUE)
l5 <- sento_lexicons(lexIn, valIn[, c("x", "t")], do.split = TRUE)
l6 <- l5[c("GI_en_POS", "valence")] # preserves sentolexicons class

## Not run: 
##D # include lexicons from lexicon package
##D lexIn2 <- list(hul = lexicon::hash_sentiment_huliu, joc = lexicon::hash_sentiment_jockers)
##D l7 <- sento_lexicons(c(lexIn, lexIn2), valIn)
## End(Not run)

## Not run: 
##D # faulty extraction, no replacement allowed
##D l5["valence"]
##D l2[0]
##D l3[22]
##D l4[1] <- l2[1]
##D l4[[1]] <- l2[[1]]
##D l4$GI_en_NEG <- l2$myLexicon
## End(Not run)




