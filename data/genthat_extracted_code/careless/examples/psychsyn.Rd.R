library(careless)


### Name: psychsyn
### Title: Computes the psychometric synonym/antonym score
### Aliases: psychsyn

### ** Examples

synonyms <- psychsyn(careless_dataset, .60)
antonyms <- psychsyn(careless_dataset2, .50, anto = TRUE)
antonyms <- psychant(careless_dataset2, .50)

#with diagnostics
synonyms <- psychsyn(careless_dataset, .60, diag = TRUE)
antonyms <- psychant(careless_dataset2, .50, diag = TRUE)



