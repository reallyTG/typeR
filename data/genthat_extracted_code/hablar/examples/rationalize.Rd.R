library(hablar)


### Name: rationalize
### Title: Only allow rational values in numeric vectors 'rationalize'
###   transforms all numeric elements to be rational values or NA, thus
###   removes all 'NaN,Inf' and replaces them with 'NA'.
### Aliases: rationalize rationalize.default rationalize.numeric
###   rationalize.data.frame

### ** Examples

x <- c(3, -Inf, 6.56, 9.3, NaN, 5, -Inf)
rationalize(x)

df <- data.frame(num_col = c(Inf, 3, NaN), 
                 chr_col = c("a", "b", "c"), 
                 stringsAsFactors = FALSE)
df
rationalize(df)




