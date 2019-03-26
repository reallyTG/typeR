library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  6
### Title: Kapitel 6: Skalierung und Linking
### Aliases: 'Kapitel 6'

### ** Examples

library(TAM)
library(sirt)
library(WrightMap)
library(miceadds)
library(plyr)
set.seed(20150528)

dat <- data(datenKapitel06)
# Hauptstudie
dat <- datenKapitel06$dat
ue <- datenKapitel06$itembank
items <- grep("I", colnames(dat), value=TRUE)

# Nur TH1
datTH1 <- datenKapitel06$datTH1
ueTH1 <- datenKapitel06$itembankTH1
rownames(ueTH1) <- ueTH1$Item
itemsTH1 <- grep("I", colnames(datTH1), value=TRUE)
respTH1 <- datTH1[, -(1:4)]; wTH1 <- datTH1$wgtstud

# Normierungsstudie
normdat <- datenKapitel06$normdat

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.4 Das Partial Credit Model (PCM)
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 1: Leistungsdaten und Stich-
##D #                             probengewichte Objekten zuweisen
##D #
##D 
##D resp <- dat[, grep("I", colnames(dat))]; w <- dat$wgtstud
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 2: Anpassen eines PCMs
##D #
##D 
##D mod.1PL <- tam.mml(resp = resp, irtmodel = "1PL", pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 2a: Ergänzung zum Buch
##D # Runden zur besseren Darstellung im Buch
##D #
##D 
##D mod.1PL$item$M <- round(mod.1PL$item$M, 2)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 3: Darstellung des letzen Items
##D #
##D 
##D tail(mod.1PL$item, 1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 4: Umparametrisierung
##D #
##D 
##D b_ih <- mod.1PL$item[, grep("AXsi_", colnames(mod.1PL$item))]
##D delta.tau <- pcm.conversion(b_ih)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.4, Listing 5: Berechnung der Thursonian 
##D #                             Threshods und Lokations Indizes
##D #
##D 
##D thurst.thres <- IRT.threshold(mod.1PL)
##D LI <- IRT.threshold(mod.1PL, type="item")
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.5 Itemtrennschärfen polytomer Items und
##D ##                 Rateparameter
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 1: Anpassen eines Generalized
##D #                             Partial Credit Models
##D # 
##D 
##D mod.GPCM <- tam.mml.2pl(resp, irtmodel = "GPCM", pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 2: Anpassen eines 
##D #                             Nominal Item Response Models
##D # 
##D 
##D mod.NIRM <- tam.mml.2pl(resp, irtmodel="2PL", pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 3: Anpassen eines Generalized 
##D #                             Partial Credit Models mit festen 
##D #                             Itemgewichten (Trennschärfen)
##D # 
##D 
##D tammodel <- "
##D   LAVAAN MODEL:
##D   F =~ a1__a50*I1__I50;
##D   # Trait-Varianz auf 1 fixieren
##D   F ~~ 1*F
##D   MODEL CONSTRAINT:
##D   # Gewichtung für die Items festlegen
##D   a1__a40 == 1*a # dichotome Items
##D   a41__a44 == .3333*a # T/F Items mit max. Score von 3
##D   a45__a50 == .25*a # M56 Items mit max. Score von 4
##D   " 
##D mod.GPCMr <- tamaan(tammodel, resp, pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 4: Itemtrennschärfevergleich
##D # 
##D 
##D ## Itemparameter im Vergleich
##D rbind(GPCM = mod.GPCM$item[50, 9:12], 
##D       NIRM = mod.NIRM$item[50, 9:12],
##D       GPCMr = mod.GPCMr$item[50, 10:13]) / rep(c(1:4), each=3)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 5: Itemtrennschärfen eines 
##D #                             dichotomen und eines polytomen 
##D #                             Items
##D 
##D rbind(I40 = mod.GPCMr$item[40, 10:13],
##D       I50 = mod.GPCMr$item[50, 10:13])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 6: Anpassen eines 1PL-G Modells
##D #
##D 
##D 
##D ## Das 1PL-G Modell
##D tammodel <- "
##D   LAVAAN MODEL:
##D   F =~ 1*I1__I50
##D   F ~~ F
##D   # Rateparameter für MC4 Items
##D   I1__I10 ?= gMC4*g1
##D   # Rateparameter für MC3 Items
##D   I11__I20 + I31__I40 ?= gMC3*g1
##D   "
##D mod.1PL_G <- tamaan(tammodel, resp, pweights = w, 
##D                     control = list(Msteps = 15))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.5, Listing 7: Ausgabe geschätzter Rateparameter
##D #                             für MC3 und MC4 Items
##D #
##D 
##D mod.1PL_G$item[c(10,11), c(1,4,5)]
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.6 Bookleteffekte
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.6, Listing 1: Anpassen eines Bookletmodells
##D # 
##D 
##D mod.1PL_Book <- tam.mml.mfr(resp, facets = cbind(th = dat$th), 
##D                  formulaA= ~ item + item:step + th, pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.6, Listing 2: Ausgabe der Bookleteffekte der einzelnen
##D #                             Testhefte
##D # 
##D 
##D rbind((tmp <- mod.1PL_Book$xsi[paste0("thER0", 1:5),]), 
##D       thER06 = - c(sum(tmp[,1]), NA))
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.7 Personenfähigkeitsschätzer
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 1: WLEs
##D # 
##D 
##D WLE.1PL <- as.data.frame(tam.wle(mod.1PL))
##D round(head(WLE.1PL, 2), 4)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 2: WLE Reliabilität
##D # 
##D 
##D WLErel(WLE.1PL$theta, WLE.1PL$error, w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 3: EAPs
##D # 
##D 
##D round(head(mod.1PL$person, 2), 4)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 4: EAP Reliabilität
##D # 
##D 
##D EAPrel(mod.1PL$person$EAP, mod.1PL$person$SD.EAP, w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 4a: Ergänzung zum Buch
##D # Alternative Berechnung der EAP-Reliabilität
##D #
##D 
##D 1 - weighted.mean(mod.1PL$person$SD.EAP^2, w)/mod.1PL$variance
##D 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 5: PVs
##D # 
##D 
##D PV.1PL <- tam.pv(mod.1PL)$pv
##D round(head(PV.1PL, 2), 4)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.7, Listing 6: Statistische Kennwerte der einzelnen
##D #                             Personenfähigkeitsschätzer
##D # 
##D 
##D cbind(WLEs = c(M = weighted.mean(WLE.1PL$theta, w),
##D                SD = weighted_sd(WLE.1PL$theta, w)),
##D       EAPs = c(M = weighted.mean(mod.1PL$person$EAP, w),
##D                SD = weighted_sd(mod.1PL$person$EAP, w)),
##D       PVs = c(M = mean(apply(PV.1PL[, -1], 2, weighted.mean, w)),
##D               SD=mean(apply(PV.1PL[, -1], 2, weighted_sd, w))))
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.8 Mehrdimensionale Modelle
##D ## -------------------------------------------------------------
##D 
##D # Achtung: Algorithmen benötigen einige Zeit
##D # Zur schnelleren Konvergenz werden nur Daten aus Testheft 1 verwendet
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.8, Listing 1: Verteilung der Items auf Foki 
##D # 
##D 
##D table(paste("Fokus", ue$focus[ue$Item %in% colnames(datTH1)]))
##D table(paste("Fokus", ueTH1$focus))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.8, Listing 2: Spezifizierung der Q-Matrix und 
##D #                             Anpassung des Modells
##D #                             Achtung: Schätzung benötigt > 300 Iterationen
##D # 
##D 
##D Q <- array(0, c(25, 5), list(items[items %in% colnames(datTH1)]))
##D for(i in 1:25) Q[i, ueTH1$focus[i] + 1] <- 1
##D mod.1PL_multi <- tam(resp = respTH1, pweights = wTH1,
##D                      Q = Q, control = list(snodes = 1500))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.8, Listing 3: Anpassen eines Bifaktormodells
##D #                             Achtung: Schätzung benötigt > 350 Iterationen
##D # 
##D 
##D mod.1PL_bi <- tam.fa(respTH1, irtmodel = "bifactor1", 
##D                 dims = ueTH1$format, pweights = wTH1, 
##D                 control = list(snodes = 1500))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.8, Listing 4: Darstellung der Varianzen des 
##D #                             Hauptfaktors und der Störfaktoren
##D # 
##D 
##D nams <- c("I26", "I45", "I12", "I1", "I41")
##D dfr <- data.frame(mod.1PL_bi$B.stand[nams,],
##D                   row.names=ueTH1[nams, "format"])
##D dfr
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.8, Listing 5: Darstellung der Reliabilitätsschätzer
##D # 
##D 
##D mod.1PL_bi$meas
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.3.9 Modellpassung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.9, Listing 1: Berechnung und Darstellungen von 
##D #                             Itemfitstatistiken
##D # 
##D 
##D itemfit <- tam.fit(mod.1PL)
##D summary(itemfit)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.9, Listing 2: Berechnung und Darstellungen von 
##D #                             Modellfitstatistiken
##D # 
##D 
##D modfit <- tam.modelfit(mod.1PL)
##D modfit$fitstat
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.3.9, Listing 3: LRT für Modelltestung
##D # 
##D 
##D anova(mod.1PL, mod.GPCM)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.4.1 Simultane Kalibrierung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.1, Listing 1: Daten vorbereiten
##D #
##D 
##D vars <- c("idstud", "wgtstud", "th")
##D # Daten der Hauptstudie
##D tmp1 <- cbind("Hauptstudie" = 1, dat[,c(vars, items)])
##D # Daten der Normierungsstudie
##D n.items <- grep("I|J",names(normdat),value=T)
##D tmp2 <- cbind("Hauptstudie" = 0, normdat[, c(vars, n.items)])
##D # Schülergewichte der Normierungsstudie sind konstant 1
##D # Datensätze zusammenfügen
##D dat.g <- rbind.fill(tmp1,tmp2)
##D all.items <- grep("I|J",names(dat.g),value=T)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.1, Listing 2: Simultane Kalibrierung
##D #                             Achtung: Schätzung benötigt > 450 Iterationen
##D #
##D 
##D # 2-Gruppenmodell
##D linkmod1 <-  tam.mml(resp=dat.g[, all.items], pid=dat.g[, 2], 
##D               group = dat.g$Hauptstudie, pweights=dat.g$wgtstud)
##D summary(linkmod1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.1, Listing 2a: Ergänzung zum Buch
##D # Berechnung von Verteilungsparametern
##D #
##D 
##D set.seed(20160828)
##D 
##D # PVs
##D PV_linkmod1 <- tam.pv(linkmod1, nplausible = 20)
##D 
##D # Personendatensatz
##D dfr_linkmod1 <- linkmod1$person
##D dfr_linkmod1 <- merge( x = dfr_linkmod1, y = PV_linkmod1$pv, by = "pid" , all=T)
##D dfr_linkmod1 <- dfr_linkmod1[ order(dfr_linkmod1$case) , ]
##D 
##D # Leistungsskala transformieren
##D vars.pv <- grep("PV",names(dfr_linkmod1),value=T)
##D # Mittlere Fähigkeit der Normierungsgruppe
##D p0 <- which(dat.g$Hauptstudie == 0)
##D M_PV <- mean(apply(dfr_linkmod1[p0,vars.pv],2,Hmisc::wtd.mean,
##D                    weights = dfr_linkmod1[p0,"pweight"]))
##D SD_PV <- mean(sqrt(apply(dfr_linkmod1[p0,vars.pv],2,Hmisc::wtd.var,
##D                          weights = dfr_linkmod1[p0,"pweight"])))
##D # Tranformationsparameter
##D a <- 100/SD_PV; b <- 500 - a*M_PV
##D 
##D # Verteilungsparameter der Hauptstudie
##D p1 <- which(dat.g$Hauptstudie == 1)
##D M1_PV <- mean(apply(dfr_linkmod1[p1,vars.pv],2,Hmisc::wtd.mean,
##D                     weights = dfr_linkmod1[p1,"pweight"]))
##D SD1_PV <- mean(sqrt(apply(dfr_linkmod1[p1,vars.pv],2,Hmisc::wtd.var,
##D                           weights = dfr_linkmod1[p1,"pweight"])))
##D TM_PV <- M1_PV*a + b; TSD_PV <- SD1_PV*a
##D 
##D # Ergebnisse
##D trafo_linkmod1 <- data.frame(M_Norm = 500, SD_Norm = 100, a = a, b = b,
##D                              M = TM_PV, SD = TSD_PV)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.4.2 Separate Kalibrierung mit fixiertem 
##D ##                 Itemparameter
##D ## -------------------------------------------------------------
##D 
##D 
##D # Vorgehensweise 1: 
##D # Daten der Normierungsstudie frei kalibrieren und skalieren
##D # Skalierung der Hauptstudie-Daten mit fixiertem Itemparameter
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.2, Listing 1: Daten der Normierungsstudie frei 
##D #                             kalibrieren und skalieren
##D #
##D 
##D normmod <- tam.mml(resp = normdat[, n.items], 
##D                    pid = normdat[, "idstud"])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.2, Listing 1a: Ergänzung zum Buch
##D # Berechnung von Verteilungsparametern
##D #
##D 
##D summary(normmod)
##D 
##D set.seed(20160828)
##D 
##D # Personenfähigkeitsschätzer
##D PV_normmod <- tam.pv(normmod, nplausible = 20)
##D # In Personendatensatz kombinieren
##D dfr_normmod <- normmod$person
##D dfr_normmod <- merge( x = dfr_normmod, y = PV_normmod$pv, by = "pid" , all=T)
##D dfr_normmod <- dfr_normmod[ order(dfr_normmod$case) , ]
##D 
##D M_norm <- mean(apply(dfr_normmod[,vars.pv],2,Hmisc::wtd.mean,
##D                      weights = dfr_normmod[,"pweight"]))
##D SD_norm <- mean(sqrt(apply(dfr_normmod[,vars.pv],2,Hmisc::wtd.var,
##D                            weights = dfr_normmod[,"pweight"])))
##D # Tranformationsparameter
##D a_norm <- 100/SD_norm; b_norm <- 500 - a_norm*M_norm
##D 
##D TM_norm <- M_norm * a_norm + b_norm
##D TSD_norm <- SD_norm * a_norm
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.2, Listing 2: Parameter aus Normierungsstudie
##D #                             für die Skalierung der Haupt-
##D #                             studie bei deren Skalierung 
##D #                             fixieren
##D #
##D 
##D # Itemschwierigkeit aus der Normierungsstudie
##D norm.xsi <- normmod$xsi.fixed.estimated
##D # Hauptstudie: xsi-Matrix aus mod.1PL
##D xsi.fixed <- mod.1PL$xsi.fixed.estimated
##D # nur Parameter von Items in Hauptstudie
##D norm.xsi <- norm.xsi[ 
##D   rownames(norm.xsi) %in% rownames(xsi.fixed), ]
##D # Setzen der Parameter in richtiger Reihenfolge
##D xsi.fixed <- cbind(match(rownames(norm.xsi), 
##D                          rownames(xsi.fixed)), norm.xsi[, 2])
##D # Skalierung der Hauptstudie-Daten mit fixierten Itemparameter
##D mainmod.fixed <- tam.mml(resp = resp, xsi.fixed = xsi.fixed,
##D                          pid = dat$MB_idstud, pweights = w)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.2, Listing 2a: Ergänzung zum Buch
##D # Berechnung von Verteilungsparametern
##D #
##D 
##D summary(mainmod.fixed)
##D 
##D set.seed(20160828)
##D 
##D # Personenfähigkeitsschätzer
##D WLE_mainmod.fixed <- tam.wle(mainmod.fixed)
##D PV_mainmod.fixed <- tam.pv(mainmod.fixed, nplausible = 20)
##D # In Personendatensatz kombinieren
##D dfr_mainmod.fixed <- mainmod.fixed$person
##D dfr_mainmod.fixed <- merge( x = dfr_mainmod.fixed, y = WLE_mainmod.fixed, by = "pid" , all=T)
##D dfr_mainmod.fixed <- merge( x = dfr_mainmod.fixed, y = PV_mainmod.fixed$pv, by = "pid" , all=T)
##D dfr_mainmod.fixed <- dfr_mainmod.fixed[ order(dfr_mainmod.fixed$case) , ]
##D 
##D M_main <- mean(apply(dfr_mainmod.fixed[,vars.pv],2,Hmisc::wtd.mean,
##D                      weights = dfr_mainmod.fixed[,"pweight"]))
##D SD_main <- mean(sqrt(apply(dfr_mainmod.fixed[,vars.pv],2,Hmisc::wtd.var,
##D                            weights = dfr_mainmod.fixed[,"pweight"])))
##D 
##D TM_main <- M_main * a_norm + b_norm
##D TSD_main <- SD_main * a_norm
##D 
##D trafo.fixed1 <- data.frame(M_norm = M_norm, SD_norm = SD_norm,
##D                            a = a_norm, b = b_norm,
##D                            TM_norm = TM_norm, TSD_norm = TSD_norm,
##D                            M_PV = M_main, SD_PV = SD_main,
##D                            M_TPV = TM_main, SD_TPV = TSD_main)
##D 
##D # Vorgehensweise 2: 
##D # Daten der Hauptstudie frei kalibrieren und skalieren
##D # Skalierung der Hauptstudie-Daten mit fixierten Itemparameter
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.2, Listing 2b: Ergänzung zum Buch
##D # Analoges Vorgehen mit fixierten Parametern aus der 
##D # Hauptstudie für die Skalierung der Normierungsstudie
##D #
##D 
##D # Daten der Hauptstudie kalibrieren und skalieren
##D mainmod <- tam.mml(resp=dat[, items], irtmodel="1PL", 
##D                    pid=dat$MB_idstud, pweights=dat[,"wgtstud"])
##D summary(mainmod)
##D 
##D set.seed(20160828)
##D 
##D # Personenfähigkeitsschätzer
##D WLE_mainmod <- tam.wle(mainmod)
##D PV_mainmod <- tam.pv(mainmod, nplausible = 20)
##D # In Personendatensatz kombinieren
##D dfr_mainmod <- mainmod$person
##D dfr_mainmod <- merge( x = dfr_mainmod, y = WLE_mainmod, by = "pid" , all=T)
##D dfr_mainmod <- merge( x = dfr_mainmod, y = PV_mainmod$pv, by = "pid" , all=T)
##D dfr_mainmod <- dfr_mainmod[order(dfr_mainmod$case),]
##D 
##D M_main <- mean(apply(dfr_mainmod[,vars.pv],2,Hmisc::wtd.mean,
##D                      weights = dfr_mainmod[,"pweight"]))
##D SD_main <- mean(sqrt(apply(dfr_mainmod[,vars.pv],2,Hmisc::wtd.var,
##D                            weights = dfr_mainmod[,"pweight"])))
##D 
##D 
##D # Itemschwierigkeit aus der Hauptstudie
##D main.xsi <- mod.1PL$xsi.fixed.estimated
##D # Hauptstudie: xsi-Matrix aus normmod
##D xsi.fixed <- normmod$xsi.fixed.estimated
##D # nur Parameter von Items in Hauptstudie
##D main.xsi <- main.xsi[ 
##D   rownames(main.xsi) %in% rownames(xsi.fixed), ]
##D # Setzen der Parameter in richtiger Reihenfolge
##D xsi.fixed <- cbind(match(rownames(main.xsi), 
##D                          rownames(xsi.fixed)), main.xsi[, 2])
##D 
##D # Skalierung der Hauptstudie-Daten mit fixiertem Itemparameter
##D normmod.fixed <- tam.mml(resp=normdat[, n.items], irtmodel="1PL", 
##D                          xsi.fixed = xsi.fixed,
##D                          pid=normdat$MB_idstud, pweights=normdat[,"wgtstud"])
##D summary(normmod.fixed)
##D 
##D set.seed(20160828)
##D 
##D # Personenfähigkeitsschätzer
##D PV_normmod.fixed <- tam.pv(normmod.fixed, nplausible = 20)
##D dfr_normmod.fixed <- normmod.fixed$person
##D dfr_normmod.fixed <- merge( x = dfr_normmod.fixed, y = PV_normmod.fixed$pv, by = "pid" , all=T)
##D dfr_normmod.fixed <- dfr_normmod.fixed[ order(dfr_normmod.fixed$case) , ]
##D 
##D M_norm <- mean(apply(dfr_normmod.fixed[,vars.pv],2,Hmisc::wtd.mean,
##D                      weights = dfr_normmod.fixed[,"pweight"]))
##D SD_norm <- mean(sqrt(apply(dfr_normmod.fixed[,vars.pv],2,Hmisc::wtd.var,
##D                            weights = dfr_normmod.fixed[,"pweight"])))
##D 
##D # Tranformationsparameter
##D a_norm <- 100/SD_norm; b_norm <- 500 - a_norm*M_norm
##D 
##D TM_norm <- M_norm * a_norm + b_norm
##D TSD_norm <- SD_norm * a_norm
##D 
##D TM_main <- M_main * a_norm + b_norm
##D TSD_main <- SD_main * a_norm
##D 
##D trafo.fixed2 <- data.frame(M_PV = M_main, SD_PV = SD_main,
##D                            M_Norm.fixed = M_norm, SD_Norm.fixed = SD_norm,
##D                            a = a_norm, b = b_norm,
##D                            TM_norm = TM_norm, TSD_norm = TSD_norm,
##D                            M_TPV = TM_main, SD_TPV = TSD_main)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.4.3 Separate Kalibrierung mit Linking durch 
##D ##                 Transformationsfunktion
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.3, Listing 1: equating.rasch()
##D #
##D 
##D # Freigeschätzte Itemparameter der Normierung- und Hauptstudie
##D norm.pars <- normmod$item[,c("item","xsi.item")]
##D main.pars <- mainmod$item[,c("item","xsi.item")]
##D # Linking mit equating.rasch
##D mod.equate <- equating.rasch(x = norm.pars, y = main.pars)
##D mod.equate$B.est
##D #   Mean.Mean    Haebara Stocking.Lord
##D #  -0.1798861 -0.1788159    -0.1771145
##D head(mod.equate$anchor,2)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.3, Listing 1a: Ergänzung zum Buch
##D # Berechnung Linkingfehler                             
##D #
##D linkitems <- intersect(n.items, items)
##D 
##D head(mod.equate$transf.par,2)
##D mod.equate$descriptives
##D 
##D # Linkingfehler: Jackknife unit ist Item
##D pars <- data.frame(unit = linkitems,
##D                    study1 = normmod$item$xsi.item[match(linkitems, normmod$item$item)],
##D                    study2 = mainmod$item$xsi.item[match(linkitems, mainmod$item$item)],
##D                    item = linkitems)
##D # pars <- as.matrix(pars)
##D mod.equate.jk <- equating.rasch.jackknife(pars,se.linkerror = T)
##D mod.equate.jk$descriptives
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.3, Listing 2: Linking nach Haberman
##D #
##D 
##D # Itemparameter der Normierungsstudie
##D M1 <- mean( apply(dfr_normmod[,vars.pv], 2, mean ) )
##D SD1 <- mean( apply(dfr_normmod[,vars.pv], 2, sd ) )
##D a1 <- 1/SD1; b1 <- 0-a1*M1
##D A <- normmod$item$B.Cat1.Dim1/a1
##D B <- (normmod$item$xsi.item + b1/a1)
##D # Itemparameter der Normierungsstudie fuer haberman.linking
##D tab.norm <- data.frame(Studie = "1_Normierung",
##D                        item = normmod$item$item,
##D                        a = A, b = B/A)
##D # Itemparameter der Hauptstudie
##D A <- mainmod$item$B.Cat1.Dim1
##D B <- mainmod$item$xsi.item
##D tab.main <- data.frame(Studie = "2_Hauptstudie",
##D                        item = mainmod$item$item,
##D                        a = A, b = B/A)
##D # Itemparameter aller Studien
##D itempars <- rbind(tab.norm, tab.main)
##D # Personenparameter
##D personpars <- list(PV_normmod$pv*a1+b1, PV_mainmod$pv)
##D # Linking nach Habermans Methode
##D linkhab <- linking.haberman(itempars = itempars, 
##D                             personpars = personpars)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.3, Listing 2a: Ergänzung zum Buch
##D # Ergebnisdarstellung, Transformation und Berechnung
##D # von Verteilungsparametern
##D #
##D 
##D # Ergebnisse
##D # Transformationsparameter der Itemparameter
##D linkhab$transf.itempars
##D # Transformationsparameter der Personenparameter
##D linkhab$transf.personpars
##D 
##D # Itemparameter
##D dfr.items <- data.frame(linkhab$joint.itempars,
##D                         linkhab$b.orig, linkhab$b.trans)
##D names(dfr.items)[-1] <- c("joint_a","joint_b",
##D                           "orig_b_norm","orig_b_main",
##D                           "trans_b_norm","trans_b_main")
##D head(round2(dfr.items[,-1],2),2)
##D 
##D # Transformierte Personenparameter der Hauptstudie
##D dfr_main_transpv <- linkhab$personpars[[2]]
##D names(dfr_main_transpv)[-1] <- paste0("linkhab_",vars.pv)
##D dfr_main_transpv <- cbind(dfr_mainmod,dfr_main_transpv[,-1])
##D round2(head(dfr_main_transpv[,c("PV1.Dim1","linkhab_PV1.Dim1","PV2.Dim1","linkhab_PV2.Dim1")],2),2)
##D 
##D # Aufgeklärte und Fehlvarianz des Linkings
##D linkhab$es.invariance
##D 
##D # Transformationsparameter der Normierungsstudie auf Skala 500,100
##D # trafo.fixed1
##D a <- 100/mean( apply(dfr_normmod[,vars.pv]*a1+b1, 2, sd ) )
##D b <- 500 - a*mean( apply(dfr_normmod[,vars.pv]*a1+b1, 2, mean ) )
##D 
##D # trafo.fixed2
##D M_PV <- mean( apply(linkhab$personpars[[2]][vars.pv], 2, 
##D                     Hmisc::wtd.mean, weights = dfr_mainmod$pweight ) )
##D SD_PV <- mean( sqrt(apply(linkhab$personpars[[2]][vars.pv], 2, 
##D                           Hmisc::wtd.var, weights = dfr_mainmod$pweight )) )
##D M_TPV <- M_PV*a + b
##D SD_TPV <- SD_PV * a
##D 
##D trafo.linkhab <- data.frame(trafo.fixed1[,1:2],
##D                             a1 = a1, b1 = b1,
##D                             M_norm_trans = 0,
##D                             SD_norm_trans = 1,
##D                             a = 100, b = 500,
##D                             trafo.fixed2[,1:2],
##D                             linkhab_M_PV = M_PV, 
##D                             linkhab_SD_PV = SD_PV,
##D                             linkhab_M_TPV = M_TPV,
##D                             linkhab_SD_TPV = SD_TPV)
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 6.4.4 Ergebnisse im Vergleich und Standardfehler
##D ##                 des Linkings
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 6.4.4, Listing 3a: Ergänzung zum Buch
##D # Berechnung von Standardfehlern Ergebnisvergleiche
##D #
##D 
##D # Gemeinsame Skalierung mit fixiertem Itemparameter aus Hauptstudie
##D # Standardfehler bzgl. Itemstichprobenfehler
##D 
##D # Matrix für fixerte Itemparameter vorbereiten
##D xsi.fixed <- normmod.fixed$xsi.fixed.estimated
##D npar <- length(xsi.fixed[,"xsi"])
##D mat.xsi.fixed <- cbind(index=1:npar,par = dimnames(xsi.fixed)[[1]])
##D sequence <- match(mat.xsi.fixed[,"par"],dimnames(main.xsi)[[1]])
##D mat.xsi.fixed <- cbind(index=as.numeric(mat.xsi.fixed[,1]), 
##D                        par = mat.xsi.fixed[,2],
##D                        xsi.fixed = as.numeric(main.xsi[sequence,"xsi"]))
##D # Nicht fixierte Itemparameter löschen
##D del <- which(is.na(mat.xsi.fixed[,"xsi.fixed"]))
##D mat.xsi.fixed <- mat.xsi.fixed[-del,]
##D head(mat.xsi.fixed,3)
##D 
##D dfr <- data.frame(elim = "none",growth=trafo.fixed2$M_TPV-500)
##D # Jedes Mal ein Ankeritem weniger
##D # Schleife über alle Ankeritems
##D 
##D set.seed(20160828)
##D 
##D for(ii in linkitems){
##D   # ii <- linkitems[1]
##D   del <- grep(paste0(ii,"_"), mat.xsi.fixed[,2])
##D   tmp <- mat.xsi.fixed[-del,c(1,3)]
##D   tmp <- data.frame(index = as.numeric(tmp[,1]),xsi.fixed = as.numeric(tmp[,2]))
##D   
##D   # Skalierung der Hauptstudie-Daten mit fixiertem Itemparameter
##D   normmod.tmp <- tam.mml(resp=normdat[, n.items], irtmodel="1PL", 
##D                          xsi.fixed = tmp,
##D                          pid=normdat$MB_idstud, pweights=normdat[,"wgtstud"])
##D   
##D   # Personenfähigkeitsschätzer
##D   # WLE_normmod.tmp <- tam.wle(normmod.tmp)
##D   PV_normmod.tmp <- tam.pv(normmod.tmp, nplausible = 20)
##D   # In Personendatensatz kombinieren
##D   
##D   M_norm.tmp <- mean(apply(PV_normmod.tmp$pv[,vars.pv],2,mean))
##D   SD_norm.tmp <- mean(apply(PV_normmod.tmp$pv[,vars.pv],2,sd))
##D   
##D   # Tranformationsparameter
##D   a_norm.tmp <- 100/SD_norm.tmp 
##D   b_norm.tmp <- 500 - a_norm.tmp*M_norm.tmp
##D   
##D   TM_main.tmp <- M_main * a_norm.tmp + b_norm.tmp
##D   dfr.tmp <- data.frame(elim = ii,growth=TM_main.tmp-500)
##D   dfr <- rbind(dfr,dfr.tmp)
##D   
##D }
##D 
##D dfr$diff2 <- (dfr$growth-dfr$growth[1])^2
##D sum <- sum(dfr$diff2)
##D Var <- sum*28/29
##D SE <- sqrt(Var)
##D 
##D quant <- 1.96 
##D low <- trafo.fixed2$M_TPV - quant*SE
##D upp <- trafo.fixed2$M_TPV + quant*SE
##D 
##D dfr$SE <- SE; dfr$quant <- quant
##D dfr$low <- low; dfr$upp <- upp
##D 
## End(Not run)



