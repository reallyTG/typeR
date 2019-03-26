library(NBDdirichlet)


### Name: dirichlet
### Title: Estimation of the Dirichlet model
### Aliases: dirichlet
### Keywords: models

### ** Examples

# The following data comes from the example in section 3 of
# the reference paper.  They are Toothpaste purchase data in UK
# in 1st quarter of 1973 from the AGB panel (5240 static panelists).

cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
print(dobj)



