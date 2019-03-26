library(NBDdirichlet)


### Name: print.dirichlet
### Title: Print Dirichlet model information
### Aliases: print.dirichlet
### Keywords: methods

### ** Examples

cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
print(dobj)  # YOU WILL SEE THE FOLLOWING:

# Number of Brands in the Category = 8 
# Brand List : Colgate DC : Macleans : Close Up : Signal : ultrabrite :
#              Gibbs SR : Boots Priv. Label : Sainsbury Priv. Lab.
# Brands' Market Shares: 0.25 0.19 0.1 0.1 0.09 0.08 0.03 0.02 
# Brands' Penetration:   0.2 0.17 0.09 0.08 0.08 0.07 0.03 0.02 
# Multiple of Base Time Period: 1 , Current M = 1.456 

# Channel Penetration = 0.56 , with Shopping Rate = 2.6 
# Estimated Dirichlet Model Parameters:
# NBD: M = 1.46 ,  K = 0.78 ;  Dirichlet: S = 1.55 



