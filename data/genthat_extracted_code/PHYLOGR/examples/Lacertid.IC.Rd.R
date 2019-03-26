library(PHYLOGR)


### Name: Lacertid.IC
### Title: Independet contrasts for Bauwens and Diaz-Uriarte (1997)
###   lacertid data set
### Aliases: Lacertid.IC
### Keywords: datasets

### ** Examples

# Obtaining correlations through the origin;
# compare with Table 3 in Bauwens and Diaz-Uriarte (1997).

data(Lacertid.IC)
cor.lacert <- matrix(nrow=7,ncol=7) 
for (i in 1:7) for (j in 1:7)
cor.lacert[i,j] <- cor.origin(Lacertid.IC[[i]],Lacertid.IC[[j]])
cor.lacert




## Not run: 
##D # This data frame can be obtained from the fic data files as:
##D   
##D LacertidIC <- cbind(read.table("ifsmi.fic")[,c(3,4)],
##D                     read.table("ihshw.fic")[,c(3,4)],
##D                     read.table("iclag.fic")[,c(3,4)],
##D                     read.table("icfxx.fic")[,3])
##D stand <- read.table("ifsmi.fic")[,5]
##D LacertidIC <- LacertidIC/stand
##D LacertidIC$contr <- read.table("ifsmi.fic")[,1]
##D names(LacertidIC) <- c("svl","svl.matur", "hatsvl", "hatweight",
##D                       "clutch.size", "age.mat","cl.freq","contr")
## End(Not run)






