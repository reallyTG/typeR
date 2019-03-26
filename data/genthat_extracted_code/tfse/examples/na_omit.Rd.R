library(tfse)


### Name: na_omit
### Title: Omit missing values/rows
### Aliases: na_omit

### ** Examples


## generate data
df <- data.frame(
  a = I(list(c(1, 2), c(NA_integer_, NA_integer_), c(1, 2))),
  b = c("a", NA_character_, "c"),
  c = c(1.1243, NA_real_, -1.234134)
)

## data frame
na_omit(df)

## matrix
na_omit(as.matrix(df))

## list
na_omit(apply(df, 1, c))

## atomic vector
na_omit(df$b)




