library(magrittr)


### Name: %T>%
### Title: magrittr tee operator
### Aliases: %T>%

### ** Examples

rnorm(200) %>%
matrix(ncol = 2) %T>%
plot %>% # plot usually does not return anything.
colSums



