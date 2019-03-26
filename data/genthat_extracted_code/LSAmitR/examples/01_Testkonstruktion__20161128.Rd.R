library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  1
### Title: Kapitel 1: Testkonstruktion
### Aliases: 'Kapitel 1'

### ** Examples

library(TAM)
library(miceadds)
library(irr)
library(gtools)
library(car)

set.seed(1337)
data(datenKapitel01)
pilotScored <- datenKapitel01$pilotScored
pilotItems <- datenKapitel01$pilotItems
pilotRoh <- datenKapitel01$pilotRoh
pilotMM <- datenKapitel01$pilotMM

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 1.5.5: Aspekte empirischer Güteüberprüfung 
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 1: Vorbereitung
##D #
##D 
##D # Rekodierter Datensatz pilotScored
##D dat <- pilotScored
##D items <- grep("E8R", colnames(dat), value = TRUE)
##D dat[items] <- recode(dat[items], "9=0;8=0")
##D # Itembank im Datensatz pilotItems
##D dat.ib <- pilotItems
##D items.dich <- dat.ib$item[dat.ib$maxScore == 1]
##D 
##D # Berechne erreichbare Punkte je TH
##D # aus Maximalscore je Item in Itembank
##D ind <- match(items, dat.ib$item)
##D testlets.ind <- ! items %in% items.dich
##D ind[testlets.ind] <- match(items[testlets.ind], dat.ib$testlet)
##D maxscores <- dat.ib$maxScore[ind]
##D max.form <- 1 * (!is.na(dat[, items])) %*% maxscores
##D 
##D # Erzielter Score ist der Summenscore dividiert durch 
##D # Maximalscore
##D sumscore <- rowSums(dat[, items], na.rm = TRUE)
##D relscore <- sumscore/max.form
##D mean(relscore)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 2: Omitted Response
##D #
##D 
##D library(TAM)
##D # Bestimme absolute und relative Häufigkeit der Kategorie 9 (OR)
##D ctt.omit <- tam.ctt2(pilotScored[, items])
##D ctt.omit <- ctt.omit[ctt.omit$Categ == 9, ]
##D # Übersicht der am häufigsten ausgelassenen Items
##D tail(ctt.omit[order(ctt.omit$RelFreq), -(1:4)])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 3: Not Reached
##D #
##D 
##D not.reached <- rep(0, length(items))
##D names(not.reached) <- items
##D 
##D # Führe die Bestimmung in jedem Testheft durch
##D forms <- sort(unique(dat$form))
##D for(ff in forms){ 
##D   # (1) Extrahiere Itempositionen
##D   order.ff <- order(dat.ib[, ff], na.last = NA, 
##D                     decreasing = TRUE)
##D   items.ff <- dat.ib$item[order.ff]
##D   testlets.ff <- dat.ib$testlet[order.ff]
##D   
##D   # (2) Sortiere Items und Testlets nach den Positionen
##D   testlets.ind <- ! items.ff %in% items.dich
##D   items.ff[testlets.ind] <- testlets.ff[testlets.ind]
##D   items.order.ff <- unique(items.ff)
##D   
##D   # (3) Bringe Testhefte in Reihenfolge und
##D   #     zähle von hinten aufeinanderfolgende Missings
##D   ind.ff <- pilotScored$form == ff
##D   dat.order.ff <- pilotScored[ind.ff, items.order.ff]  
##D   dat.order.ff <- dat.order.ff == 9
##D   dat.order.ff <- apply(dat.order.ff, 1, cumsum)
##D   
##D   # (4) Vergleiche letzteres mit theoretisch möglichem 
##D   #     vollständigen NR
##D   vergleich <- cumsum(rep(1, length(items.order.ff)))
##D   dat.order.ff[dat.order.ff != vergleich] <- 0
##D   
##D   # (5) Erstes NR kann auch OR sein
##D   erstes.NR <- apply(dat.order.ff, 2, which.max)
##D   ind <- cbind(erstes.NR, 1:ncol(dat.order.ff))
##D   dat.order.ff[ind] <- 0
##D   
##D   # (6) Zähle, wie oft für ein Item NR gilt
##D   not.reached.ff <- rowSums(dat.order.ff > 0)
##D   not.reached[items.order.ff] <- not.reached.ff[items.order.ff] + 
##D     not.reached[items.order.ff]
##D }
##D 
##D tail(not.reached[order(not.reached)])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 4: Itemschwierigkeit
##D #
##D 
##D # Statistik der relativen Lösungshäufigkeiten
##D p <- colMeans(dat[, items], na.rm = TRUE) / maxscores
##D summary(p)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 5: Trennschärfe
##D #
##D 
##D discrim <- sapply(items, FUN = function(ii){ 
##D   if(var(dat[, ii], na.rm = TRUE) == 0) 0 else
##D     cor(dat[, ii], relscore, use = "pairwise.complete.obs") 
##D }) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 6: Eindeutigkeit der Lösung
##D #
##D 
##D dat.roh <- pilotRoh
##D items <- grep("E8R", colnames(dat.roh), value = TRUE)
##D vars <- c("item", "Categ", "AbsFreq", "RelFreq", "rpb.WLE")
##D 
##D # Wähle nur geschlossene Items (d. h., nicht Open gap-fill)
##D items.ogf <- dat.ib$item[dat.ib$format == "Open gap-fill"]
##D items <- setdiff(items, items.ogf)
##D 
##D # Bestimme absolute und relative Häufigkeit der Antwortoptionen 
##D # und jeweilige punktbiseriale Korrelationen mit dem Gesamtscore
##D ctt.roh <- tam.ctt2(dat.roh[, items], wlescore = relscore)
##D 
##D # Indikator der richtigen Antwort
##D match.item <- match(ctt.roh$item, dat.ib$item)
##D rohscore <- 1 * (ctt.roh$Categ == dat.ib$key[match.item])
##D 
##D # Klassifikation der Antwortoptionen 
##D ist.antwort.option <- (!ctt.roh$Categ %in% c(8,9))
##D ist.distraktor <- rohscore == 0 & ist.antwort.option
##D ist.pos.korr <- ctt.roh$rpb.WLE > 0.05
##D ist.bearb <- ctt.roh$AbsFreq >= 10
##D 
##D # Ausgabe
##D ctt.roh[ist.distraktor & ist.pos.korr & ist.bearb, vars]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 7: Plausible Distraktoren
##D #
##D 
##D # Ausgabe
##D head(ctt.roh[ist.distraktor & ctt.roh$RelFreq < 0.05, vars],4)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 1.5.5, Listing 8: Kodierbarkeit
##D #
##D 
##D library(irr)
##D dat.mm <- pilotMM
##D 
##D # Bestimme Modus der Berechnung: bei 3 Kodierern
##D # gibt es 3 paarweise Vergleiche
##D vars <- grep("Coder", colnames(dat.mm))
##D n.vergleiche <- choose(length(vars), 2)
##D ind.vergleiche <- upper.tri(diag(length(vars)))
##D 
##D # Berechne Statistik für jedes Item
##D coder <- NULL
##D for(ii in unique(dat.mm$item)){
##D   dat.mm.ii <- dat.mm[dat.mm$item == ii, vars]
##D   
##D   # Relative Häufigkeit der paarweisen Übereinstimmung
##D   agreed <- apply(dat.mm.ii, 1, function(dd){
##D     sum(outer(dd, dd, "==")[ind.vergleiche]) / n.vergleiche
##D   })
##D   
##D   # Fleiss Kappa
##D   kappa <- kappam.fleiss(dat.mm.ii)$value
##D   
##D   # Ausgabe
##D   coderII <- data.frame("item" = ii,
##D                         "p_agreed" = mean(agreed),
##D                         "kappa" = round(kappa, 4))
##D   coder <- rbind(coder, coderII)
##D }
##D 
## End(Not run)



