library(syuzhet)


### Name: get_dct_transform
### Title: Discrete Cosine Transformation with Reverse Transform.
### Aliases: get_dct_transform

### ** Examples

s_v <- get_sentences("I begin this story with a neutral statement.
Now I add a statement about how much I despise cats.  
I am allergic to them. I hate them. Basically this is a very silly test. But I do love dogs!")
raw_values <- get_sentiment(s_v, method = "syuzhet")
dct_vals <- get_dct_transform(raw_values)
plot(dct_vals, type="l", ylim=c(-0.1,.1))



