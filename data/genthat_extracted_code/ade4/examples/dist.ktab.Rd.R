library(ade4)


### Name: dist.ktab
### Title: Mixed-variables coefficient of distance
### Aliases: dist.ktab prep.binary prep.circular prep.fuzzy ldist.ktab
###   kdist.cor
### Keywords: multivariate

### ** Examples

# With fuzzy variables
data(bsetal97)

w <- prep.fuzzy(bsetal97$biol, bsetal97$biol.blo)
w[1:6, 1:10]
ktab1 <- ktab.list.df(list(w))
dis <- dist.ktab(ktab1, type = "F")
as.matrix(dis)[1:5, 1:5]

## Not run: 
##D # With ratio-scale and multichoice variables
##D data(ecomor)
##D 
##D wM <- log(ecomor$morpho + 1) # Quantitative variables
##D wD <- ecomor$diet
##D # wD is a data frame containing a multichoice nominal variable
##D # (diet habit), with 8 modalities (Granivorous, etc)
##D # We must prepare it by prep.binary
##D head(wD)
##D wD <- prep.binary(wD, col.blocks = 8, label = "diet")
##D wF <- ecomor$forsub
##D # wF is also a data frame containing a multichoice nominal variable
##D # (foraging substrat), with 6 modalities (Foliage, etc)
##D # We must prepare it by prep.binary
##D head(wF)
##D wF <- prep.binary(wF, col.blocks = 6, label = "foraging")
##D # Another possibility is to combine the two last data frames wD and wF as
##D # they contain the same type of variables
##D wB <- cbind.data.frame(ecomor$diet, ecomor$forsub)
##D head(wB)
##D wB <- prep.binary(wB, col.blocks = c(8, 6), label = c("diet", "foraging"))
##D # The results given by the two alternatives are identical
##D ktab2 <- ktab.list.df(list(wM, wD, wF))
##D disecomor <- dist.ktab(ktab2, type= c("Q", "B", "B"))
##D as.matrix(disecomor)[1:5, 1:5]
##D contrib2 <- kdist.cor(ktab2, type= c("Q", "B", "B"))
##D contrib2
##D 
##D ktab3 <- ktab.list.df(list(wM, wB))
##D disecomor2 <- dist.ktab(ktab3, type= c("Q", "B"))
##D as.matrix(disecomor2)[1:5, 1:5]
##D contrib3 <- kdist.cor(ktab3, type= c("Q", "B"))
##D contrib3
##D 
##D # With a range of variables
##D data(woangers)
##D 
##D traits <- woangers$traits
##D # Nominal variables 'li', 'pr', 'lp' and 'le'
##D # (see table 1 in the main text for the codes of the variables)
##D tabN <- traits[,c(1:2, 7, 8)]
##D # Circular variable 'fo'
##D tabC <- traits[3]
##D tabCp <- prep.circular(tabC, 1, 12)
##D # The levels of the variable lie between 1 (January) and 12 (December).
##D # Ordinal variables 'he', 'ae' and 'un'
##D tabO <- traits[, 4:6]
##D # Fuzzy variables 'mp', 'pe' and 'di'
##D tabF <- traits[, 9:19]
##D tabFp <- prep.fuzzy(tabF, c(3, 3, 5), labels = c("mp", "pe", "di"))
##D # 'mp' has 3 levels, 'pe' has 3 levels and 'di' has 5 levels.
##D # Quantitative variables 'lo' and 'lf'
##D tabQ <- traits[, 20:21]
##D ktab1 <- ktab.list.df(list(tabN, tabCp, tabO, tabFp, tabQ))
##D distrait <- dist.ktab(ktab1, c("N", "C", "O", "F", "Q"))
##D is.euclid(distrait)
##D contrib <- kdist.cor(ktab1, type = c("N", "C", "O", "F", "Q"))
##D contrib
##D dotchart(sort(contrib$glocor), labels = rownames(contrib$glocor)[order(contrib$glocor[, 1])])
## End(Not run)



