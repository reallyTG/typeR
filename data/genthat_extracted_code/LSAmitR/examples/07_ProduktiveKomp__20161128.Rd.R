library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  7
### Title: Kapitel 7: Statistische Analysen produktiver Kompetenzen
### Aliases: 'Kapitel 7'

### ** Examples

library(irr)
library(TAM)
library(WrightMap)
library(lattice)
library(grid)
library(lme4)
library(lavaan)
library(xtable)

summary.VarComp <- function(mod){ 
  var.c <- VarCorr(mod)
  var.c <- c(unlist(var.c) , attr(var.c , "sc")^2)
  names(var.c)[length(var.c)] <- "Residual"
  dfr1 <- data.frame(var.c)
  colnames(dfr1) <- "Varianz"
  dfr1 <- rbind(dfr1, colSums(dfr1))
  rownames(dfr1)[nrow(dfr1)] <- "Total"
  dfr1$prop.Varianz <- 100 * (dfr1$Varianz / dfr1$Varianz[nrow(dfr1)])
  dfr1 <- round(dfr1,2)
  return(dfr1)
}

data(datenKapitel07)
prodRat <- datenKapitel07$prodRat
prodRatL <- datenKapitel07$prodRatL
prodPRat <- datenKapitel07$prodPRat 

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 7.2: Beurteilerübereinstimmung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.2, Listing 1: Berechnen der Häufigkeitstabellen
##D #
##D 
##D # Items auswählen
##D items <- c("TA", "CC", "GR", "VO")
##D # Tabelle erzeugen
##D tab <- apply(prodRat[, items], 2,
##D              FUN=function(x){
##D                prop.table(table(x))*100})
##D print(tab, digits = 2)
##D 
##D # Mittelwert der Ratings berechnen
##D round(apply(prodRat[, items], 2, mean), 2)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.2, Listing 2: Beurteilerübereinstimmung berechnen
##D #
##D 
##D items <- c("TA", "CC", "GR", "VO")
##D dfr <- data.frame(items, agree = NA, 
##D                   kappa = NA, wkappa = NA, korr = NA)
##D for(i in 1:length(items)){
##D   dat.i <- prodPRat[, grep(items[i], colnames(prodPRat))]
##D   dfr[i, "agree"] <- agree(dat.i, tolerance = 1)["value"]
##D   dfr[i, "kappa"] <- kappa2(dat.i)["value"]
##D   dfr[i, "wkappa"] <- kappa2(dat.i, weight = "squared")["value"]
##D   dfr[i, "korr"] <- cor(dat.i[,1], dat.i[,2])
##D   dfr[i, "icc"] <- icc(dat.i, model = "twoway")["value"]
##D }
##D print(dfr, digits = 3)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 7.3: Skalierungsmodelle
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 1: Skalierungsmodell mit TAM
##D #
##D 
##D set.seed(1234)
##D 
##D # Rater-Facette definieren
##D facets <- prodRat[, "rater", drop = FALSE] 
##D # Response Daten definieren
##D vars <- c("TA", "CC", "GR", "VO")
##D resp <- prodRat[, vars] 
##D # Personen-ID definieren
##D pid <- prodRat$idstud 
##D 
##D # Formel für Modell
##D formulaA <- ~item*step+item*rater
##D # Modell berechnen
##D mod <- tam.mml.mfr(resp = resp, facets = facets, formulaA = formulaA,   
##D                    pid = pid, control=list(xsi.start0 = 1, 
##D                                            fac.oldxsi = 0.1, 
##D                                            increment.factor = 1.05))
##D summary(mod, file="TAM_MFRM")
##D 
##D # Personenparameter und Rohscores
##D persons.mod <- tam.wle(mod)
##D persons.mod$raw.score <- persons.mod$PersonScores / (persons.mod$N.items) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 1b: Ergänzung zum Buch
##D # Modellvergleich aller besprochenen Modelle
##D #
##D 
##D f1 <- ~item * rater * step
##D mod1 <- tam.mml.mfr(resp = resp, facets = facets, formulaA = f1,   
##D                     pid = pid, control=list(xsi.start0 = 1, 
##D                                             fac.oldxsi = 0.1, 
##D                                             increment.factor = 1.05))
##D f2 <- ~item*step+item*rater
##D mod2 <- tam.mml.mfr(resp = resp, facets = facets, formulaA = f2,   
##D                     pid = pid, control=list(xsi.start0 = 1, 
##D                                             fac.oldxsi = 0.1, 
##D                                             increment.factor = 1.05))
##D f3 <- ~item * step + rater
##D mod3 <- tam.mml.mfr(resp = resp, facets = facets, formulaA = f3,   
##D                     pid = pid, control=list(xsi.start0 = 1, 
##D                                             fac.oldxsi = 0.1, 
##D                                             increment.factor = 1.05))
##D f4 <- ~item + step + rater
##D mod4 <- tam.mml.mfr(resp = resp, facets = facets, formulaA = f4,   
##D                     pid = pid, control=list(xsi.start0 = 1, 
##D                                             fac.oldxsi = 0.1, 
##D                                             increment.factor = 1.05))
##D mod4$xsi.facets
##D IRT.compareModels(mod1, mod2, mod3, mod4)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 1c: Ergänzung zum Buch
##D # Wright-Map: Items und Rater
##D #
##D 
##D item.labs <- vars
##D rater.labs <- unique(prodRat$rater)
##D item.labs <- c(item.labs, rep(NA, length(rater.labs) - 
##D                                 length(item.labs)))
##D 
##D pars <- mod$xsi.facets$xsi
##D facet <- mod$xsi.facets$facet
##D item.par <- pars[facet == "item"]
##D rater.par <- pars[facet == "rater"]
##D item_rat <- pars[facet == "item:rater"]
##D len <- length(item_rat)
##D item.long <- c(item.par, rep(NA, len - length(item.par)))
##D rater.long <- c(rater.par, rep(NA, len - length(rater.par)))
##D 
##D wrightMap(persons.mod$theta, rbind(item.long, rater.long), 
##D           label.items = c("Items",  "Rater"), 
##D           thr.lab.text = rbind(item.labs, rater.labs), 
##D           axis.items = "", min.l=-3, max.l=3,
##D           axis.persons = "Personen")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 2: Fit-Indices berechnen
##D #
##D 
##D # Infit/Outfit berechnen
##D pseudo_items <- colnames(mod$resp)
##D pss <- strsplit(pseudo_items , split="-")
##D item_parm <- unlist(lapply(pss, FUN = function(ll){ll[1]}))
##D rater_parm <- unlist(lapply(pss, FUN = function(ll){ll[2]}))
##D 
##D # Fit Items
##D res.items <- msq.itemfitWLE(mod, item_parm)
##D summary(res.items)
##D 
##D # Fit Rater
##D res.rater <- msq.itemfitWLE(mod, rater_parm)
##D summary(res.rater)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 2a: Ergänzung zum Buch
##D # Abbildung: Histogramm, Rohscores
##D #
##D 
##D dev.off()
##D par(mfcol=c(1,2))
##D 
##D hist(persons.mod$theta, col="grey", breaks=40, 
##D      main = "",
##D      xlab = "Theta (logits)",
##D      ylab = "Häufigkeit")
##D with(persons.mod, scatter.smooth(raw.score, theta, 
##D                                  pch = 1, cex = .6, xlab = "Rohscores",
##D                                  ylab = "Theta (logits)", 
##D                                  lpars = list(col = "darkgrey", lwd = 2, 
##D                                               lty = 1)))
##D 
##D # Abbildung: Fit-Statistik
##D par(mfcol=c(1,2))
##D fitdat <- res.rater$fit_data
##D fitdat$var <- factor(substr(fitdat$item, 1, 2))
##D boxplot(Outfit~var, data=fitdat, 
##D         ylim=c(0,2), main="Outfit")
##D boxplot(Infit~var, data=fitdat, 
##D         ylim=c(0,2), main="Infit")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 2b: Ergänzung zum Buch
##D # Korrelationen
##D #
##D 
##D korr <- c(with(persons.mod, cor(raw.score, theta, 
##D                                 method = "pearson")),
##D           with(persons.mod, cor(raw.score, theta, 
##D                                 method = "spearman")))
##D print(korr)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 3: Q3-Statistik berechnen
##D #
##D 
##D # Q3 Statistik
##D mfit.q3 <- tam.modelfit(mod)
##D rater.pairs <- mfit.q3$stat.itempair
##D 
##D # Nur Paare gleicher Rater wählen
##D unique.rater <- which(substr(rater.pairs$item1, 4,12) == 
##D                         substr(rater.pairs$item2, 4,12))
##D rater.q3 <- rater.pairs[unique.rater, ]
##D 
##D # Spalten einfügen: Rater, Kombinationen
##D rater.q3$rater <- substr(rater.q3$item1, 4, 12)
##D rater.q3 <- rater.q3[order(rater.q3$rater),]
##D rater.q3$kombi <- as.factor(paste(substr(rater.q3$item1, 1, 2), 
##D                                   substr(rater.q3$item2, 1, 2), sep="_"))
##D 
##D # Statistiken aggregieren: Rater, Kombinationen
##D dfr.raterQ3 <- aggregate(rater.q3$aQ3, by = list(rater.q3$rater), mean)
##D colnames(dfr.raterQ3) <- c("Rater", "Q3")
##D dfr.itemsQ3 <- aggregate(rater.q3$aQ3, by = list(rater.q3$kombi), mean)
##D colnames(dfr.itemsQ3) <- c("Items", "Q3")
##D dfr.itemsQ3
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.3, Listing 3a: Ergänzung zum Buch
##D # Lattice Dotplot
##D #
##D 
##D # Lattice Dotplot
##D mean.values <- aggregate(rater.q3$aQ3, list(rater.q3$kombi), mean)[["x"]]
##D dotplot(aQ3~kombi, data=rater.q3, main="Q3-Statistik", ylab="Q3 (adjustiert)",
##D         col="darkgrey", 
##D         panel = function(x,...){
##D           panel.dotplot(x,...)
##D           panel.abline(h = 0, col.line = "grey", lty=3)
##D           grid.points(1:6, mean.values, pch=17)
##D         })
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 7.4: Generalisierbarkeitstheorie
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.4, Listing 1: Varianzkomponenten mit lme4 berechnen
##D #
##D 
##D # Formel definieren
##D formula1 <- response ~ (1|idstud) + (1|item) + (1|rater) +
##D   (1|rater:item) + (1|idstud:rater) + 
##D   (1|idstud:item)
##D # Modell mit Interaktionen
##D mod.vk <- lmer(formula1, data=prodRatL)
##D 
##D # Zusammenfassung der Ergebnisse
##D summary(mod.vk)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.4, Listing 1a: Ergänzung zum Buch
##D # Helper-Function um die Varianzkomponenten zu extrahieren
##D #
##D 
##D summary.VarComp <- function(mod){ 
##D   var.c <- VarCorr(mod)
##D   var.c <- c(unlist(var.c) , attr(var.c , "sc")^2)
##D   names(var.c)[length(var.c)] <- "Residual"
##D   dfr1 <- data.frame(var.c)
##D   colnames(dfr1) <- "Varianz"
##D   dfr1 <- rbind(dfr1, colSums(dfr1))
##D   rownames(dfr1)[nrow(dfr1)] <- "Total"
##D   dfr1$prop.Varianz <- 100 * (dfr1$Varianz / dfr1$Varianz[nrow(dfr1)])
##D   dfr1 <- round(dfr1,2)
##D   return(dfr1)
##D }
##D summary.VarComp(mod.vk)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.4, Listing 2: Berechnung des G-Koeffizienten
##D #
##D 
##D vk <- summary.VarComp(mod.vk)
##D n.p <- length(unique(prodRatL$idstud)) # Anzahl Schüler
##D n.i <- 4  # Anzahl Items
##D n.r <- c(1,2,5) # Anzahl Rater
##D 
##D # Varianzkomponenten extrahieren
##D sig2.p <- vk["idstud", "Varianz"]
##D sig2.i <- vk["item", "Varianz"]
##D sig2.r <- vk["rater", "Varianz"]
##D sig2.ri <- vk["rater:item", "Varianz"]
##D sig2.pr <- vk["idstud:rater", "Varianz"]
##D sig2.pi <- vk["idstud:item", "Varianz"]
##D sig2.pir <- vk["Residual", "Varianz"]
##D 
##D # Fehlervarianz berechnen
##D sig2.delta <- sig2.pi/n.i + sig2.pr/n.r + sig2.pir/(n.i*n.r) 
##D 
##D # G-Koeffizient berechnen
##D g.koeff <- sig2.p / (sig2.p + sig2.delta)
##D print(data.frame(n.r, g.koeff), digits = 3)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.4, Listing 2a: Ergänzung zum Buch
##D # Phi-Koeffizient berechnen
##D #
##D 
##D sig2.D <- sig2.r/n.r + sig2.i/n.i + sig2.pi/n.i + sig2.pr/n.r + 
##D   sig2.ri/(n.i*n.r) + sig2.pir/(n.i*n.r) 
##D phi.koeff <- sig2.p / (sig2.p + sig2.D)
##D print(data.frame(n.r, phi.koeff), digits = 3)
##D 
##D # Konfidenzintervalle
##D 1.96*sqrt(sig2.D)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.4, Listing 2c: Ergänzung zum Buch
##D # Variable Rateranzahl
##D #
##D 
##D dev.off()
##D n.i <- 4  # Anzahl Items
##D dn.r <- seq(1,10)# 1 bis 10 mögliche Rater
##D delta.i <- sig2.pi/n.i + sig2.pr/dn.r + sig2.pir/(n.i*dn.r)
##D g.koeff <- sig2.p / (sig2.p + delta.i)
##D names(g.koeff) <- paste("nR", dn.r, sep="_") 
##D print(g.koeff[1:4])
##D 
##D # Abbildung variable Rateranzahl
##D plot(g.koeff, type = "b", pch = 19, lwd = 2, bty = "n",
##D      main = "G-Koeffizient: Raters",
##D      ylab = "G-Koeffizient",
##D      xlab = "Anzahl Raters",  xlim = c(0,10))
##D abline(v=2, col="darkgrey")
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 7.5: Strukturgleichungsmodelle
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.5, Listing 1: SEM
##D #
##D 
##D # SEM Modell definieren
##D lv.mod <- " 
##D   # Messmodell
##D   TA =~ 1*TA_R1 + 1*TA_R2
##D   CC =~ 1*CC_R1 + 1*CC_R2
##D   GR =~ 1*GR_R1 + 1*GR_R2
##D   VO =~ 1*VO_R1 + 1*VO_R2
##D   
##D   # Varianz Personen
##D   TA ~~ Vta * TA
##D   CC ~~ Vcc * CC
##D   GR ~~ Vgr * GR
##D   VO ~~ Vvo * VO
##D   
##D   # Varianz Rater X Personen
##D   TA_R1 ~~ Vta_R12 * TA_R1
##D   TA_R2 ~~ Vta_R12 * TA_R2
##D   CC_R1 ~~ Vcc_R12 * CC_R1
##D   CC_R2 ~~ Vcc_R12 * CC_R2
##D   GR_R1 ~~ Vgr_R12 * GR_R1
##D   GR_R2 ~~ Vgr_R12 * GR_R2
##D   VO_R1 ~~ Vvo_R12 * VO_R1
##D   VO_R2 ~~ Vvo_R12 * VO_R2
##D   
##D   # Kovarianz
##D   TA_R1 ~~ Kta_cc * CC_R1
##D   TA_R2 ~~ Kta_cc * CC_R2
##D   TA_R1 ~~ Kta_gr * GR_R1
##D   TA_R2 ~~ Kta_gr * GR_R2
##D   TA_R1 ~~ Kta_vo * VO_R1
##D   TA_R2 ~~ Kta_vo * VO_R2
##D   CC_R1 ~~ Kcc_gr * GR_R1
##D   CC_R2 ~~ Kcc_gr * GR_R2
##D   CC_R1 ~~ Kcc_vo * VO_R1
##D   CC_R2 ~~ Kcc_vo * VO_R2
##D   GR_R1 ~~ Kgr_vo * VO_R1
##D   GR_R2 ~~ Kgr_vo * VO_R2
##D   
##D   # ICC berechnen
##D   icc_ta := Vta / (Vta + Vta_R12)
##D   icc_cc := Vcc / (Vcc + Vcc_R12)
##D   icc_gr := Vgr / (Vgr + Vgr_R12)
##D   icc_vo := Vvo / (Vvo + Vvo_R12)
##D   "
##D # Schätzung des Modells
##D mod1 <- sem(lv.mod, data = prodPRat)
##D summary(mod1, standardized = TRUE)
##D 
##D # Inspektion der Ergebnisse
##D show(mod1)
##D fitted(mod1)
##D inspect(mod1,"cov.lv")
##D inspect(mod1, "free")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.5, Listing 2: Kompakte Darstellung der Ergebnisse
##D #
##D 
##D parameterEstimates(mod1, ci = FALSE, 
##D                    standardized = TRUE)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 7.5, Listing 2a: Ergänzung zum Buch
##D # Schreibe Ergebnisse in Latex-Tabelle:
##D #
##D 
##D xtable(parameterEstimates(mod1, ci = FALSE, 
##D                           standardized = TRUE), digits = 3)
## End(Not run)



