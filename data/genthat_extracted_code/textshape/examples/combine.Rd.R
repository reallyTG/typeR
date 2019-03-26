library(textshape)


### Name: combine
### Title: Combine Elements
### Aliases: combine combine.default combine.data.frame

### ** Examples

(x <- split_token(DATA[["state"]][1], FALSE))
combine(x)

(x2 <- split_token(DATA[["state"]], FALSE))
combine(x2)

(x3 <- split_sentence(DATA))

## without dropping the non-group variable column
combine(x3)

## Dropping the non-group variable column
combine(x3[, 1:5, with=FALSE])



