library(monkeylearn)


### Name: monkey_classify
### Title: Monkeylearn classify from a dataframe column or vector of texts
### Aliases: monkey_classify

### ** Examples

## Not run: 
##D text1 <- "Hauràs de dirigir-te al punt de trobada del grup al que et vulguis unir."
##D text2 <- "i want to buy an iphone"
##D text3 <- "Je déteste ne plus avoir de dentifrice."
##D text_4 <- "I hate not having any toothpaste."
##D request_df <- tibble::as_tibble(list(txt = c(text1, text2, text3, text_4)))
##D monkey_classify(request_df, txt, texts_per_req = 2, unnest = TRUE)
##D attr(output, "headers")
## End(Not run)




