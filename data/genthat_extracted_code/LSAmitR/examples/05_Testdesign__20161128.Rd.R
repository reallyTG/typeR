library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  5
### Title: Kapitel 5: Testdesign
### Aliases: 'Kapitel 5'

### ** Examples

library(tensor)
set.seed(1337)

data(datenKapitel05)
dat.ib <- datenKapitel05$tdItembank
dat.bib <- datenKapitel05$tdBib2d
dat.bibPaare <- datenKapitel05$tdBibPaare

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 5.3.2: ATA Methode für das Blockdesign
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 1: Initialisierung
##D #
##D 
##D library(tensor)
##D 
##D nTh <- 30
##D nPos <- 6
##D nBl <- 30
##D inc <- array(0, dim = c(nTh, nPos, nBl))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 2: Startdesign
##D #
##D 
##D for(tt in 1:nTh){
##D   inc[tt, , sample(1:nBl, nPos)] <- diag(1, nPos)
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 3: Zielfunktion
##D #
##D des <- inc
##D desAllePos <- tensor(des, rep(1, nPos), 2, 1)
##D 
##D blockPaarInd <- upper.tri(diag(nrow = nBl))
##D blockPaar <- crossprod(desAllePos)[blockPaarInd]
##D 
##D err.bb <- blockPaar
##D err.bb[blockPaar >= 2] <- blockPaar[blockPaar >= 2] - 2
##D err.bb[blockPaar <= 1] <- 1 - blockPaar[blockPaar <= 1]
##D 
##D objective <- sum(err.bb) / length(err.bb)
##D objWgt <- 2^0
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 4: Studienzuweisung
##D #
##D 
##D blMatching <- seq(6, nBl, 6)
##D 
##D nbStatus <- list(
##D   (desAllePos[1:6, -(1:12)] > 0) / (6 * 18),      # 1
##D   (desAllePos[25:30, -(19:30)] > 0) / (6 * 18),   # 2
##D   (rowSums(desAllePos[, blMatching]) != 1) / nTh  # 3
##D )
##D nbStatus <- unlist(lapply(nbStatus, sum))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 5: Erweiterung Positionsbalancierung
##D #
##D 
##D # 4
##D nbPos <- sum((colSums(des) != 1) / (nPos * nBl))
##D # 5
##D nbPos.pLSA <- list(
##D   (colSums(des[1:6, 1:2, 1:12], dims = 2) != 1) / 12,
##D   (colSums(des[1:6, 3:4, 1:12], dims = 2) != 1) / 12,
##D   (colSums(des[1:6, 5:6, 1:12], dims = 2) != 1) / 12
##D )
##D nbPos.pLSA <- sum(unlist(lapply(nbPos.pLSA, sum)) / 3)
##D # 6
##D nbPos.link <- list(
##D   (colSums(des[25:30, 1:2, 19:30], dims = 2) != 1) / 12,
##D   (colSums(des[25:30, 3:4, 19:30], dims = 2) != 1) / 12,
##D   (colSums(des[25:30, 5:6, 19:30], dims = 2) != 1) / 12
##D )
##D nbPos.link <- sum(unlist(lapply(nbPos.link, sum)) / 3)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 6: Zusammenfügen
##D #
##D 
##D nb <- c(nbStatus, nbPos, nbPos.pLSA, nbPos.link)
##D nbWgt <- c(
##D   rep(2^5, length(nbStatus)),
##D   rep(2^6, length(nbPos)),
##D   rep(2^4, length(nbPos.pLSA)),
##D   rep(2^3, length(nbPos.link))
##D )
##D 
##D nbWgt.norm <- nbWgt / (sum(nbWgt) + objWgt)
##D objWgt.norm <- objWgt / (sum(nbWgt) + objWgt)
##D oDes <- objWgt.norm %*% objective + nbWgt.norm %*% nb
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 6a: Ergänzung zum Buch
##D # 
##D #
##D 
##D fit <- function(des){
##D   desAllePos <- tensor(des, rep(1, nPos), 2, 1)
##D   
##D   #
##D   blockPaarInd <- upper.tri(diag(nrow = nBl))
##D   blockPaar <- crossprod(desAllePos)[blockPaarInd]
##D   
##D   err.bb <- blockPaar
##D   err.bb[blockPaar >= 2] <- blockPaar[blockPaar >= 2] - 2
##D   err.bb[blockPaar <= 1] <- 1 - blockPaar[blockPaar <= 1]
##D   
##D   objective <- sum(err.bb) / length(err.bb)
##D   objWgt <- 2^0
##D   
##D   #
##D   nbStatus <- list(
##D     (desAllePos[1:6, -(1:12)] > 0) / (6 * 18),      # 1
##D     (desAllePos[25:30, -(19:30)] > 0) / (6 * 18),   # 2
##D     (rowSums(desAllePos[, blMatching]) != 1) / nTh  # 3
##D   )
##D   nbStatus <- unlist(lapply(nbStatus, sum))
##D   
##D   # 4
##D   nbPos <- sum((colSums(des) != 1) / (nPos * nBl))
##D   # 5
##D   nbPos.pLSA <- list(
##D     (colSums(des[1:6, 1:2, 1:12], dims = 2) != 1) / 12,
##D     (colSums(des[1:6, 3:4, 1:12], dims = 2) != 1) / 12,
##D     (colSums(des[1:6, 5:6, 1:12], dims = 2) != 1) / 12
##D   )
##D   nbPos.pLSA <- sum(unlist(lapply(nbPos.pLSA, sum)) / 3)
##D   # 6
##D   nbPos.link <- list(
##D     (colSums(des[25:30, 1:2, 19:30], dims = 2) != 1) / 12,
##D     (colSums(des[25:30, 3:4, 19:30], dims = 2) != 1) / 12,
##D     (colSums(des[25:30, 5:6, 19:30], dims = 2) != 1) / 12
##D   )
##D   nbPos.link <- sum(unlist(lapply(nbPos.link, sum)) / 3)
##D   
##D   #
##D   nb <- c(nbStatus, nbPos, nbPos.pLSA, nbPos.link)
##D   nbWgt <- c(
##D     rep(2^5, length(nbStatus)),
##D     rep(2^6, length(nbPos)),
##D     rep(2^4, length(nbPos.pLSA)),
##D     rep(2^3, length(nbPos.link))
##D   )
##D   nbWgt.norm <- nbWgt / (sum(nbWgt) + objWgt)
##D   objWgt.norm <- objWgt / (sum(nbWgt) + objWgt)
##D   oDes <- objWgt.norm %*% objective + nbWgt.norm %*% nb
##D   
##D   return(oDes)
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 7: Initialisierung des Algorithmus
##D #
##D 
##D # t <- 1; t.min <- 1e-5; c <- 0.7; L <- 10000; l <- 1
##D t <- 1; tMin <- 1e-5; c <- 0.9; L <- 100000; l <- 1
##D 
##D fitInc <- fit(inc)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 8: Störung
##D #
##D 
##D thisTh <- (l - 1) %% nTh + 1
##D child <- inc
##D 
##D bloeckeTh <- which(colSums(child[thisTh, , ]) == 1)
##D raus <- sample(bloeckeTh, 1)
##D rein <- sample(setdiff(1:nBl, bloeckeTh), 1)
##D 
##D child[thisTh, , rein] <- child[thisTh, , raus]
##D child[thisTh, , raus] <- 0
##D 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 9: Survival
##D #
##D 
##D fitChild <- fit(child)
##D 
##D behalte <- fitChild < fitInc
##D if(!behalte){
##D   pt <- exp(-(fitChild - fitInc) / t)
##D   behalte <- runif(1) <= pt
##D }
##D 
##D if(behalte){
##D   inc <- child
##D   fitInc <- fitChild
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.2, Listing 9a: Ergänzung zum Buch
##D # 
##D 
##D # Achtung: Algorithmus benötigt einige Zeit.
##D # Je nach Wahl der Lauf-Parameter in Abschnitt 5.3.2, Listing 7, kann der 
##D # folgende Prozess bis zu ein paar Stunden dauern.
##D 
##D start <- Sys.time()
##D best <- list(inc, fitInc)
##D while(t > tMin){
##D   while(l < L){
##D     thisTh <- (l - 1) %% nTh + 1
##D     child <- inc
##D     
##D     # Perturbation 
##D     bloeckeTh <- which(colSums(child[thisTh, , ]) == 1)
##D     raus <- sample(bloeckeTh, 1)
##D     rein <- sample(setdiff(1:nBl, bloeckeTh), 1)
##D     
##D     child[thisTh, , rein] <- child[thisTh, , raus]
##D     child[thisTh, , raus] <- 0
##D     
##D     # Fit und Survival
##D     fitChild <- fit(child)
##D     
##D     behalte <- fitChild < fitInc
##D     if(!behalte){
##D       pt <- exp(-(fitChild - fitInc) / t)
##D       behalte <- runif(1) <= pt
##D     }
##D     
##D     if(behalte){
##D       inc <- child
##D       fitInc <- fitChild
##D     }
##D     
##D     # Kontroll-Ausgaben
##D     if(fitInc < best[[2]]){
##D       best <- list(inc, fitInc)
##D     }    
##D     
##D     if (l %% 500 == 0) {
##D       cat("\r")
##D       cat(paste("l=", l), 
##D           paste("t=", as.integer(log(t) / log(c) + 1)),
##D           paste("fit=", round(fitInc, 4)), 
##D           paste("pt=", round(pt, 5)),        
##D           sep=";   ")
##D       cat("                     ")
##D       flush.console()
##D     }
##D     l <- l + 1
##D   }
##D   l <- 1
##D   t <- t * c
##D }
##D end <- Sys.time()
##D 
##D tdBib2d <- apply(inc, 1, function(bb){
##D   this <- which(colSums(bb) > 0)
##D   this[order((1:nrow(bb) %*% bb)[this])] 
##D })
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 5.3.3: ATA Methode für die Item-zu-Block-Zuordnung
##D ## -------------------------------------------------------------
##D 
##D set.seed(1338)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 1: Initialisierung
##D #
##D 
##D nTh <- nrow(dat.bib)
##D nPos <- ncol(dat.bib)
##D nBl <- length(unique(unlist(dat.bib)))
##D blMatching <- seq(6, nBl, 6)
##D 
##D nI <- nrow(dat.ib)
##D itemsMatching <- which(dat.ib$format == "Matching")
##D itemsSonst <- which(dat.ib$format != "Matching")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.3, Listing 2: Startdesign
##D #
##D 
##D inc <- array(0, dim = c(nI, nBl))
##D for(bb in blMatching){
##D   inc[sample(itemsMatching, 2), bb] <- 1
##D }
##D for(bb in setdiff(1:nBl, blMatching)){
##D   inc[sample(itemsSonst, 7), bb] <- 1
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 3: Testheftebene
##D #
##D 
##D des <- inc
##D desTh <- des[, dat.bib[, 1]] + des[, dat.bib[, 2]] + 
##D   des[, dat.bib[, 3]] + des[, dat.bib[, 4]] + 
##D   des[, dat.bib[, 5]] + des[, dat.bib[, 6]]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 4: IIF
##D #
##D 
##D theta <- c(380, 580)
##D InfoItem <- dat.ib[,grep("IIF", colnames(dat.ib))]
##D TIF <- (t(InfoItem) %*% desTh) / 37
##D 
##D objective <- - sum(TIF) / prod(dim(TIF))
##D objWgt <- 2^0
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 5: KEY
##D #
##D 
##D nbKey <- list(
##D   (colSums(desTh > 1) > 0) / nTh,              # 7
##D   ((rowSums(desTh[, 1:6]) > 0) +               # 8
##D      (rowSums(desTh[, 25:30]) > 0) > 1) / nI  
##D )
##D nbKey <- unlist(lapply(nbKey, sum))
##D nbWgt <- 2^c(7, 6)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 6: Kategorial
##D #
##D 
##D # 9
##D zFocus.block <- c(0, 1, 1, 1, 1, 2, 0)
##D gFocus.block <- rowsum(des[, -blMatching], dat.ib$focus) - 
##D   zFocus.block
##D # 10
##D zFocus.form <- c(2, 6, 6, 6, 6, 13, 1)
##D gFocus.form <- rowsum(desTh, dat.ib$focus) - zFocus.form
##D # 11
##D gTopic.form <- rowsum(desTh, dat.ib$topic) - 4
##D 
##D nbKonstrukt <- list(
##D   colSums(gFocus.block < 0) / prod(dim(gFocus.block)), 
##D   colSums(gFocus.form > 0) / prod(dim(gFocus.form)), 
##D   colSums(gTopic.form > 0) / 30
##D )
##D nbKonstrukt <- unlist(lapply(nbKonstrukt, sum))
##D nbWgt <- c(nbWgt, 2^c(4, 4, 3))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 7: Stetig
##D #
##D 
##D length.form <- ((dat.ib$audiolength + 13) %*% desTh) / 60
##D nbStetig <- list(
##D   (length.form > 32) / length(length.form),
##D   (length.form < 28) / length(length.form)
##D )
##D nbStetig <- unlist(lapply(nbStetig, sum))
##D nbWgt <- c(nbWgt, 2^c(3, 2))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 8: Perturbation
##D #
##D 
##D thisBl <- 1
##D child <- inc
##D 
##D items.raus <- which(child[, thisBl] == 1)
##D raus <- sample(items.raus, 1)
##D 
##D bibPaar.bl <- dat.bibPaare[thisBl, ] != 0
##D items.bibPaare <- rowSums(child[, bibPaar.bl]) > 0
##D rein <- which(!items.bibPaare)
##D 
##D if(thisBl %in% blMatching){
##D   rein <- sample(intersect(rein, itemsMatching), 1)
##D }else{
##D   rein <- sample(intersect(rein, itemsSonst), 1)
##D }  
##D 
##D child[c(raus, rein), thisBl] <- c(0, 1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3.3, Listing 8a: Ergänzung zum Buch
##D #                              Vollständige Umsetzung
##D # 
##D 
##D # Achtung: Algorithmus benötigt einige Zeit.
##D # Je nach Wahl der Lauf-Parameter im nachfolgenden Abschnitt, kann der 
##D # Prozess bis zu einigen Stunden dauern.
##D 
##D fit <- function(des, dat.ib, dat.bib){
##D   desTh <- des[, dat.bib[, 1]] + des[, dat.bib[, 2]] + 
##D     des[, dat.bib[, 3]] + des[, dat.bib[, 4]] + 
##D     des[, dat.bib[, 5]] + des[, dat.bib[, 6]]
##D   
##D   #
##D   TIF <- (t(InfoItem) %*% desTh) / 37
##D   
##D   objective <- - sum(TIF) / prod(dim(TIF))
##D   objWgt <- 2^0
##D   
##D   #
##D   nbKey <- list(
##D     (colSums(desTh > 1) > 0) / nTh,              # 7
##D     ((rowSums(desTh[, 1:6]) > 0) +               # 8
##D        (rowSums(desTh[, 25:30]) > 0) > 1) / nI  
##D   )
##D   nbKey <- unlist(lapply(nbKey, sum))
##D   nbWgt <- 2^c(7, 6)
##D   
##D   # 9
##D   zFocus.block <- c(0, 1, 1, 1, 1, 2, 0)
##D   gFocus.block <- rowsum(des[, -blMatching], dat.ib$focus) - 
##D     zFocus.block
##D   # 10
##D   zFocus.form <- c(2, 6, 6, 6, 6, 13, 1)
##D   gFocus.form <- rowsum(desTh, dat.ib$focus) - zFocus.form
##D   # 11
##D   gTopic.form <- rowsum(desTh, dat.ib$topic) - 4
##D   
##D   nbKonstrukt <- list(
##D     colSums(gFocus.block < 0) / prod(dim(gFocus.block)), 
##D     colSums(gFocus.form > 0) / prod(dim(gFocus.form)), 
##D     colSums(gTopic.form > 0) / 30
##D   )
##D   nbKonstrukt <- unlist(lapply(nbKonstrukt, sum))
##D   nbWgt <- c(nbWgt, 2^c(4, 4, 3))
##D   
##D   #
##D   length.form <- ((dat.ib$audiolength + 13) %*% desTh) / 60
##D   nbStetig <- list(
##D     (length.form > 32) / length(length.form),
##D     (length.form < 28) / length(length.form)
##D   )
##D   nbStetig <- unlist(lapply(nbStetig, sum))
##D   nbWgt <- c(nbWgt, 2^c(3, 2))
##D   
##D   #
##D   nb <- c(nbKey, nbKonstrukt, nbStetig)
##D   
##D   nbWgt.norm <- nbWgt / (sum(nbWgt) + objWgt)
##D   objWgt.norm <- objWgt / (sum(nbWgt) + objWgt)
##D   oDes <- objWgt.norm %*% objective + nbWgt.norm %*% nb
##D   
##D   return(oDes)
##D }
##D 
##D #
##D # t <- 1; tMin <- 1e-5; c <- 0.7; L <- 10000; l <- 1
##D # t <- 1; tMin <- 1e-5; c <- 0.8; L <- 25000; l <- 1
##D # t <- 1; tMin <- 1e-5; c <- 0.9; L <- 50000; l <- 1
##D t <- 1; tMin <- 1e-7; c <- 0.9; L <- 100000; l <- 1
##D 
##D #
##D fitInc <- fit(inc, dat.ib, dat.bib)
##D best <- list(inc, fitInc)
##D vers <- versBest <- 1
##D #
##D start <- Sys.time()
##D while(t > tMin){
##D   while(l < L){
##D     thisBl <- (l - 1) %% nBl + 1
##D     
##D     # Perturbation 
##D     child <- inc
##D     
##D     items.raus <- which(child[, thisBl] == 1)
##D     raus <- sample(items.raus, 1)
##D     
##D     bibPaar.bl <- dat.bibPaare[thisBl, ] != 0
##D     items.bibPaare <- rowSums(child[, bibPaar.bl]) > 0
##D     rein <- which(!items.bibPaare)
##D     
##D     if(thisBl %in% blMatching){
##D       rein <- sample(intersect(rein, itemsMatching), 1)
##D     }else{
##D       rein <- sample(intersect(rein, itemsSonst), 1)
##D     }  
##D     
##D     child[c(raus, rein), thisBl] <- c(0, 1)
##D     
##D     # Fit und Survival
##D     fitChild <- fit(child, dat.ib, dat.bib)
##D     
##D     behalte <- fitChild < fitInc
##D     if(!behalte){
##D       pt <- exp((fitInc - fitChild) / t)
##D       behalte <- runif(1) <= pt
##D     }
##D     
##D     if(behalte){
##D       inc <- child
##D       fitInc <- fitChild
##D     }
##D     
##D     if(fitInc < best[[2]]){
##D       best <- list(inc, fitInc)
##D       versBest <- versBest + 1
##D     }    
##D     
##D     # Kontroll-Ausgaben; ggf. löschen
##D     if (identical(inc, child)) vers <- vers + 1
##D     if (l %% 500 == 0) {
##D       cat("\r")
##D       cat(paste("l=", l), 
##D           paste("t=", as.integer(log(t) / log(c) + 1)),
##D           paste("versionen=", vers), 
##D           paste("versionenBest=", versBest), 
##D           paste("fit=", round(fitInc, 4)), 
##D           paste("fitBest=", round(best[[2]], 4)), 
##D           paste("pt=", round(pt, 5)),        
##D           sep=";   ")
##D       cat("                     ")
##D       flush.console()
##D     }
##D     l <- l + 1
##D   }
##D   l <- 1
##D   t <- t * c
##D }
##D end <- Sys.time()
## End(Not run)



