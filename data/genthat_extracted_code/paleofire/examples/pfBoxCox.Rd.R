library(paleofire)


### Name: pfBoxCox
### Title: Box-Cox transformation of Charcoal series
### Aliases: pfBoxCox

### ** Examples


# Select a site
ID=pfSiteSel(site_name=="Pas-de-Fond")

# Extract data
A=pfExtract(ID)

B=pfBoxCox(A[,4],0.1)
plot(B,type="l")





