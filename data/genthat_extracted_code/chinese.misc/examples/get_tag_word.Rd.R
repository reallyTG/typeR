library(chinese.misc)


### Name: get_tag_word
### Title: Extract Words of Some Certain Tags through Pos-Tagging
### Aliases: get_tag_word

### ** Examples

# No Chinese, so use English instead.
x1 <- c(v = "drink", xdrink = "coffee", v = "drink", xdrink = "cola", v = "eat", xfood = "banana")
x2 <- c(v = "drink", xdrink = "tea", v = "buy", x = "computer")
x <- list(x1, x2)
get_tag_word(x, tag = "v", mycutter = NULL)
get_tag_word(x, tag = "v", mycutter = NULL, only_unique = TRUE)
get_tag_word(x, tag_pattern = "^x", mycutter = NULL)
get_tag_word(x, tag_pattern = "^x", mycutter = NULL, keep_name = TRUE)
get_tag_word(x, tag = "v", mycutter = NULL, each = FALSE)
get_tag_word(x, tag = "v", mycutter = NULL, each = FALSE, only_unique = TRUE)
get_tag_word(x, tag = "v", mycutter = NULL, type = "position")



