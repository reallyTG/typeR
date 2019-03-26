library(cellranger)


### Name: anchored
### Title: Specify cell limits via an anchor cell
### Aliases: anchored

### ** Examples

anchored()
as.range(anchored())
dim(anchored())

anchored("Q24")
as.range(anchored("Q24"))
dim(anchored("Q24"))

anchored(anchor = "R4C2", dim = c(8, 2))
as.range(anchored(anchor = "R4C2", dim = c(8, 2)))
as.range(anchored(anchor = "R4C2", dim = c(8, 2)), fo = "A1")
dim(anchored(anchor = "R4C2", dim = c(8, 2)))

(input <- head(iris))
anchored(input = input)
as.range(anchored(input = input))
dim(anchored(input = input))

anchored(input = input, col_names = FALSE)
as.range(anchored(input = input, col_names = FALSE))
dim(anchored(input = input, col_names = FALSE))

(input <- LETTERS[1:8])
anchored(input = input)
as.range(anchored(input = input))
dim(anchored(input = input))

anchored(input = input, byrow = TRUE)
as.range(anchored(input = input, byrow = TRUE))
dim(anchored(input = input, byrow = TRUE))




