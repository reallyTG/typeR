library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  4
### Title: Kapitel 4: Differenzielles Itemfunktionieren in Subgruppen
### Aliases: 'Kapitel 4'

### ** Examples

library(difR)
library(mirt)
library(sirt)
library(TAM)
set.seed(12345)

data(datenKapitel04)
dat <- datenKapitel04$dat
dat.th1 <- datenKapitel04$dat.th1
ibank <- datenKapitel04$ibank

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.4.1 DIF-Analysen für vollständige Daten
##D ## -------------------------------------------------------------
##D 
##D items.th1 <- grep("E8R", colnames(dat.th1), value=T)
##D resp <- dat.th1[, items.th1]
##D AHS <- dat.th1$AHS
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.1, Listing 1: Mantel-Haenszel
##D #
##D 
##D difMH(Data = resp, group = AHS, correct = F, focal.name = 0)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.1, Listing 2: Standardisierte p-Wert Differenzen
##D #
##D 
##D difStd(Data = resp, group = AHS, focal.name = 0)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.1, Listing 3: SIBTEST
##D #
##D 
##D SIBTEST(dat = resp, group = AHS, focal_name = 0, 
##D         focal_set = grep("E8RS03131", items.th1))
##D SIBTEST(dat = resp, group = AHS, focal_name=0,
##D         focal_set = grep("E8RS15621", items.th1))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.1, Listing 4: Methode nach Lord
##D #
##D 
##D difLord(Data = resp, group = AHS, focal.name = 0,
##D         model = "1PL")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.1, Listing 5: Zusammenschau
##D #
##D 
##D dichoDif(Data = resp, group = AHS, correct = F, focal.name = 0, 
##D          method = c("MH", "Std", "Lord"), model = "1PL")
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.4.2 DIF-Analysen für unvollständige Daten
##D ## -------------------------------------------------------------
##D 
##D items <- grep("E8R", colnames(dat), value = T)
##D resp <- dat[ ,items]
##D AHS <- dat$AHS
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 1: Matching-Variable setzen
##D #
##D 
##D score <- rowSums(resp, na.rm=T)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 2: Durchführung Logistische Regression
##D #
##D 
##D difLR <- dif.logistic.regression(resp, group = AHS, score = score)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 3: Durchführung Logistische Regression
##D #                             mit angepasster Referenzgruppe
##D #
##D 
##D difLR <- dif.logistic.regression(resp, AHS==0, score)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 4: Ausgabe erster Teil
##D #
##D 
##D cbind(item = difLR$item, round(difLR[, 4:13], 3))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 5: Ausgabe zweiter Teil
##D #
##D 
##D cbind(difLR[, c(3,14:16)], sign = difLR[, 17], ETS = difLR[, 18]) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 6: DIF-Größen
##D #
##D 
##D table(difLR[, 17], difLR[, 18])
##D 
##D difLR[c(10, 18), c(3, 14, 17:18)]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.2, Listing 7: Ausgabe dritter Teil
##D #
##D 
##D cbind(difLR[, c(3, 21:23)], sign=difLR[, 24])
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.4.3 Hypothesenprüfung mit GLMM
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 1: Itemauswahl
##D #
##D 
##D HO.items <- ibank[ibank$format == "ho", "task"]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 2: Facettenidentifikation
##D #
##D 
##D facets <- data.frame(AHS = dat$AHS)
##D form <- formula( ~ item * AHS)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 3: Initiierung des Designs
##D #
##D 
##D design <- designMatrices.mfr(resp = dat[, items], 
##D                              formulaA = form, facets = facets)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 4: Übergabe der Designmatrix und des
##D #                             erweiterten Responsepatterns
##D #
##D 
##D A <- design$A$A.3d[, , 1:(length(items) + 2)]
##D dimnames(A)[[3]] <- c(items, "AHS", "HO:AHS")
##D resp <- design$gresp$gresp.noStep
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 5: Ausgabe der ersten Zeilen des 
##D #                             Responsepatterns
##D #
##D 
##D head(resp)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 6: Identifikation Itemformat X Gruppe
##D #
##D 
##D HO.AHS0 <- paste0(HO.items, "-AHS0")
##D HO.AHS1 <- paste0(HO.items, "-AHS1")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 7: Spezifizierung des Designs
##D #
##D 
##D A[, , "HO:AHS"] <- 0
##D A[HO.AHS0, 2, "HO:AHS"] <- -1; A[HO.AHS1, 2, "HO:AHS"] <-  1
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 8: Ausgabe der Designmatrix für 
##D #                             Itemkategorie 'richtig beantwortet'
##D #
##D 
##D A[,2,c("AHS", "HO:AHS")]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 9: Schätzen des Modells
##D #
##D 
##D mod <- tam.mml(resp = resp, A=A)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4.3, Listing 10: Ausgabe der Parameterschätzer
##D #
##D 
##D summary(mod)
## End(Not run)



