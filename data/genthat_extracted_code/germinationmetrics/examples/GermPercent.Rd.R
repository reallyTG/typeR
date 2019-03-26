library(germinationmetrics)


### Name: GermPercent
### Title: Germination percentage
### Aliases: GermPercent

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)

# From partial germination counts
GermPercent(germ.counts = x, total.seeds = 50)

# From cumulative germination counts
GermPercent(germ.counts = y, total.seeds = 50, partial = FALSE)

# From number of germinated seeds
GermPercent(germinated.seeds = 40, total.seeds = 50)




