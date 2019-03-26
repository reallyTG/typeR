library(sommer)


### Name: DT_wheat
### Title: wheat lines dataset
### Aliases: DT_wheat
### Keywords: datasets

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####

# data(DT_wheat)
# DT <- as.data.frame(DT);colnames(DT) <- paste0("x",1:4);DT$line <- rownames(DT); 
# rownames(GT) <- DT$line
# K <- A.mat(GT) # additive relationship matrix
# K[1:4,1:4]
####=========================================####
####=========================================####
#### using formula based 'mmer2'
####=========================================####
####=========================================####
# head(DT)
# #### univariate
# mix0 <- mmer(x1~1,
#              random = ~vs(line,Gu=K),
#              rcov=~vs(units), 
#              data=DT)




