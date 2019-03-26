library(corpus)


### Name: text_filter
### Title: Text Filters
### Aliases: corpus_text_filter text_filter text_filter.corpus_text
###   text_filter.data.frame text_filter.default text_filter<-
###   text_filter<-.corpus_text text_filter<-.data.frame
###   text_filter<-.default

### ** Examples

# text filter with default options set
text_filter()

# specify some options but leave others unchanged
f <- text_filter(map_case = FALSE, drop = stopwords_en)

# set the text filter property
x <- as_corpus_text(c("Marnie the Dog is #1 on the internet."))
text_filter(x) <- f
text_tokens(x) # by default, uses x's text_filter to tokenize

# change a filter property
f2 <- text_filter(x, map_case = TRUE)
# equivalent to:
# f2 <- text_filter(x)
# f2$map_case <- TRUE

text_tokens(x, f2) # override text_filter(x)

# setting text_filter on a data frame is allowed if it has a
# column names "text" of type "corpus_text"
d <- data.frame(text = x)
text_filter(d) <- f2
text_tokens(d)

# but you can't set text filters on character objects
y <- "hello world"
## Not run: text_filter(y) <- f2 # gives an error

d2 <- data.frame(text = "hello world", stringsAsFactors = FALSE)
## Not run: text_filter(d2) <- f2 # gives an error



