library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  3
### Title: Kapitel 3: Standard-Setting
### Aliases: 'Kapitel 3'

### ** Examples

library(car)
library(irr)
library(prettyR)
library(lattice)
library(gridExtra)

data(datenKapitel03)
ratings <- datenKapitel03$ratings
bookmarks <- datenKapitel03$bookmarks
sdat <- datenKapitel03$sdat
productive <- datenKapitel03$productive

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 3.2.2: Daten aus der IDM-Methode
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 1: Feedback
##D #
##D 
##D raterID <- grep("R", colnames(ratings), value = TRUE)
##D nraters <- length(raterID) 
##D nitems <- nrow(ratings) 
##D itemID <- ratings[, 1] 
##D itemdiff <- ratings[, 2]
##D stufen <- c(1, 2, 3) # Anzahl der Kompetenzstufen
##D item.freq <- data.frame() 
##D # Berechne Prozentuelle Zuteilungen auf Stufen pro Item
##D tabelle.ii <- data.frame()
##D for(ii in 1:nitems){   
##D   tabelle.ii <- round(table(factor(as.numeric(ratings[ii, 
##D     raterID]), levels = stufen)) / nraters * 100, digits = 2)      
##D   item.freq <- rbind(item.freq, tabelle.ii) }
##D colnames(item.freq) <- paste0("Level_", stufen)
##D item.freq <- data.frame(ratings[, 1:2], item.freq)
##D head(item.freq, 3)
##D # Anmerkung: Item 3 zu 100% auf Stufe 1, Item 2 aufgeteilt 
##D # auf Stufe 1 und 2
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 1a: Ergänzung zum Buch
##D # GRAFIK-Erzeugung
##D #
##D 
##D # Farben für die Grafik definieren
##D c1 <- rgb(239/255, 214/255, 67/255)  
##D c2 <- rgb(207/255, 151/255, 49/255)  
##D c3 <- rgb(207/255, 109/255, 49/255)
##D 
##D # Aufbereitung Tabelle für Grafik
##D freq.dat <- t(as.matrix(item.freq[1:nitems,(3:(2+length(stufen)))]))
##D barcol <- c("black", "gray", "white") 
##D 
##D #Grafik wird erzeugt
##D par(mfcol=c(3,1), oma=c(0,0,3,0)) # Angeben der Plot-Anzahl      
##D perplot <- round(nitems/3)    
##D a <- perplot + 1   
##D b <- perplot*2  
##D c <- b + 1     
##D d <- perplot*3
##D barplot(freq.dat[,1 : perplot], col = barcol, beside = T, 
##D         names.arg = seq(1 , perplot), xlab = "Itemnummer (Seitenzahl im OIB)", 
##D         ylab = "% Zuteilung auf Stufe", horiz = F, ylim = range(1:100))
##D barplot(freq.dat[, a:b], col = barcol, beside = T, names.arg = seq(a, b), 
##D         xlab = "Itemnummer (Seitenzahl im OIB)", 
##D         ylab = "% Zuteilung auf Stufe", 
##D         horiz = F, ylim = range(1:100))
##D barplot(freq.dat[, c:d], col = barcol, beside = T, names.arg = seq(c, d), 
##D         xlab = "Itemnummer (Seitenzahl im OIB)", 
##D         ylab = "% Zuteilung auf Stufe", 
##D         horiz = F, ylim = range(1:100))
##D title("Feedback für das Experten-Panel aus der IDM-Methode", outer = T)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 2: Cut-Score Berechnung
##D #
##D 
##D library(car)
##D # Rekodieren
##D rate.i <- ratings[which(ratings$R01 %in% c(2, 3)), 
##D                   c("Norm_rp23", "R01")] 
##D rate.i$R01 <-  recode(rate.i$R01, "2=0; 3=1")
##D coef(cut.i <- glm(rate.i$R01  ~ rate.i$Norm_rp23 , 
##D                   family = binomial(link="logit")))
##D # Berechnung des Cut-Scores laut Formel
##D cut.R01 <- (-cut.i$coefficients[1])/ cut.i$coefficients[2]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 3: Rater-Analysen
##D # 
##D 
##D library(irr)
##D # Auswahl der Ratings
##D rater.dat <- ratings[ ,grep("R", colnames(ratings))]
##D # Berechne Kappa von jeder Person mit allen anderen Personen
##D kappa.mat <- matrix(NA, nraters, nraters) 
##D for(ii in 1:nraters){  
##D   rater.eins <- rater.dat[, ii]      
##D   for(kk in 1:nraters){    
##D     rater.zwei <- rater.dat[ ,kk]
##D     dfr.ii <- cbind(rater.eins, rater.zwei)
##D     kappa.ik <- kappa2(dfr.ii)       
##D     kappa.mat[ii, kk] <- kappa.ik$value }} 
##D diag(kappa.mat) <- NA 
##D # Berechne Mittleres Kappa für jede Person
##D MW_Kappa <- round(colMeans(kappa.mat, na.rm=T), digits=2) 
##D SD_Kappa <- round(apply(kappa.mat, 2, sd, na.rm=T), digits=2) 
##D (Kappa.Stat <- data.frame("Person"= raterID, MW_Kappa, 
##D   SD_Kappa))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 4: Berechnung Fleiss' Kappa
##D # 
##D 
##D kappam.fleiss(rater.dat)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 5: Modalwerte
##D # 
##D 
##D library(prettyR)
##D # Berechne Modalwert
##D mode <- as.numeric(apply(rater.dat, 1, Mode))
##D # Korrelation für die Ratings jeder Person im Panel mit den 
##D # Modalwerten der Items
##D corr <- data.frame()
##D for(z in raterID){
##D   rater.ii <- rater.dat[, (grep(z, colnames(rater.dat)))]
##D   cor.ii <- round(cor(mode, rater.ii, method = "spearman",
##D     use = "pairwise.complete.obs"), digits = 2)
##D   corr <- rbind(corr, cor.ii)
##D }
##D corr[, 2] <- raterID
##D colnames(corr) <- c("Korrelation", "Rater")
##D # Aufsteigende Reihenfolge 
##D (corr <- corr[order(corr[, 1]),])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 5: Ergänzung zum Buch
##D # GRAFIK-Erzeugung und ICC
##D #
##D 
##D # Grafik
##D plot(corr$Korrelation, xlab = NA, ylab = "Korrelation",   
##D      ylim = c(0.5, 1), xaxt = "n", main = "Korrelation zwischen 
##D      Modalwert und individueller Zuordnung der Items pro Rater/in")
##D text(seq(1:nraters), corr$Korrelation - 0.02, labels = corr[, 2], 
##D      offset = 1, cex = 1)
##D title(xlab = "Raters nach aufsteigender Korrelation gereiht")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.2, Listing 6: ICC
##D # 
##D 
##D library(irr)
##D (iccdat.agree <- icc(rater.dat, model = "twoway", 
##D   type = "agreement", unit = "single", r0 = 0, conf.level=0.95))
##D (iccdat.cons <- icc(rater.dat, model = "twoway", 
##D   type = "consistency", unit = "single", r0 = 0, conf.level=0.95))
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 3.2.3: Daten aus der Bookmark-Methode
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.3, Listing 1: Feedback
##D # 
##D 
##D head(bookmarks)
##D statbookm <- data.frame("Stats"=c("Md","Mean","SD"), 
##D                         "Cut1"=0, "Cut2"=0)
##D statbookm[1,2] <- round(median(bookmarks$Cut1), digits=2)
##D statbookm[1,3] <- round(median(bookmarks$Cut2), digits=2)
##D statbookm[2,2] <- round(mean(bookmarks$Cut1), digits=2)
##D statbookm[2,3] <- round(mean(bookmarks$Cut2), digits=2)
##D statbookm[3,2] <- round(sd(bookmarks$Cut1), digits=2)
##D statbookm[3,3] <- round(sd(bookmarks$Cut2), digits=2)
##D (statbookm)
##D table(bookmarks$Cut1)
##D table(bookmarks$Cut2)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.3, Listing 2: Cut-Score Berechnung
##D # 
##D 
##D bm.cut <- NULL 
##D bm.cut$cut1 <- mean(ratings$Norm_rp23[bookmarks$Cut1]) 
##D bm.cut$cut2 <- mean(ratings$Norm_rp23[bookmarks$Cut2]) 
##D bm.cut$cut1sd <- sd(ratings$Norm_rp23[bookmarks$Cut1]) 
##D bm.cut$cut2sd <- sd(ratings$Norm_rp23[bookmarks$Cut2]) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.3, Listing 3: Standardfehler des Cut-Scores
##D # 
##D 
##D se.cut1 <- bm.cut$cut1sd/sqrt(nraters)
##D se.cut2 <- bm.cut$cut2sd/sqrt(nraters)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.2.3, Listing 4: Impact Data
##D #
##D 
##D Pers.Para <- sdat[, "TPV1"]
##D cuts <- c(bm.cut$cut1, bm.cut$cut2)
##D # Definiere Bereiche: Minimaler Personenparameter bis Cut-Score 1, 
##D #   Cut-Score 1 bis Cut-Score 2, Cut-Score 2 bis maximaler 
##D #   Personenparameter
##D Cuts.Vec <- c(min(Pers.Para)-1, cuts, max(Pers.Para)+1)
##D # Teile Personenparameter in entsprechende Bereiche auf
##D Kum.Cuts <- cut(Pers.Para, breaks = Cuts.Vec)
##D # Verteilung auf die einzelnen Bereiche
##D Freq.Pers.Para <- xtabs(~ Kum.Cuts)
##D nstud <- nrow(sdat)
##D # Prozent-Berechnung
##D prozent <- round(as.numeric(Freq.Pers.Para / nstud * 100), 
##D                  digits = 2) 
##D (Impact.Data <- data.frame("Stufe" = c("A1", "A2", "B1"), 
##D                            "Prozent" = prozent))
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 3.3.2: Daten aus der Contrasting-Groups-Methode
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 3.3.2, Listing 1: Cut-Scores
##D #
##D 
##D raterID <- grep("R", colnames(productive), value = TRUE) 
##D nraters <- length(raterID)  
##D nscripts <- nrow(productive) 
##D # Berechne Cut-Score für jeden Rater
##D cutscore <- data.frame("rater"=raterID, "cut1.ges"=NA)
##D for(ii in 1:length(raterID)){ 
##D   rater <- raterID[ii]   
##D   rates.ii <- productive[ ,grep(rater, colnames(productive))]   
##D   mean0.ii <- mean(productive$Performance[rates.ii == 0], 
##D     na.rm = TRUE)   
##D   mean1.ii <- mean(productive$Performance[rates.ii == 1], 
##D     na.rm = TRUE)   
##D   mean.ii <- mean(c(mean1.ii, mean0.ii), na.rm = TRUE)   
##D   cutscore[ii, "cut1.ges"] <- mean.ii }
##D # Finaler Cut-Score
##D cut1 <- mean(cutscore$cut1.ges)
##D sd.cut1 <- sd(cutscore$cut1.ges)
##D se.cut1 <- sd.cut1/sqrt(nraters)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Appendix: Abbildungen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abbildung 3.1
##D #
##D 
##D # 1. Grafik
##D par(fig=c(0, 1, 0, 0.35), oma=c(0,0,3,0), cex = 0.85) 
##D boxplot(Kappa.Stat$MW_Kappa, horizontal = T, ylim=c(0.42,0.66), 
##D         axes = F, xlab = "MW Kappa")
##D # 2. Grafik wird hinzugefügt
##D par(fig=c(0, 1, 0.2, 1), new=TRUE)
##D sd.factor <- 1.5 
##D mmw <- mean(Kappa.Stat$MW_Kappa)
##D sdmw <- sd(Kappa.Stat$MW_Kappa)
##D #Grenzwerte für MW und SD werden festgelegt
##D mwind <- c(mmw-(sd.factor*sdmw), mmw+(sd.factor*sdmw))
##D plot(Kappa.Stat$MW_Kappa, Kappa.Stat$SD_Kappa, xlab = "",
##D      ylab = "SD Kappa", type = "n", xlim = c(0.42, 0.66), 
##D      ylim = c(0, 0.2))
##D abline(v = mwind, col="grey", lty = 2)
##D # Rater mit 1.5 SD Abweichung vom MW werden grau markiert 
##D abw.rater <- which(Kappa.Stat$MW_Kappa < mwind[1] | 
##D                      Kappa.Stat$MW_Kappa > mwind[2])
##D points(Kappa.Stat$MW_Kappa[-abw.rater], 
##D        Kappa.Stat$SD_Kappa[-abw.rater], 
##D        pch = 19)
##D points(Kappa.Stat$MW_Kappa[abw.rater], 
##D        Kappa.Stat$SD_Kappa[abw.rater], 
##D        pch = 25, bg = "grey")
##D text(Kappa.Stat$MW_Kappa[abw.rater], 
##D      Kappa.Stat$SD_Kappa[abw.rater], 
##D      Kappa.Stat$Person[abw.rater], 
##D      pos = 3) 
##D title("Rater-Analysen: MW und SD Kappa aus der IDM-Methode", 
##D       outer = TRUE)
##D 
##D # -------------------------------------------------------------
##D # Abbildung 3.2
##D #
##D 
##D nitems <- 60
##D 
##D library(lattice)
##D library(gridExtra)
##D #Erster Plot mit Mittelwert
##D plot.Cut1 <- dotplot(bookmarks$Rater ~ bookmarks$Cut1, col = "black", 
##D                      panel = function(...){
##D                        panel.dotplot(...)
##D                        panel.abline(v = mean(bookmarks$Cut1), lty = 5)
##D                      }, 
##D                      xlab = "Bookmarks für Cut-Score 1 (Seite im OIB)",
##D                      ylab = "Raters", cex = 1.3)
##D #Zweiter Plot mit Mittelwert
##D plot.Cut2 <- dotplot(bookmarks$Rater ~ bookmarks$Cut2, col = "black", 
##D                      panel = function(...){
##D                        panel.dotplot(...)
##D                        panel.abline(v = mean(bookmarks$Cut2), lty = 5)
##D                      }, 
##D                      xlab = "Bookmarks für Cut-Score 2 (Seite im OIB)", 
##D                      ylab = "Raters", cex = 1.3)
##D #Plots nebeneinander anordnen
##D grid.arrange(plot.Cut1, plot.Cut2, nrow = 1, top = "Bookmarks pro Rater/in")
##D 
## End(Not run)



