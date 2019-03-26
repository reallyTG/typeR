library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel 10
### Title: Kapitel 10: Reporting und Analysen
### Aliases: 'Kapitel 10'

### ** Examples

library(BIFIEsurvey)
library(matrixStats)

data(datenKapitel10)
dat <- datenKapitel10$dat
dat.roh <- datenKapitel10$dat.roh
dat.schule <- datenKapitel10$dat.schule
dat.schule.roh <- datenKapitel10$dat.schule.roh

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.4.1: Datenbasis
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.1 a, Ergänzung zum Buch
##D # Herunterladen, entpacken und setzen des Arbeitsspeichers
##D # 
##D 
##D # setwd(dir = ".../DatenKapitel10")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.1, Listing 1: Einlesen der Schülerdaten
##D #
##D 
##D # Anlegen eines leeren Listenobjektes für Schülerdaten
##D dat <- list()
##D 
##D # Vektor mit Liste der Dateinamen für Schülerdaten
##D dateinamen <- paste0("e8pv__schueler_imp_",1:10,".csv")
##D # Schleife zum Einlesen der Daten, die in die Listenobjekte 
##D # abgelegt werden
##D for (ii in 1:10) {
##D   schueler_dfr<-read.csv2(file = dateinamen[[ii]])
##D   dat[[ii]] <- schueler_dfr
##D }
##D # Überprüfen des Listenobjektes und der eingelesenen Daten
##D str(dat)
##D 
##D # Rohdaten als Datenmatrix einlesen
##D dat.roh <- read.csv2(file = "e8pv__schueler_raw.csv")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.1, Listing 1a: Ergänzung zum Buch
##D # Einlesen der Schulendaten
##D #
##D 
##D # Anlegen eines leeren Listenobjektes für Schuldaten
##D dat.schule <- list()
##D 
##D # Vektor mit Liste der Dateinamen für Schuldaten
##D dateinamen <- paste0("e8pv__schule_imp_",1:10,".csv")
##D # Schleife zum Einlesen der Daten, die in die Listenobjekte 
##D # abgelegt werden
##D for (ii in 1:10) {
##D   schule_dfr<-read.csv2(file = dateinamen[[ii]])
##D   dat.schule[[ii]] <- schule_dfr
##D }
##D # Überprüfen des Listenobjektes und der eingelesenen Daten
##D str(dat.schule)
##D 
##D #Rohdaten als Datenmatrix einlesen
##D dat.schule.roh <- read.csv2(file = "e8pv__schule_raw.csv")
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.4.2: Merging verschiedener Ebenen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.2, Listing 1
##D #
##D 
##D for (i in 1:10) {
##D    dat[[i]] <- merge(dat[[i]],dat.schule[[i]],
##D                       by = "idschool",all.x = TRUE)
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.2, Listing 2
##D 
##D for (i in 1:10) {
##D    dat.agg <- aggregate(dat[[i]][,c("HISEI","E8RPV")],
##D                         by = list(idschool = dat[[i]]$idschool),
##D                         FUN = mean,na.rm = TRUE)
##D    dat.schule[[i]] <- merge(dat.schule[[i]],dat.agg,
##D                             by="idschool",all.x = TRUE)
##D }
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.4.3: Erzeugen von BIFIEdata-Objekten
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, a: Ergänzung zum Buch
##D # Einlesen der Replikationsgewichte
##D #
##D 
##D # Zwischenspeichern des Schülerdatensatzes
##D dat.tmp <- dat
##D 
##D # Daten aus Large-Scale Assessments können mit replicate weights 
##D #  abgespeichert werden (z.B. PISA) oder mit Informationen zu den 
##D #  Jackknifezonen und -gewichten (z.B. PIRLS). In diesem Beispiel 
##D #  werden beide Methoden vorgestellt, daher wird die Gewichtungs-
##D #  information in beiden Formen eingelesen: mit replicate weights
##D #  im Datensatz dat1; mit Replikationsdesign im Datensatz dat2.
##D 
##D # replicate weights für Schüler/innen als Datenmatrix einlesen 
##D dat.repwgts <- read.csv2(file = "e8__schueler_repwgts.csv")
##D # replicate weights an Schülerdaten mergen
##D for (ii in 1:10) {
##D   dat[[ii]]<-merge(x = dat[[ii]],y = dat.repwgts,
##D                     by = c("idschool","idstud"))
##D }
##D 
##D # Jackknifezonen und -gewichte für Schulen als Datenmatrix einlesen 
##D dat2 <- list()
##D dat.schule.jk <- read.csv2(file = "e8__schule_jkzones.csv")
##D # Jackknifezonen und -gewichte an schülerdaten mergen
##D for (ii in 1:10) {
##D   dat2[[ii]]<-merge(x = dat.tmp[[ii]],y = dat.schule.jk,
##D                     by = "idschool")
##D }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, b: Ergänzung zum Buch
##D # Kontrolle der Sortierung
##D #
##D 
##D # Die Observationen in den 10 Imputationen muessen gleich sortiert 
##D # sein. Dies wir zur Sicherheit getestet. 
##D for (i in 2:10) {
##D   if (sum(dat[[1]]$idstud!=dat[[i]]$idstud )>0) 
##D       stop("Imputationsdatensätze nicht gleich sortiert!")  
##D }
##D   
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, c: Ergänzung zum Buch
##D # Verwendung des R-Datenobjekts
##D #
##D 
##D dat <- datenKapitel10$dat
##D   
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, Listing 1: Übernahme der Gewichte aus 
##D # Datenmatrix
##D #
##D 
##D wgtstud <- dat[[1]]$wgtstud
##D repwgtsvar <- grep("^w_fstr",colnames(dat[[1]]))
##D repwgts <- dat[[1]][,repwgtsvar]
##D dat <- BIFIE.data(data.list = dat,wgt = wgtstud,
##D                   wgtrep = repwgts,fayfac = 1,
##D                   cdata = TRUE)
##D summary(dat)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, Listing 2: Erzeugung der Gewichte aus 
##D # Replikationsdesign
##D #         
##D 
##D dat2 <- BIFIE.data.jack(data = dat2,wgt = "wgtstud",
##D                         jktype = "JK_GROUP",
##D                         jkzone = "jkzone",
##D                         jkrep = "jkrep",
##D                         fayfac = 1)
##D summary(dat2)
##D 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.3, Listing 3: Univariate Statistik Reading
##D #
##D 
##D res.univar <- BIFIE.univar(BIFIEobj = dat,
##D                           vars = c("E8RPV"),
##D                           group = "Strata")
##D summary(res.univar)
##D res2.univar <- BIFIE.univar(BIFIEobj = dat2,
##D                           vars = c("E8RPV"),
##D                           group = "Strata")
##D summary(res2.univar)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.4.4: Rekodierung und Transformation von 
##D ##                   Variablen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.4, Listing 1: Neue Variable GERSER mit 
##D # BIFIE.data.transform
##D #
##D 
##D transform.formula <- as.formula(
##D    "~ 0 + I(cut(E8RPV,breaks = c(0,406,575,1000),labels = FALSE))"
##D    )
##D dat <- BIFIE.data.transform(dat,transform.formula,
##D                             varnames.new = "GERSER")
##D res.freq <- BIFIE.freq(BIFIEobj = dat,vars = c("GERSER"))
##D summary(res.freq)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.4, Listing 2: Zwei neue Variablen PVERfit und 
##D # PVERres mit BIFIE.data.transform
##D #
##D 
##D transform.formula <- as.formula(
##D    "~ 0 + I(fitted(lm(E8RPV ~ HISEI + female))) +
##D           I(residuals(lm(E8RPV ~ HISEI + female)))"
##D    )
##D dat <- BIFIE.data.transform(dat,transform.formula,
##D                             varnames.new = c("PVERfit","PVERres"))
##D res.univar <- BIFIE.univar(BIFIEobj = dat,
##D                           vars = c("PVERfit","PVERres"))
##D summary(res.univar)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.4.5: Berechnung von Kenngroessen und deren 
##D ##                   Standardfehlern
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.4.5, Listing 1: Anwenderfunktion
##D #
##D library(matrixStats)
##D 
##D anwenderfct.weightedMad <- function(X,w)
##D {
##D   # Die Funktion weightedMad wird auf jede Spalte der 
##D   # übergebenen Matrix X angewendet.
##D   Wmad<-apply(X = X, MARGIN = 2,FUN = matrixStats::weightedMad, 
##D               w = w, na.rm = T)
##D }
##D 
##D wgt.Mad <- BIFIE.by(BIFIEobj = dat,
##D                      vars =  c("HISEI", "E8RPV"),
##D                      userfct = anwenderfct.weightedMad,
##D                      userparnames = c("wMadHISEI", "wMadE8RPV"))
##D summary(wgt.Mad)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.6.1: Datenexploration
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.1, Listing 1: Ungewichtete univariate 
##D # Statistiken
##D #
##D 
##D # Ungewichtete univariate Statistiken
##D # Häufigkeitstabelle zu 'eltausb' und 'migrant' (Kreuztabelle)
##D tab1 <- table(dat.roh[,c("eltausb","migrant")],useNA = "always")
##D # Ausgabe der Tabelle, ergänzt um Randsummen
##D addmargins(tab1, FUN = list(Total = sum), quiet = TRUE)
##D 
##D # Ausgabe der Tabelle als Prozentverteilungen 
##D # (in Prozent, gerundet)
##D round(addmargins(prop.table(x = tab1), FUN = list(Total = sum), 
##D   quiet = TRUE)*100,2)
##D 
##D # Ausgabe mit Prozentverteilungen der Spalten bzw. Zeilen 
##D # (in Prozent, gerundet)
##D round(prop.table(x = tab1,margin = 2)*100,2)
##D round(prop.table(x = tab1,margin = 1)*100,2)
##D # Ausgabe nicht wiedergegeben
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.1, Listing 2: Gewichtete univariate 
##D # Statistiken an imputierten Daten
##D 
##D 
##D # Gewichtete univariate Statistiken an imputierten Daten
##D # Häufigkeitstabelle zu 'eltausb' und 'migrant'
##D res1 <- BIFIE.freq(BIFIEobj = dat,vars = c("eltausb","migrant"))
##D summary(res1)
##D # Häufigkeitstabelle zu 'eltausb' gruppiert nach 'migrant'
##D res2 <- BIFIE.freq(BIFIEobj = dat,vars = "eltausb",
##D                    group = "migrant")
##D summary(res2)
##D # Kreuztabelle mit zwei Variablen
##D res3 <- BIFIE.crosstab(BIFIEobj = dat,vars1 = "eltausb",
##D                       vars2 = "migrant")
##D summary(res3)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.1, Listing 3: Export der Tabelle
##D #
##D 
##D res_export <- res1$stat[,c("var","varval","Ncases","Nweight", 
##D   "perc","perc_SE")]
##D colnames(res_export) <- c("Variable","Wert","N (ungewichtet)",
##D  "N gewichtet)","Prozent","Standardfehler")
##D write.table(x = res_export,file = "res_export.dat", sep = ";",
##D             dec = ",", row.names = FALSE)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.6.2: Analyse fehlender Werte
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.2, Listing 1: Fehlende Werte
##D #
##D 
##D res1 <- BIFIE.mva(dat, missvars = c("eltausb","migrant"), 
##D                   se = TRUE)
##D summary(res1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.2, Listing 2: Fehlende Werte unter Kovariaten
##D #
##D 
##D res2 <- BIFIE.mva(dat,missvars = c("eltausb","migrant"), 
##D   covariates = c("E8RTWLE","eltausb", "migrant"), se = TRUE)   
##D summary(res2)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.6.3: Mittelwerte, Perzentilbaender und Quantile
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.3, Listing 1: Hilfsvariable
##D #
##D 
##D # Hilfsvariable zur Gruppierung anlegen
##D transform.formula <- as.formula("~ 0 + I(migrant*10+female)")
##D dat <- BIFIE.data.transform(dat,transform.formula,
##D                   varnames.new="migrant_female")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.3, Listing 2: Statistiken an Hilfsvariablen
##D #
##D 
##D # Univariate Statistiken mit Mittelwerten und Standardfehlern
##D res1 <- BIFIE.univar(BIFIEobj = dat,vars = "E8RPV",
##D                     group = "migrant_female")
##D # summary(res1)
##D mittelwerte<-res1$stat[,c("groupval","M","M_SE")]
##D 
##D # Berechne Quantile
##D probs<-c(.05,.25,.75,.95)
##D res2 <- BIFIE.ecdf(BIFIEobj = dat,breaks = probs,
##D                    quanttype = 1, vars = "E8RPV", 
##D                    group = "migrant_female")
##D # summary(res2)
##D quantile<-data.frame(t(matrix(res2$output$ecdf,nrow = 4)))
##D colnames(quantile)<-probs
##D # Führe Ergebnisse zusammen
##D res3<-cbind(mittelwerte,quantile)
##D print(res3)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.3, Listing 3: IQA
##D #
##D 
##D # Berechne Interquartilabstand (IQA)
##D res3$IQA<-res3$"0.75"-res3$"0.25"
##D # Berechne Grenzen des Vertrauensintervals
##D res3$VIunten<-res3$M-2*res3$M_SE
##D res3$VIoben<-res3$M+2*res3$M_SE
##D round(res3,1)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 10.6.4: Gruppenvergleiche mit Regressionen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.4, Listing 1: Gruppenvergleich Geschlecht
##D #
##D 
##D # Gruppenvergleich Geschlecht, gesamte Population
##D res1 <- BIFIE.linreg(BIFIEobj = dat, formula = E8RPV ~ female)
##D # Alternativer Aufruf mit identischem Resultat
##D res1 <- BIFIE.linreg(BIFIEobj = dat,dep = "E8RPV", 
##D                      pre = c("one","female"))
##D                      
##D # Vollständige Ausgabe
##D summary(res1)
##D 
##D # Reduzierte Ausgabe der Ergebnisse
##D res1_short <- res1$stat[res1$stat$parameter == "b" &
##D             res1$stat$var == "female",c("est","SE")]
##D colnames(res1_short) <- c("Geschlechterunterschied","SE")
##D res1_short
##D 
##D # Gruppenvergleich Geschlecht getrennt nach 'migrant'
##D res2 <- BIFIE.linreg(BIFIEobj = dat,
##D                     formula = E8RPV ~ female,
##D                     group = "migrant")
##D # Vollständige Ausgabe
##D summary(res2)
##D 
##D # Reduzierte Ausgabe der Ergebnisse
##D res2_short <- res2$stat[res2$stat$parameter == "b" &
##D                         res2$stat$var == "female",
##D                       c("groupval","est","SE")]
##D colnames(res2_short) <- c("Migrant","Geschlechterunterschied",
##D                           "SE")
##D res2_short
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.4, Listing 2: Wald-Test
##D #
##D 
##D res3 <- BIFIE.univar(vars = "E8RPV",BIFIEobj = dat, 
##D                      group = c("migrant","female"))
##D res3_wald <- BIFIE.univar.test(BIFIE.method = res3)
##D 
##D # summary(res3_wald)
##D res3_wald$stat.dstat[,c("group","groupval1","groupval2",
##D                         "M1","M2","d","d_SE","d_t","d_p")]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 10.6.4, Listing 3: Kontrolle um soziale Herkunft
##D #
##D 
##D # Gruppenvergleich ohne Berücksichtigung der sozialen Herkunft
##D res1 <- BIFIE.linreg(BIFIEobj = dat, formula = E8RPV ~ migrant)
##D # summary(res1)
##D res1$stat[res1$stat$parameter == "b" & res1$stat$var == "migrant",
##D          c("groupval","est","SE")]
##D 
##D # Gruppenvergleich mit Berücksichtigung der sozialen Herkunft
##D res2 <- BIFIE.linreg(BIFIEobj = dat,
##D                     formula = E8RPV ~ migrant+HISEI+eltausb+buch)
##D # summary(res2)
##D res2$stat[res2$stat$parameter == "b" & res2$stat$var == "migrant",
##D          c("groupval","est","SE")]
##D 
## End(Not run)



