library(sperrorest)


### Name: as.represampling
### Title: Resampling objects with repetition, i.e. sets of partitionings
###   or boostrap samples
### Aliases: as.represampling represampling as.represampling_list
###   as.represampling.list print.represampling is_represampling

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador
# Partitioning by elevation classes in 200 m steps:
fac <- factor( as.character( floor( ecuador$dem / 300 ) ) )
summary(fac)
parti <- as.resampling(fac)
# a list of lists specifying sets of training and test sets,
# using each factor at a time as the test set:
str(parti)
summary(parti)



