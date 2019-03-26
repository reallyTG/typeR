library(Tmisc)


### Name: unfactor
### Title: Unfactor a data.frame
### Aliases: unfactor
### Keywords: NA

### ** Examples

df <- data.frame(a = letters[1:5], x = 1:5, y = LETTERS[1:5], stringsAsFactors = TRUE)
str(df)
df <- unfactor(df)
str(df)
  



