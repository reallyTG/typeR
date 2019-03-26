library(agridat)


### Name: butron.maize
### Title: Multi-environment trial of maize with pedigrees
### Aliases: butron.maize
### Keywords: datasets

### ** Examples


data(butron.maize)
dat <- butron.maize

# ----------------------------------------------------------------------------

if(require(reshape2)){
  mat <- acast(dat, gen~env, value.var='yield')
  mat <- sweep(mat, 2, colMeans(mat))
  mat.svd <- svd(mat)
  # Calculate PC1 and PC2 scores as in Table 4 of Butron
  # Comment out to keep Rcmd check from choking on '%*%'
  # round(mat.svd$u[,1:2] %*% diag(sqrt(mat.svd$d[1:2])) %*% diag(c(-1,1)),3)
  
  biplot(princomp(mat), main="butron.maize", cex=.7) # Figure 1 of Butron
}

# ----------------------------------------------------------------------------

## Not run: 
##D   
##D   # Here we see if including pedigree information is helpful for a
##D   # multi-environment model
##D   # Including the pedigree provided little benefit
##D 
##D   # Create the pedigree
##D   ped <- dat[, c('gen','male','female')]
##D   ped <- ped[!duplicated(ped),] # remove duplicates
##D   unip <- unique(c(ped$male, ped$female)) # Unique parents
##D   unip <- unip[!is.na(unip)]
##D   # We have to define parents at the TOP of the pedigree
##D   ped <- rbind(data.frame(gen=c("Dent","Flint"), # genetic groups
##D                           male=c(0,0),
##D                           female=c(0,0)),
##D                data.frame(gen=c("A509","A637","A661","CM105","EP28",
##D                                 "EP31","EP42","F7","PB60","Z77016"),
##D                           male=rep(c('Dent','Flint'),each=5),
##D                           female=rep(c('Dent','Flint'),each=5)),
##D                ped)
##D   ped[is.na(ped$male),'male'] <- 0
##D   ped[is.na(ped$female),'female'] <- 0
##D 
##D   # View the pedigree.  Can't use kinship2 ... plants can be both male/female
##D   # Not the best view...too much overplotting
##D   require(synbreed)
##D   pe <- with(ped[1:57,], create.pedigree(gen, male, female, gener=NULL))
##D   # windows(9,6)
##D   synbreed::plot.pedigree(pe, vertex.size=10, vertex.label.cex=.5, asp=.5) #
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   ped.ainv <- asreml.Ainverse(ped)$ginv
##D 
##D   m0 <- asreml(yield ~ 1+env, random = ~ gen, data=dat)
##D   m1 <- asreml(yield ~ 1+env, random = ~ ped(gen), ginverse=list(gen=ped.ainv), data=dat)
##D   m2 <- update(m1, random = ~ id(env):ped(gen))
##D   m3 <- update(m2, random = ~ diag(env):ped(gen))
##D   m4 <- update(m3, random = ~ fa(env,1):ped(gen))
##D   ## AIC(m0,m1,m2,m3,m4)
##D   ##    df      AIC
##D   ## m0  2 229.4037
##D   ## m1  2 213.2487
##D   ## m2  2 290.6156
##D   ## m3  6 296.8061
##D   ## m4 11 218.1568
##D 
##D   p0 <- predict(m0, data=dat, classify="gen")$pred$pvals
##D   p4 <- predict(m4, data=dat, classify="gen")$pred$pvals
##D   p4par <- p4[1:12,]   # parents
##D   p4 <- p4[-c(1:12),]  # hybrids
##D   # Careful!  Need to manually sort the predictions
##D   p0 <- p0[order(as.character(p0$gen)),]
##D   p4 <- p4[order(as.character(p4$gen)),]
##D 
##D   # lims <- range(c(p0$pred, p4$pred)) * c(.95,1.05)
##D   lims <- c(6,8.25) # zoom in on the higher-yielding hybrids
##D   plot(p0$predicted.value, p4$predicted.value,
##D        pch="", xlim=lims, ylim=lims, main="butron.maize",
##D        xlab="BLUP w/o pedigree", ylab="BLUP with pedigree")
##D   abline(0,1,col="lightgray")
##D   text(x=p0$predicted.value, y=p4$predicted.value, p0$gen, cex=.5, srt=-45)
##D   text(x=min(lims), y=p4par$predicted.value, p4par$gen, cex=.5)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D ##   require(asreml4)
##D ##   ped.ainv <- ainverse(ped)
##D 
##D ## if(FALSE){
##D ##   # asreml4 does not use ginverse
##D ##   m0 <- asreml(yield ~ 1+env, data=dat, random = ~ gen)
##D ##   m1 <- asreml(yield ~ 1+env, random = ~ ped(gen), ginverse=list(gen=ped.ainv), data=dat)
##D ##   m2 <- update(m1, random = ~ id(env):ped(gen))
##D ##   m3 <- update(m2, random = ~ diag(env):ped(gen))
##D ##   m4 <- update(m3, random = ~ fa(env,1):ped(gen))
##D ##   ## AIC(m0,m1,m2,m3,m4)
##D ##   ##    df      AIC
##D ##   ## m0  2 229.4037
##D ##   ## m1  2 213.2487
##D ##   ## m2  2 290.6156
##D ##   ## m3  6 296.8061
##D ##   ## m4 11 218.1568
##D 
##D ##   p0 <- predict(m0, data=dat, classify="gen")$pred$pvals
##D ##   p4 <- predict(m4, data=dat, classify="gen")$pred$pvals
##D ##   p4par <- p4[1:12,]   # parents
##D ##   p4 <- p4[-c(1:12),]  # hybrids
##D ##   # Careful!  Need to manually sort the predictions
##D ##   p0 <- p0[order(as.character(p0$gen)),]
##D ##   p4 <- p4[order(as.character(p4$gen)),]
##D 
##D ##   # lims <- range(c(p0$pred, p4$pred)) * c(.95,1.05)
##D ##   lims <- c(6,8.25) # zoom in on the higher-yielding hybrids
##D ##   plot(p0$predicted.value, p4$predicted.value,
##D ##        pch="", xlim=lims, ylim=lims, main="butron.maize",
##D ##        xlab="BLUP w/o pedigree", ylab="BLUP with pedigree")
##D ##   abline(0,1,col="lightgray")
##D ##   text(x=p0$predicted.value, y=p4$predicted.value, p0$gen, cex=.5, srt=-45)
##D ##   text(x=min(lims), y=p4par$predicted.value, p4par$gen, cex=.5)
##D ##   # Including the pedigree provided little benefit
##D ## } # if(FALSE)
##D 
## End(Not run) # dontrun




