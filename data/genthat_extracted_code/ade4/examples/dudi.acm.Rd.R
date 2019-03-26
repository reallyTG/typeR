library(ade4)


### Name: dudi.acm
### Title: Multiple Correspondence Analysis
### Aliases: dudi.acm acm.burt acm.disjonctif boxplot.acm
### Keywords: multivariate

### ** Examples

data(ours)
summary(ours)

if(adegraphicsLoaded()) {
  g1 <- s1d.boxplot(dudi.acm(ours, scan = FALSE)$li[, 1], ours)
} else {
  boxplot(dudi.acm(ours, scan = FALSE))
}
## Not run: 
##D data(banque)
##D banque.acm <- dudi.acm(banque, scann = FALSE, nf = 3)
##D 
##D if(adegraphicsLoaded()) {
##D   g2 <- adegraphics:::scatter.dudi(banque.acm)
##D } else {
##D   scatter(banque.acm)
##D }  
##D 
##D apply(banque.acm$cr, 2, mean)
##D banque.acm$eig[1:banque.acm$nf] # the same thing
##D 
##D if(adegraphicsLoaded()) {
##D   g3 <- s1d.boxplot(banque.acm$li[, 1], banque)
##D   g4 <- scatter(banque.acm)
##D } else {
##D   boxplot(banque.acm)
##D   scatter(banque.acm)
##D }
##D 
##D 
##D s.value(banque.acm$li, banque.acm$li[,3])
##D 
##D bb <- acm.burt(banque, banque)
##D bbcoa <- dudi.coa(bb, scann = FALSE)
##D plot(banque.acm$c1[,1], bbcoa$c1[,1])
##D # mca and coa of Burt table. Lebart & coll. section 1.4
##D 
##D bd <- acm.disjonctif(banque)
##D bdcoa <- dudi.coa(bd, scann = FALSE)
##D plot(banque.acm$li[,1], bdcoa$li[,1]) 
##D # mca and coa of disjonctive table. Lebart & coll. section 1.4
##D plot(banque.acm$co[,1], dudi.coa(bd, scann = FALSE)$co[,1]) 
## End(Not run)


