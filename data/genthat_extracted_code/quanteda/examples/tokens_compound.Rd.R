library(quanteda)


### Name: tokens_compound
### Title: Convert token sequences into compound tokens
### Aliases: tokens_compound

### ** Examples

mytexts <- c("The new law included a capital gains tax, and an inheritance tax.",
             "New York City has raised taxes: an income tax and inheritance taxes.")
mytoks <- tokens(mytexts, remove_punct = TRUE)

# for lists of sequence elements
myseqs <- list(c("tax"), c("income", "tax"), c("capital", "gains", "tax"), c("inheritance", "tax"))
(cw <- tokens_compound(mytoks, myseqs))
dfm(cw)

# when used as a dictionary for dfm creation
mydict1 <- dictionary(list(tax=c("tax", "income tax", "capital gains tax", "inheritance tax*")))
(cw2 <- tokens_compound(mytoks, mydict1))

# to pick up "taxes" in the second text, set valuetype = "regex"
(cw3 <- tokens_compound(mytoks, mydict1, valuetype = "regex"))

# dictionaries w/glob matches
mydict2 <- dictionary(list(negative = c("bad* word*", "negative", "awful text"),
                          positive = c("good stuff", "like? th??")))
toks <- tokens(c(txt1 = "I liked this, when we can use bad words, in awful text.",
                 txt2 = "Some damn good stuff, like the text, she likes that too."))
tokens_compound(toks, mydict2)

# with collocations
cols <- 
    textstat_collocations(tokens("capital gains taxes are worse than inheritance taxes"), 
                                  size = 2, min_count = 1)
toks <- tokens("The new law included capital gains taxes and inheritance taxes.")
tokens_compound(toks, cols)



