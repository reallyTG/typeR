library(adiv)


### Name: EqRao
### Title: Apportionment of Diversity
### Aliases: EqRS EqRSintra EqRao wapqe rtestEqRS rtestEqRSintra rtestEqRao
###   rtestwapqe
### Keywords: models

### ** Examples

data(macroloire, package="ade4")

# Taxonomic dissimilarities among species:
dTaxo <- dist.taxo(macroloire$taxo)^2/2
dTaxo <- dTaxo/max(dTaxo)
# Size-based dissimilarities among species
dSize <- dist.prop(macroloire$traits[ ,1:4], method = 2)
# Dissimilarities among species in terms of feeding categories
dFeed <- dist.prop(macroloire$traits[ ,5:11], method = 2)
# Dissimilarities among species in terms of 
# both size and feeding categories
dSF <- (dSize+dFeed)/2

# Table with sites as rows (stations), 
# species as columns and abundances as entries
ab <- as.data.frame(t(macroloire$fau))
# Table with sites as rows and one column only. 
# Entries indicate the geological region associated 
# with each site
stru <- macroloire$envir["Morphoregion"]

EqRao(ab, , stru, option="eq")
EqRao(ab, dTaxo, stru, formula = "QE", option="eq")
EqRao(ab, dSize, stru, formula = "QE", option="eq")
EqRao(ab, dFeed, stru, formula = "QE", option="eq")
EqRao(ab, dSF, stru, formula = "QE", option="eq")

EqRao(ab, , stru, option="normed2")
EqRao(ab, dTaxo, stru, formula = "QE", option="normed2")
EqRao(ab, dSize, stru, formula = "QE", option="normed2")
EqRao(ab, dFeed, stru, formula = "QE", option="normed2")
EqRao(ab, dSF, stru, formula = "QE", option="normed2")

## Not run: 
##D # Tests for dissimilarities among sites within regions:
##D 
##D rb1_GS <- rtestEqRao(ab, , stru, level=1, nrep=999, option="normed2")
##D rb1_GS
##D plot(rb1_GS)
##D rb1_Taxo <- rtestEqRao(ab, dTaxo, stru, formula = "QE", 
##D level=1, nrep=999, option="normed2")
##D rb1_Taxo
##D plot(rb1_Taxo)
##D rb1_Size <- rtestEqRao(ab, dSize, stru, formula = "QE", 
##D level=1, nrep=999, option="normed2")
##D rb1_Size
##D plot(rb1_Size)
##D rb1_Feed <- rtestEqRao(ab, dFeed, stru, formula = "QE", 
##D level=1, nrep=999, option="normed2")
##D rb1_Feed
##D plot(rb1_Feed)
##D rb1_SF <- rtestEqRao(ab, dSF, stru, formula = "QE", 
##D level=1, nrep=999, option="normed2")
##D rb1_SF
##D plot(rb1_SF)
##D 
##D # Tests for dissimilarities among regions:
##D 
##D r2_GS <- rtestEqRao(ab, , stru, level=2, nrep=999, option="normed2")
##D r2_GS
##D plot(r2_GS)
##D r2_Taxo <- rtestEqRao(ab, dTaxo, stru, formula = "QE", 
##D level=2, nrep=999, option="normed2")
##D r2_Taxo
##D plot(r2_Taxo)
##D r2_Size <- rtestEqRao(ab, dSize, stru, formula = "QE", 
##D level=2, nrep=999, option="normed2", w="even")
##D r2_Size
##D plot(r2_Size)
##D r2_Feed <- rtestEqRao(ab, dFeed, stru, formula = "QE", 
##D level=2, nrep=999, option="normed2", w="even")
##D r2_Feed
##D plot(r2_Feed)
##D r2_SF <- rtestEqRao(ab, dSF, stru, formula = "QE", 
##D level=2, nrep=999, option="normed2", w="even")
##D r2_SF
##D plot(r2_SF)
## End(Not run)



