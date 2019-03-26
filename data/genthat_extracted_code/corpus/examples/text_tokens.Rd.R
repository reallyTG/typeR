library(corpus)


### Name: text_tokens
### Title: Text Tokenization
### Aliases: text_ntoken text_tokens

### ** Examples

text_tokens("The quick ('brown') fox can't jump 32.3 feet, right?")

# count tokens:
text_ntoken("The quick ('brown') fox can't jump 32.3 feet, right?")

# don't change case or quotes:
f <- text_filter(map_case = FALSE, map_quote = FALSE)
text_tokens("The quick ('brown') fox can't jump 32.3 feet, right?", f)

# drop common function words ('stop' words):
text_tokens("Able was I ere I saw Elba.",
            text_filter(drop = stopwords_en))

# drop numbers, with some exceptions:"
text_tokens("0, 1, 2, 3, 4, 5",
            text_filter(drop_number = TRUE,
                        drop_except = c("0", "2", "4")))

# apply stemming...
text_tokens("Mary is running", text_filter(stemmer = "english"))

# ...except for certain words
text_tokens("Mary is running",
            text_filter(stemmer = "english", stem_except = "mary"))

# default tokenization
text_tokens("Ms. Jones")

# combine abbreviations
text_tokens("Ms. Jones", text_filter(combine = abbreviations_en))

# add custom combinations
text_tokens("Ms. Jones is from New York City, New York.",
            text_filter(combine = c(abbreviations_en,
                                    "new york", "new york city")))



