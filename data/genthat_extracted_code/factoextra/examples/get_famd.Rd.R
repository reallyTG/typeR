library(factoextra)


### Name: get_famd
### Title: Extract the results for individuals and variables - FAMD
### Aliases: get_famd get_famd_ind get_famd_var

### ** Examples


 # Compute FAMD
 library("FactoMineR")
 data(wine)
 res.famd <- FAMD(wine[,c(1,2, 16, 22, 29, 28, 30,31)], graph = FALSE)
 
 # Extract the results for qualitative variable categories
 quali.var <- get_famd_var(res.famd, "quali.var")
 print(quali.var)
 head(quali.var$coord) # coordinates of qualitative variables
 
 # Extract the results for quantitative variables
 quanti.var <- get_famd_var(res.famd, "quanti.var")
 print(quanti.var)
 head(quanti.var$coord) # coordinates
 
 # Extract the results for individuals
 ind <- get_famd_ind(res.famd)
 print(ind)
 head(ind$coord) # coordinates of individuals
 
 



