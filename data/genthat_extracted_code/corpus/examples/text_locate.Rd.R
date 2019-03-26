library(corpus)


### Name: text_locate
### Title: Searching for Terms
### Aliases: text_count text_detect text_locate text_match text_sample
###   text_subset

### ** Examples

text <- c("Rose is a rose is a rose is a rose.",
          "A rose by any other name would smell as sweet.",
          "Snow White and Rose Red")

text_count(text, "rose")
text_detect(text, "rose")
text_locate(text, "rose")
text_match(text, "rose")
text_sample(text, "rose", 3)
text_subset(text, "a rose")

# search for multiple terms
text_locate(text, c("rose", "rose red", "snow white"))



