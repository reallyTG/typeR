library(neuropsychology)


### Name: specific_correlations
### Title: Correlations Pairs According to Condition
### Aliases: specific_correlations

### ** Examples

require(neuropsychology)

cor <- cor(na.omit(select_numeric(personality)))
specific_correlations(cor, treshold=0.2)



