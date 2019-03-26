library(GGUM)


### Name: GenData.GGUM
### Title: Generate data from the GUM/GGUM
### Aliases: GenData.GGUM

### ** Examples

gen1 <- GenData.GGUM(500, 10, 5, seed = 456)
gen1$data      # Retrieve the data.
gen1$alpha.gen # The discrimination parameters.

# Generate data based on items varying in the number of observable response categories:
gen2 <- GenData.GGUM(500, 5, c(5, 5, 5, 4, 4), seed = 789)




