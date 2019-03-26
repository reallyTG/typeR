library(PASWR2)


### Name: DROSOPHILA
### Title: Drosophila Melanogaster
### Aliases: DROSOPHILA
### Keywords: datasets

### ** Examples

ggplot(data = DROSOPHILA, aes(x = reorder(line, fecundity, FUN = median),  
y = fecundity, fill = line)) + geom_boxplot() + guides(fill = FALSE) + 
labs(y ="number of eggs laid per female \n per day for the first 14 days of life", 
x = "") + scale_fill_brewer()
ggplot(data = DROSOPHILA, aes(x = reorder(line, fecundity, FUN = median), 
y = fecundity, fill = line)) + geom_violin() + guides(fill = FALSE) + 
labs(y ="number of eggs laid per female \n per day for the first 14 days of life", 
x = "") + scale_fill_brewer()
summary(aov(fecundity ~ line, data = DROSOPHILA))



