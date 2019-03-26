library(syuzhet)


### Name: get_transformed_values
### Title: Fourier Transform and Reverse Transform Values
### Aliases: get_transformed_values

### ** Examples

s_v <- get_sentences("I begin this story with a neutral statement. 
Now I add a statement about how much I despise cats. 
I am allergic to them. 
Basically this is a very silly test.")
raw_values <- get_sentiment(s_v, method = "bing")
get_transformed_values(raw_values)



