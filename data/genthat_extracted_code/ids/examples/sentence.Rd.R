library(ids)


### Name: sentence
### Title: Sentence style identifiers
### Aliases: sentence

### ** Examples

# Generate an identifier
sentence()

# Generate a bunch
sentence(10)

# As with adjective_animal, use "style" to control punctuation
sentence(style = "Camel")
sentence(style = "dot")
sentence(style = "Title")

# Change the tense of the verb:
set.seed(1)
sentence()
set.seed(1)
sentence(past = TRUE)

# Pass n = NULL to bind arguments to a function
id <- sentence(NULL, past = TRUE, style = "dot")
id()
id(10)



