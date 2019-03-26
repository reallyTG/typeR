library(rtext)


### Name: rtext
### Title: R6 class - linking text and data
### Aliases: rtext
### Keywords: data

### ** Examples


# initialize (with text or file)
quote_text <-
"Outside of a dog, a book is man's best friend. Inside of a dog it's too dark to read."
quote <- rtext$new(text = quote_text)

# add some data
quote$char_data_set("first", 1, TRUE)
quote$char_data_set("last", quote$char_length(), TRUE)

# get the data
quote$char_data_get()

# transform text
quote$char_add("[this is an insertion] \n", 47)

# get the data again (see, the data moved along with the text)
quote$text_get()
quote$char_data_get()

# do some convenience coding (via regular expressions)
quote$char_data_set_regex("dog_friend", "dog", "dog")
quote$char_data_set_regex("dog_friend", "friend", "friend")
quote$char_data_get()

# aggregate data by regex pattern
quote$tokenize_data_regex(split="(dog)|(friend)", non_token = TRUE, join = "full")

# aggregate data by words
quote$tokenize_data_words(non_token = TRUE, join="full")

# aggregate data by lines
quote$tokenize_data_lines()

# plotting and data highlighting
plot(quote, "dog_friend")

# adding further data to the plot
plot(quote, "dog_friend")
plot(quote, "first", col="steelblue", add=TRUE)
plot(quote, "last", col="steelblue", add=TRUE)




