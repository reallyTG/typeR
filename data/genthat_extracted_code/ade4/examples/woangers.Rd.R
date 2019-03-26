library(ade4)


### Name: woangers
### Title: Plant assemblages in woodlands of the conurbation of Angers
###   (France)
### Aliases: woangers
### Keywords: datasets

### ** Examples

# Loading the data
data(woangers)

# Preparating of the traits
traits <- woangers$traits
# Nominal variables 'li', 'pr', 'lp' and 'le'
# (see table 1 in the main text for the codes of the variables)
tabN <- traits[, c(1:2, 7, 8)]
# Circular variable 'fo'
tabC <- traits[3]
tabCp <- prep.circular(tabC, 1, 12)
# The levels of the variable lie between 1 (January) and 12 (December).
# Ordinal variables 'he', 'ae' and 'un'
tabO <- traits[, 4:6]
# Fuzzy variables 'mp', 'pe' and 'di'
tabF <- traits[, 9:19]
tabFp <- prep.fuzzy(tabF, c(3, 3, 5), labels = c("mp", "pe", "di"))
# 'mp' has 3 levels, 'pe' has 3 levels and 'di' has 5 levels.
# Quantitative variables 'lo' and 'lf'
tabQ <- traits[, 20:21]

# Combining the traits
ktab1 <- ktab.list.df(list(tabN, tabCp, tabO, tabFp, tabQ))
## Not run: 
##D # Calculating the distances for all traits combined
##D distrait <- dist.ktab(ktab1, c("N", "C", "O", "F", "Q"))
##D is.euclid(distrait)
##D 
##D # Calculating the contribution of each trait in the combined distances
##D contrib <- kdist.cor(ktab1, type = c("N", "C", "O", "F", "Q"))
##D contrib
##D dotchart(sort(contrib$glocor), labels = rownames(contrib$glocor)[order(contrib$glocor[, 1])])
## End(Not run)



