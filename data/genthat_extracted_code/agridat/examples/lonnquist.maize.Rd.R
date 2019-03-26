library(agridat)


### Name: lonnquist.maize
### Title: Multi-environment trial of maize, half diallel
### Aliases: lonnquist.maize
### Keywords: datasets

### ** Examples


data(lonnquist.maize)
dat <- lonnquist.maize
dat <- transform(dat,
                 p1=factor(p1,
                   levels=c("C","L","M","H","G","P","B","RM","N","K","R2","K2")),
                 p2=factor(p2,
                   levels=c("C","L","M","H","G","P","B","RM","N","K","R2","K2")))
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield ~ p1*p2, dat, col.regions=redblue,
          main="lonnquist.maize - yield of diallel cross")

# Calculate the F1 means in Lonnquist, table 1
if(require(reshape2)){
  mat <- acast(dat, p1~p2)
  mat[upper.tri(mat)] <- t(mat)[upper.tri(mat)] # make symmetric
  diag(mat) <- NA
  round(rowMeans(mat, na.rm=TRUE),1)
  ##    C     L     M     H     G     P     B    RM     N     K    R2    K2
  ## 94.8  89.2  95.0  96.4  95.3  95.2  97.3  93.7  95.0  94.0  98.9 102.4
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Mohring 2011 used 6 varieties to calculate GCA & SCA
##D   # Matches Table 3, column 2
##D   d2 <- subset(dat, is.element(p1, c("M","H","G","B","K","K2")) &
##D                       is.element(p2, c("M","H","G","B","K","K2")))
##D   d2 <- droplevels(d2)
##D   # asreml4
##D   require(asreml)
##D   m2 <- asreml(yield~ 1, data=d2, random = ~ p1 + and(p2))
##D   require(lucid)
##D   vc(m2)
##D   ##     effect component std.error z.ratio      con
##D   ##  p1!p1.var     3.865     3.774     1   Positive
##D   ## R!variance    15.93      5.817     2.7 Positive
##D   
##D   
##D   # Calculate GCA effects
##D   m3 <- asreml(yield~ p1 + and(p2), data=d2)
##D   coef(m3)$fixed-1.462
##D   # Matches Gardner 1966, Table 5, Griffing method
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Mohring 2011 used 6 varieties to calculate GCA & SCA
##D   # Matches Table 3, column 2
##D   ## d2 <- subset(dat, p1 ##D 
##D   ##                     p2 ##D 
##D   ## d2 <- droplevels(d2)
##D   ## require(asreml4)
##D   ## m2 <- asreml(yield~ 1, data=d2, random = ~ p1 + and(p2))
##D   ## require(lucid)
##D   ## vc(m2)
##D   ## ##     effect component std.error z.ratio      con
##D   ## ##  p1!p1.var     3.865     3.774     1   Positive
##D   ## ## R!variance    15.93      5.817     2.7 Positive
##D   
##D   
##D   ## # Calculate GCA effects
##D   ## m3 <- asreml(yield~ p1 + and(p2), data=d2)
##D   ## coef(m3)$fixed-1.462
##D   ## # Matches Gardner 1966, Table 5, Griffing method
## End(Not run)

# ----------------------------------------------------------------------------




