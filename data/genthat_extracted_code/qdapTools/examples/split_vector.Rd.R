library(qdapTools)


### Name: split_vector
### Title: Split a Vector By Split Points
### Aliases: split_vector

### ** Examples

set.seed(15)
x <- sample(c("", LETTERS[1:10]), 25, TRUE, prob=c(.2, rep(.08, 10)))

split_vector(x)
split_vector(x, "C")
split_vector(x, c("", "C"))

split_vector(x, include = 0)
split_vector(x, include = 1)
split_vector(x, include = 2)

set.seed(15)
x <- sample(1:11, 25, TRUE, prob=c(.2, rep(.08, 10)))
split_vector(x, 1)

## relationship to `loc_split`
all.equal(
    split_vector(x, include = 1),
    loc_split(x, which(x == ""), names=1:6)
)



