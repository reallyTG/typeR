library(NBDdirichlet)


### Name: summary.dirichlet
### Title: Theoretical summary statistics from the Dirichlet model.
### Aliases: summary.dirichlet
### Keywords: methods

### ** Examples

cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)

## Not run: summary(dobj)
summary(dobj, t=4, type="freq")
summary(dobj, t=4, type="heavy", heavy.limit=c(7:50))
summary(dobj, t=1, type="dup", dup.brand=2)



