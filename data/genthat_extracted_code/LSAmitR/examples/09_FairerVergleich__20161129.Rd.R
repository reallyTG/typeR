library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  9
### Title: Kapitel 9: Fairer Vergleich in der Rueckmeldung
### Aliases: 'Kapitel 9'

### ** Examples

library(miceadds)
library(glmnet)
library(kerdiest)

covainteraction <- function(dat,covas,nchar){
  for(ii in 1:(length(covas))){
    vv1 <- covas[ii]
    # Interaktion von vv1 mit sich selbst
    subname1 <- substr(vv1,1,nchar)
    intvar <- paste0(subname1, subname1)
    if(vv1 == covas[1]){
      dat.int <- dat[,vv1]*dat[,vv1];
      newvars <- intvar } else {
        dat.int <- cbind(dat.int,dat[,vv1]*dat[,vv1]); 
        newvars <- c(newvars,intvar) 
      }
    # Interaktion von vv1 mit restlichen Variablen
    if(ii < length(covas)){
      for(jj in ((ii+1):length(covas))){
        vv2 <- covas[jj]
        subname2 <- substr(vv2,1,nchar)
        intvar <- paste0(subname1, subname2)
        newvars <- c(newvars, intvar)
        dat.int <- cbind(dat.int,dat[,vv1]*dat[,vv2])
      }
    }
    
  }
  dat.int <- data.frame(dat.int)
  names(dat.int) <- newvars
  return(dat.int)
}

data(datenKapitel09)
dat <- datenKapitel09

# Platzhalter für Leistungsschätzwerte aller Modelle
dat$expTWLE.OLS1 <- NA
dat$expTWLE.OLS2 <- NA
dat$expTWLE.Lasso1 <- NA
dat$expTWLE.Lasso2 <- NA
dat$expTWLE.np <- NA

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 9.2.5, Umsetzung in R
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.1, Listing 1: Kovariatenauswahl und
##D #                               z-Standardisierung
##D #
##D 
##D vars <- c("groesse","female","mig","sozstat")
##D zvars <- paste0("z",vars)
##D dat[,zvars] <- scale(dat[,vars],scale = TRUE)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.1, Listing 2: 
##D #
##D 
##D # Interaktionen bilden, z-standardisieren  
##D dat1 <- LSAmitR::covainteraction(dat = dat,covas = zvars,nchar = 4)
##D intvars <- names(dat1) # Interaktionsvariablen
##D dat1[,intvars] <- scale(dat1[,intvars],scale = TRUE)
##D dat <- cbind(dat,dat1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.1, Listing 3: Modellprädiktoren: Haupt- und
##D #                               Interaktionseffekte
##D #
##D 
##D maineff <- zvars # Haupteffekte 
##D alleff <- c(zvars,intvars) # Haupt- und Interaktionseffekte
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.2, Listing 4: OLS-Regression mit Haupteffekten
##D # 
##D 
##D fm.ols1 <- paste0("TWLE ~ ",paste(maineff,collapse=" + "))
##D fm.ols1 <- as.formula(fm.ols1) # Modellgleichung
##D st <- 4
##D pos <- which(dat$stratum == st) # Schulen im Stratum st
##D ols.mod1 <- lm(formula = fm.ols1,data = dat[pos,]) # Regression
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.3, Listing 5: Lasso-Regression
##D # Datenaufbereitung
##D #
##D 
##D library(glmnet)
##D Z <- as.matrix(dat[pos,alleff]) # Kovariatenmatrix
##D Y <- dat$TWLE[pos] # Abhängige Variable
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.3, Listing 6: Lasso-Regression
##D # Bestimmung Teilmengen für Kreuzvalidierung, Lasso-Regression
##D #
##D 
##D nid <- floor(length(pos)/3) # Teilmengen definieren 
##D foldid <- rep(c(1:nid),3,length.out=length(pos)) # Zuweisung
##D lasso.mod2 <- glmnet::cv.glmnet(x=Z,y=Y,alpha = 1, foldid = foldid)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.3, Listing 7: Lasso-Regression
##D # Erwartungswerte der Schulen
##D #
##D 
##D lasso.pred2 <- predict(lasso.mod2,newx = Z,s="lambda.min")
##D dat$expTWLE.Lasso2[pos] <- as.vector(lasso.pred2)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.3, Listing 8: Lasso-Regression
##D # Bestimmung R^2
##D #
##D 
##D varY <- var(dat$TWLE[pos])
##D varY.lasso.mod2 <- var(dat$expTWLE.Lasso2[pos])
##D R2.lasso.mod2 <- varY.lasso.mod2/varY
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 9: Nichtparametrische Regression
##D # Distanzberechnung zur Schule i (Stratum st)
##D #
##D 
##D N <- length(pos) # Anzahl Schulen im Stratum
##D schools <- dat$idschool[pos] # Schulen-ID
##D i <- 1
##D # Teildatensatz von Schule i
##D dat.i <- dat[pos[i],c("idschool","TWLE",maineff)]
##D names(dat.i) <- paste0(names(dat.i),".i")
##D # Daten der Vergleichsschulen
##D dat.vgl <- dat[pos[-i],c("idschool","TWLE",maineff)]
##D index.vgl <- match(dat.vgl$idschool,schools)
##D # Daten zusammenfügen
##D dfr.i <- data.frame("index.i"=i,dat.i,"index.vgl"=index.vgl,
##D                     dat.vgl, row.names=NULL)
##D # Distanz zur Schule i
##D dfr.i$dist <- 0
##D gi <- c(1,1,1,1)
##D for(ii in 1:length(maineff)){
##D   vv <- maineff[ii]
##D   pair.vv <- grep(vv, names(dfr.i), value=T)
##D   dist.vv <- gi[ii]*((dfr.i[,pair.vv[1]]-dfr.i[,pair.vv[2]])^2)
##D   dfr.i$dist <- dfr.i$dist + dist.vv }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 10: Nichtparametrische Regression
##D #
##D 
##D # H initiieren
##D d.dist <- max(dfr.i$dist)-min(dfr.i$dist)
##D H <- c(seq(d.dist/100,d.dist,length=30),100000)
##D V1 <- length(H) 
##D # Anzahl Vergleichsschulen
##D n <- nrow(dfr.i) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 11: Nichtparametrische Regression
##D # Berechnung der Leave-One-Out-Schätzer der jeweiligen 
##D # Vergleichsschule k nach h in H
##D #
##D 
##D sumw <- 0*H # Vektor w_{ik} initiieren, h in H
##D av <- "TWLE"
##D dfr0.i <- dfr.i[,c("idschool",av)]
##D # Schleife über alle h-Werte
##D for (ll in 1:V1 ){
##D   h <- H[ll]
##D   # Gewicht w_{ik} bei h
##D   dfr.i$wgt.h <- dnorm(sqrt(dfr.i$dist), mean=0, sd=sqrt(h))
##D   # Summe von w_{ik} bei h
##D   sumw[which(H==h)] <- sum(dfr.i$wgt.h)
##D   # Leave-one-out-Schätzer von Y_k
##D   for (k in 1:n){
##D     # Regressionsformel
##D     fm <- paste0(av,"~",paste0(maineff,collapse="+"))
##D     fm <- as.formula(fm)
##D     # Regressionsanalyse ohne Beitrag von Schule k
##D     dfr.i0 <- dfr.i[-k,]
##D     mod.k <- lm(formula=fm,data=dfr.i0,weights=dfr.i0$wgt.h)
##D     # Erwartungswert anhand Kovariaten der Schule k berechnen
##D     pred.k <- predict(mod.k, dfr.i)[k]
##D     dfr0.i[k,paste0( "h_",h) ] <- pred.k
##D }}
##D # Erwartungswerte auf Basis verschiedener h-Werte
##D dfr1 <- data.frame("idschool.i"=dfr.i$idschool.i[1],"h"=H )
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 12: Nichtparametrische Regression
##D # Berechnung des Kreuzvalidierungskriteriums nach h in H
##D #
##D 
##D library(kerdiest)
##D hAL <- kerdiest::ALbw("n",dfr.i$dist) # Plug-in Bandweite
##D dfr.i$cross.h <- hAL
##D dfr.i$crosswgt <- dnorm( sqrt(dfr.i$dist), mean=0, sd = sqrt(hAL) ) 
##D # Kreuzvalidierungskriterium CVh
##D vh <- grep("h_",colnames(dfr0.i),value=TRUE)
##D for (ll in 1:V1){
##D   dfr1[ll,"CVh"] <- sum( (dfr0.i[,av] - dfr0.i[,vh[ll]])^2 * 
##D                            dfr.i$crosswgt) / n}
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 13: Nichtparametrische Regression
##D # Bestimmung optimales Wertes von h (h.min)
##D #
##D 
##D dfr1$min.h.index <- 0
##D ind <-  which.min( dfr1$CVh )
##D dfr1$min.h.index[ind ] <- 1
##D dfr1$h.min <- dfr1$h[ind]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 14: Nichtparametrische Regression
##D # Kleinste Quadratsumme der Schätzfehler
##D #
##D 
##D dfr1$CVhmin <- dfr1[ ind , "CVh" ]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 15: Nichtparametrische Regression
##D # Effizienzsteigerung berechnen
##D #
##D 
##D dfr1$eff_gain <-  100 * ( dfr1[V1,"CVh"] / dfr1$CVhmin[1] - 1 )
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Listing 16: Nichtparametrische Regression
##D # Durchführung der nichtparametrischen Regression bei h=h.min
##D #
##D 
##D h <- dfr1$h.min[1]  # h.min
##D dfr.i$wgt.h <- dnorm(sqrt(dfr.i$dist),sd=sqrt(h))/
##D   dnorm(0,sd= sqrt(h)) # w_{ik} bei h.min      
##D dfr.i0 <- dfr.i
##D # Lokale Regression    
##D mod.ii <- lm(formula=fm,data=dfr.i0,weights=dfr.i0$wgt.h)
##D # Kovariaten Schule i
##D predM <- data.frame(dfr.i[1,paste0(maineff,".i")])    
##D names(predM) <- maineff
##D pred.ii <- predict(mod.ii, predM) # Schätzwert Schule i
##D dat[match(dfr1$idschool.i[1],dat$idschool), "expTWLE.np"] <- pred.ii   
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 9.2.5, Umsetzung in R, Ergänzung zum Buch
##D ## -------------------------------------------------------------
##D 
##D # Korrelationen zwischen Haupteffekten
##D cor(dat[,maineff]) # gesamt
##D # Pro Stratum
##D for(s in 1:4) print(cor(dat[which(dat$stratum == s),maineff]))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.2, Ergänzung zum Buch
##D # OLS-Regression
##D #
##D 
##D # Modellgleichung nur mit Haupteffekten
##D fm.ols1 <- paste0("TWLE ~ ",paste(maineff,collapse=" + "))
##D fm.ols1 <- as.formula(fm.ols1)
##D 
##D # Modellgleichung mit Haupteffekten ohne zgroesse
##D fm.ols1a <- paste0("TWLE ~ ",paste(setdiff(maineff,c("zgroesse")),
##D                                    collapse=" + "))
##D fm.ols1a <- as.formula(fm.ols1a)
##D 
##D # Modellgleichung mit Haupt- und Interaktionseffekten
##D fm.ols2 <- paste0("TWLE ~ ",paste(alleff,collapse=" + "))
##D fm.ols2 <- as.formula(fm.ols2)
##D 
##D # Ergebnistabelle über 4 Strata hinweg vorbereiten
##D tab1 <- data.frame("Variable"=c("(Intercept)",maineff))
##D tab2 <- data.frame("Variable"=c("(Intercept)",alleff))
##D 
##D # Durchführung: Schleife über vier Strata
##D for(st in 1:4){
##D   # st <- 4
##D   # Position Schulen des Stratums st im Datensatz
##D   pos <- which(dat$stratum == st)
##D   
##D   #---------------------------------
##D   # OLS-Modell 1
##D   
##D   # Durchführung
##D   ols.mod1 <- lm(formula = fm.ols1,data = dat[pos,])
##D   ols.mod1a <- lm(formula = fm.ols1a,data = dat[pos,])
##D   
##D   # Modellergebnisse anzeigen
##D   summary(ols.mod1)
##D   summary(ols.mod1a)
##D   
##D   # Erwartungswerte der Schulen 
##D   dat$expTWLE.OLS1[pos] <- fitted(ols.mod1)
##D   
##D   # Ergebnisse in Tabelle speichern
##D   par <- summary(ols.mod1)
##D   tab.s <- data.frame(par$coef,R2=par$r.squared,R2.adj=par$adj.r.squared)
##D   names(tab.s) <- paste0("stratum",st,
##D                          c("_coef","_SE","_t","_p","_R2","_R2.adj"))
##D   tab1 <- cbind(tab1, tab.s)
##D   
##D   # Durchführung OLS-Modell 2
##D   ols.mod2 <- lm(formula = fm.ols2,data = dat[pos,])
##D   
##D   # Modellergebnisse anzeigen
##D   summary(ols.mod2)
##D   
##D   # Erwartungswerte der Schulen
##D   dat$expTWLE.OLS2[pos] <- fitted(ols.mod2)
##D   
##D   # Ergebnisse in Tabelle speichern
##D   par <- summary(ols.mod2)
##D   tab.s <- data.frame(par$coef,R2=par$r.squared,R2.adj=par$adj.r.squared)
##D   names(tab.s) <- paste0("stratum",st,
##D                          c("_coef","_SE","_t","_p","_R2","_R2.adj"))
##D   tab2 <- cbind(tab2, tab.s) 
##D   
##D }
##D 
##D # Daten Schule 1196 ansehen
##D dat[which(dat$idschool == 1196),]
##D 
##D # Schätzwerte nach ols.mod1 und ols.mod2 vergleichen
##D summary(abs(dat$expTWLE.OLS1 - dat$expTWLE.OLS2))
##D cor.test(dat$expTWLE.OLS1,dat$expTWLE.OLS2)
##D 
##D # Grafische Darstellung des Vergleich (Schule 1196 rot markiert)
##D plot(dat$expTWLE.OLS1,dat$expTWLE.OLS2,xlim=c(380,650),ylim=c(380,650),
##D      col=1*(dat$idschool == 1196)+1,pch=15*(dat$idschool == 1196)+1)
##D abline(a=0,b=1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.3, Ergänzung zum Buch
##D # Lasso-Regression
##D #
##D 
##D library(glmnet)
##D 
##D # Variablen für Erwartungswerte
##D dat$expTWLE.Lasso2 <- dat$expTWLE.Lasso1 <- NA
##D 
##D # Tabelle für Modellergebnisse
##D tab3 <- data.frame("Variable"=c("(Intercept)",maineff))
##D tab4 <- data.frame("Variable"=c("(Intercept)",alleff))
##D 
##D for(st in 1:4){
##D   # st <- 4
##D   
##D   # Position Schulen des Stratums st im Datensatz
##D   pos <- which(dat$stratum == st)
##D   
##D   #------------------------------------------------------------#
##D   # Lasso-Regression mit den Haupteffekten
##D   
##D   # Kovariatenmatrix
##D   Z <- as.matrix(dat[pos,maineff])
##D   # Abhängige Variable
##D   Y <- dat$TWLE[pos]
##D   
##D   # Kreuzvalidierung: Teilmengen definieren
##D   nid <- floor(length(pos)/3)
##D   # Schulen zu Teilmengen zuordnen
##D   foldid <- rep(c(1:nid),3,length.out=length(pos))
##D   
##D   # Regression
##D   lasso.mod1 <- cv.glmnet(x=Z,y=Y,alpha = 1, foldid = foldid)
##D   
##D   # Ergebnisse ansehen
##D   print(lasso.mod1)
##D   
##D   # Lasso-Koeffizienten bei lambda.min
##D   print(lasso.beta <- coef(lasso.mod1,s="lambda.min"))
##D   
##D   # Erwartungswerte der Schulen
##D   lasso.pred1 <- predict(lasso.mod1,newx = Z,s="lambda.min")
##D   dat$expTWLE.Lasso1[pos] <- as.vector(lasso.pred1)
##D   
##D   # R2 bestimmen
##D   varY <- var(dat$TWLE[pos])
##D   varY.lasso.mod1 <- var(dat$expTWLE.Lasso1[pos])
##D   print(R2.lasso.mod1 <- varY.lasso.mod1/varY)
##D   
##D   # Ergebnistabelle
##D   vv <- paste0("coef.stratum",st); tab3[,vv] <- NA
##D   tab3[lasso.beta@i+1,vv] <- lasso.beta@x
##D   vv <- paste0("lambda.stratum",st); tab3[,vv] <- lasso.mod1$lambda.min
##D   vv <- paste0("R2.stratum",st); tab3[,vv] <- R2.lasso.mod1
##D   
##D   #------------------------------------------------------------#
##D   # Lasso-Regression mit Haupt- und Interaktionseffekten
##D   
##D   # Kovariatenmatrix
##D   Z <- as.matrix(dat[pos,alleff])
##D   
##D   # Regression
##D   lasso.mod2 <- cv.glmnet(x=Z,y=Y,alpha = 1, foldid = foldid)
##D   
##D   # Ergebnisausdruck
##D   print(lasso.mod2)
##D   
##D   # Lasso-Koeffizienten bei lambda.min
##D   print(lasso.beta <- coef(lasso.mod2,s="lambda.min"))
##D   
##D   # Erwartungswerte der Schulen
##D   lasso.pred2 <- predict(lasso.mod2,newx = Z,s="lambda.min")
##D   dat$expTWLE.Lasso2[pos] <- as.vector(lasso.pred2)
##D   
##D   # R2 bestimmen
##D   varY.lasso.mod2 <- var(dat$expTWLE.Lasso2[pos])
##D   R2.lasso.mod2 <- varY.lasso.mod2/varY
##D   R2.lasso.mod2
##D   
##D   # Ergebnistabelle
##D   vv <- paste0("coef.stratum",st); tab4[,vv] <- NA
##D   tab4[lasso.beta@i+1,vv] <- lasso.beta@x
##D   vv <- paste0("lambda.stratum",st); tab4[,vv] <- lasso.mod2$lambda.min
##D   vv <- paste0("R2.stratum",st); tab4[,vv] <- R2.lasso.mod2
##D   
##D   
##D }
##D 
##D # Regressionresiduen = Schätzung von SChul- und Unterrichtseffekt
##D dat$resTWLE.Lasso1 <- dat$TWLE - dat$expTWLE.Lasso1
##D dat$resTWLE.Lasso2 <- dat$TWLE - dat$expTWLE.Lasso2
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.5.4, Ergänzung zum Buch
##D # Nichtparametrische Regression
##D #
##D 
##D #
##D # Achtung: Der nachfolgende Algorithmus benötigt viel Zeit!
##D # 
##D 
##D av <- "TWLE" # Abhängige Variable
##D dfr3 <- NULL # Ergebnistabelle
##D 
##D # Variable für Leistungsschätzwerte
##D 
##D # Schleife über 4 Strata
##D for(st in 1:4){
##D   # st <- 1
##D   pos <- which(dat$stratum == st)
##D   N <- length(pos)
##D   schools <- dat$idschool[pos]
##D   
##D   ###
##D   # Distanzmatrix dfr für alle Schulen im Stratum erstellen
##D   dfr <- NULL
##D   
##D   for (i in 1:N){
##D     # i <- 1
##D     # Teildatensatz von Schule i
##D     dat.i <- dat[pos[i],c("idschool","TWLE",maineff)]
##D     # Daten der Vergleichsgruppe
##D     dat.vgl <- dat[pos[-i],c("idschool","TWLE",maineff)]
##D     # Variablennamen von dat.vgl umbenennen
##D     # names(dat.vgl) <- paste0("vgl.",names(dat.vgl))
##D     # Variablennamen von dat.i umbenennen
##D     names(dat.i) <- paste0(names(dat.i),".i")
##D     
##D     # Daten zusammenfügen
##D     index.vgl <- match(dat.vgl$idschool,schools)
##D     dfr.i <- data.frame("index.i"=i,dat.i,
##D                         "index.vgl"=index.vgl,dat.vgl,
##D                         row.names=NULL)
##D     
##D     # Distanz zur i
##D     dfr.i$dist <- 0
##D     gi <- c(1,1,1,1)
##D     for(ii in 1:length(maineff)){
##D       vv <- maineff[ii]
##D       pair.vv <- grep(vv, names(dfr.i), value=T)
##D       dist.vv <- gi[ii]*((dfr.i[,pair.vv[1]]-dfr.i[,pair.vv[2]])^2)
##D       dfr.i$dist <- dfr.i$dist + dist.vv
##D     }
##D     
##D     print(i) ; flush.console()
##D     dfr <- rbind( dfr , dfr.i )
##D   }
##D   
##D   dfr1 <- index.dataframe( dfr , systime=TRUE )
##D   
##D   ###
##D   # h-Auswahl und Nichtparametrische Regression pro Schule i
##D   dfr1.list <- list()
##D   for (i in 1:N){
##D     # i <- 1
##D     dfr.i <- dfr[ dfr$index.i == i , ]
##D     n <- nrow(dfr.i)
##D     
##D     # Startwertliste für h initiieren
##D     d.dist <- max(dfr.i$dist)-min(dfr.i$dist)
##D     H <- c(seq(d.dist/100,d.dist,length=30),100000)
##D     V1 <- length(H) # Anzahl der Startwerte in H
##D     
##D     # Startwerte: Summe von w_ik
##D     sumw <- 0*H
##D     dfr0.i <- dfr.i[,c("idschool",av)]
##D     # Schleife über alle h-Werte
##D     for (ll in 1:V1 ){
##D       h <- H[ll]
##D       # Gewicht w_ik bei h
##D       dfr.i$wgt.h <- dnorm(sqrt(dfr.i$dist), mean=0, sd=sqrt(h))
##D       # Summe von w_ik bei h
##D       sumw[which(H==h)] <- sum(dfr.i$wgt.h)
##D       # Leave-one-out-Schätzer von Y_k
##D       for (k in 1:n){
##D         # Regressionsformel
##D         fm <- paste0(av,"~",paste0(maineff,collapse="+"))
##D         fm <- as.formula(fm)
##D         # Regressionsanalyse ohne Beitrag von Schule k
##D         dfr.i0 <- dfr.i[-k,]
##D         mod.k <- lm(formula=fm,data=dfr.i0,weights=dfr.i0$wgt.h)
##D         # Erwartungswert anhand Kovariaten der Schule k berechnen
##D         pred.k <- predict(mod.k, dfr.i)[k]
##D         dfr0.i[k,paste0( "h_",h) ] <- pred.k
##D       }
##D       print(paste0("i=",i,", h_",ll))
##D     }
##D     # Erwartungswerte auf Basis verschiedener h-Werte
##D     dfr1 <- data.frame("idschool.i"=dfr.i$idschool.i[1],"h"=H )
##D     
##D     # Berechnung des Kreuzvalidierungskriteriums
##D     library(kerdiest)
##D     hAL <- kerdiest::ALbw("n",dfr.i$dist) # Plug-in Bandbreite nach Altman und 
##D                                           # Leger
##D     name <- paste0( "bandwidth_choice_school" , dfr.i$idschool.i[1] ,  
##D                      "_cross.h_" , round2(hAL,1) )
##D     # Regressionsgewichte auf Basis cross.h
##D     dfr.i$cross.h <- hAL
##D     dfr.i$crosswgt <- dnorm( sqrt(dfr.i$dist), mean=0, sd = sqrt(hAL) ) 
##D     
##D     dfr.i <- index.dataframe( dfr.i , systime=TRUE )
##D 
##D     # Kreuzvalidierungskriterium CVh
##D     vh <- grep("h_",colnames(dfr0.i),value=TRUE)
##D     for (ll in 1:V1){
##D       # ll <- 5
##D       dfr1[ll,"CVh"] <- sum( (dfr0.i[,av] - dfr0.i[,vh[ll]])^2 * 
##D                                dfr.i$crosswgt) / n
##D       print(ll)
##D     }
##D     
##D     # Bestimmung h.min
##D     dfr1$min.h.index <- 0
##D     ind <-  which.min( dfr1$CVh )
##D     dfr1$min.h.index[ind ] <- 1
##D     dfr1$h.min <- dfr1$h[ind]
##D     # Kleinste Quadratsumme der Schätzfehler
##D     dfr1$CVhmin <- dfr1[ ind , "CVh" ]
##D     
##D     # Effizienzsteigerung berechnen
##D     dfr1$eff_gain <-  100 * ( dfr1[V1,"CVh"] / dfr1$CVhmin[1] - 1 )
##D     
##D     # h auswählen
##D     h <- dfr1$h.min[1]
##D     
##D     # Gewichte anhand h berechnen
##D     dfr.i$wgt.h <- dnorm( sqrt( dfr.i$dist ) , sd = sqrt( h) ) / 
##D                    dnorm( 0 , sd = sqrt( h) )     
##D     dfr.i0 <- dfr.i
##D     mod.ii <- lm(formula = fm,data = dfr.i0,weights = dfr.i0$wgt.h)
##D     
##D     # Leistungsschätzwerte berechnen
##D     predM <- data.frame(dfr.i[1,paste0(maineff,".i")])
##D     names(predM) <- maineff
##D     
##D     pred.ii <- predict( mod.ii ,  predM )
##D     dfr1$fitted_np <- pred.ii  
##D     dfr1$h.min_sumwgt <- sum( dfr.i0$wgt.h )
##D     dfr1$h_sumwgt  <- sumw
##D     
##D     # Leistungsschätzwerte zum Datensatz hinzufügen
##D     dat$expTWLE.np[match(dfr1$idschool.i[1],dat$idschool)] <- pred.ii
##D     dfr1.list[[i]] <- dfr1
##D   }
##D   
##D   ###
##D   # Ergebnisse im Stratum st zusammenfassen
##D   dfr2 <- NULL
##D 
##D   for(i in 1:length(dfr1.list)){
##D     dat.ff <- dfr1.list[[i]]
##D     dfr2.ff <- dat.ff[1,c("idschool.i","h.min","fitted_np","h.min_sumwgt",
##D                           "CVhmin","eff_gain")]
##D     dfr2.ff$CVlinreg <- dat.ff[V1,"CVh"]
##D     names(dfr2.ff) <- c("idschool","h.min","fitted_np","h.min_sumwgt",
##D                         "CVhmin","eff_gain","CVlinreg")
##D     dfr2 <- rbind(dfr2, dfr2.ff)
##D     print(i)
##D   }
##D   
##D   #---------------------------------------------------##
##D   # R2 berechnen
##D   varY <- var(dat$TWLE[pos])
##D   varY.np <- var(dat$expTWLE.np[pos])
##D   dfr2$R2.np <- varY.np/varY
##D   
##D   #---------------------------------------------------##
##D   # Zur Gesamtergebnistabelle
##D   dfr3 <- rbind(dfr3,cbind("Stratum"=st,dfr2))
##D   
##D }
##D 
##D # Effizienz der NP-Regression gegenüber OLS-Regression
##D summary(dfr3$eff_gain)
##D table(dfr3$eff_gain > 5)
##D table(dfr3$eff_gain > 10)
##D table(dfr3$eff_gain > 20)
##D 
##D # Regressionsresiduen
##D dat$resTWLE.np <- dat$TWLE - dat$expTWLE.np
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 9.2.6, Ergänzung zum Buch
##D ## Ergebnisse im Vergleich
##D ## -------------------------------------------------------------
##D 
##D # Output-Variablen
##D out <- grep("expTWLE",names(dat),value=T)
##D lt <- length(out)
##D 
##D # Korrelationsmatrix
##D tab <- tab1 <- as.matrix(round2(cor(dat[,out]),3))
##D 
##D # Varianzmatrix
##D tab2 <- as.matrix(round2(sqrt(var(dat[,out])),1))
##D 
##D tab3 <- matrix(NA,lt,lt)
##D # Differenzmatrix
##D for(ii in 1:(lt-1))
##D   for(jj in (ii+1):lt) tab3[ii,jj] <- round2(mean(abs(dat[,out[jj]] - 
##D                                                       dat[,out[ii]])),1)
##D 
##D tab4 <- matrix(NA,lt,lt)
##D # Differenzmatrix
##D for(ii in 1:(lt-1))
##D   for(jj in (ii+1):lt) tab4[ii,jj] <- round2(sd(abs(dat[,out[jj]] - 
##D                                                     dat[,out[ii]])),1)
##D 
##D # Ergebnistabelle
##D diag(tab) <- diag(tab2)
##D tab[upper.tri(tab)] <- tab3[upper.tri(tab3)]
##D 
##D # R2 Gesamt
##D varY <- var(dat$TWLE)
##D varexp.OLS1 <- var(dat$expTWLE.OLS1); R2.OLS1 <- varexp.OLS1/varY
##D varexp.OLS2 <- var(dat$expTWLE.OLS2); R2.OLS2 <- varexp.OLS2/varY
##D varexp.Lasso1 <- var(dat$expTWLE.Lasso1); R2.Lasso1 <- varexp.Lasso1/varY
##D varexp.Lasso2 <- var(dat$expTWLE.Lasso2); R2.Lasso2 <- varexp.Lasso2/varY
##D varexp.np <- var(dat$expTWLE.np); R2.np <- varexp.np/varY
##D R2 <- c(R2.OLS1,R2.OLS2,R2.Lasso1,R2.Lasso2,R2.np)
##D tab <- cbind(tab,R2)
##D 
##D # R2 pro Stratum
##D dat0 <- dat
##D for(st in 1:4){
##D   # st <- 1
##D   dat <- dat0[which(dat0$stratum == st),]
##D   varY <- var(dat$TWLE)
##D   varexp.OLS1 <- var(dat$expTWLE.OLS1); R2.OLS1 <- varexp.OLS1/varY
##D   varexp.OLS2 <- var(dat$expTWLE.OLS2); R2.OLS2 <- varexp.OLS2/varY
##D   varexp.Lasso1 <- var(dat$expTWLE.Lasso1); R2.Lasso1 <- varexp.Lasso1/varY
##D   varexp.Lasso2 <- var(dat$expTWLE.Lasso2); R2.Lasso2 <- varexp.Lasso2/varY
##D   varexp.np <- var(dat$expTWLE.np); R2.np <- varexp.np/varY
##D   R2 <- c(R2.OLS1,R2.OLS2,R2.Lasso1,R2.Lasso2,R2.np)
##D   tab <- cbind(tab,R2)
##D }
##D 
##D colnames(tab)[7:10] <- paste0("R2_stratum",1:4)
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 9.2.7, Berücksichtigung der Schätzfehler
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.7, Listing 17: Bestimmung des Erwartungsbereichs
##D #
##D 
##D vv <- "expTWLE.OLS1" # Variablenname
##D mm <- "OLS1" # Kurzname des Modells
##D dfr <- NULL # Ergebnistabelle
##D # Schleife über alle möglichen Breite von 10 bis 60
##D for(w in 10:60){
##D   # Variablen für Ergebnisse pro w
##D   var <- paste0(mm,".pos.eb",w) # Position der Schule
##D   var.low <- paste0(mm,".eblow",w) # Untere Grenze des EBs
##D   var.upp <- paste0(mm,".ebupp",w) # Obere Grenze des EBs
##D   # Berechnen
##D   dat[,var.low] <- dat[,vv]-w/2 # Untere Grenze des EBs
##D   dat[,var.upp] <- dat[,vv]+w/2 # Obere Grenze des EBs 
##D   # Position: -1=unterhalb, 0=innerhalb, 1=oberhalb des EBs 
##D   dat[,var] <- -1*(dat$TWLE < dat[,var.low]) + 1*(dat$TWLE > dat[,var.upp])
##D   # Verteilung der Schulpositionen
##D   tmp <- data.frame(t(matrix(prop.table(table(dat[,var])))))
##D   names(tmp) <- c("unterhalb","innerhalb","oberhalb")
##D   tmp <- data.frame("ModellxBereich"=var,tmp); dfr <- rbind(dfr,tmp) }
##D 
##D # Abweichung zur Wunschverteilung 25-50-25 
##D dfr1 <- dfr 
##D dfr1[,c(2,4)] <- (dfr1[,c(2,4)] - .25)^2 
##D dfr1[,3] <- (dfr1[,3] - .5)^2 
##D dfr1$sumquare <- rowSums(dfr1[,-1]) 
##D # Auswahl markieren 
##D dfr$Auswahl <- 1*(dfr1$sumquare == min(dfr1$sumquare) )
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 9.2.7, Ergänzung zum Buch
##D # Bestimmung des Erwartungsbereichs
##D # 
##D 
##D # Ergebnisse aller Schulen werden aus Ursprungsdatensatz geladen.
##D dat <- datenKapitel09 
##D 
##D # Liste der Erwartungswerte-Variablen
##D exp.vars <- grep("expTWLE",names(dat),value=T)
##D # Modellnamen
##D m.vars <- gsub("expTWLE.","",exp.vars, fixed = TRUE)
##D 
##D # Liste der Ergebnistabelle
##D list0 <- list()
##D 
##D # Ergebnisse
##D tab.erg <- NULL
##D 
##D # Schleife über alle Erwartungswerte aller Modelle
##D for(ii in 1:length(exp.vars)){
##D   # ii <- 1
##D   vv <- exp.vars[ii]
##D   mm <- m.vars[ii]
##D   
##D   # Ergebnistabelle
##D   dfr <- NULL
##D   
##D   # Schleife über alle möglichen Breite von 10 bis 60
##D   for(w in 10:60){
##D     # eb <- 10
##D     var <- paste0(mm,".pos.eb",w) # Position der Schule
##D     var.low <- paste0(mm,".eblow",w) # Untere Grenze des EBs
##D     var.upp <- paste0(mm,".ebupp",w) # Obere Grenze des EBs
##D     # Untere Grenze des EBs = Erwartungswert - w/2
##D     dat[,var.low] <- dat[,vv]-w/2
##D     # Obere Grenze des EBs = Erwartungswert + w/2
##D     dat[,var.upp] <- dat[,vv]+w/2
##D     # Position der Schule bestimmen
##D     # -1 = unterhalb, 0 = innterhalb, 1 = oberhalb des EBs
##D     dat[,var] <- -1*(dat$TWLE < dat[,var.low]) + 1*(dat$TWLE > dat[,var.upp])
##D     # Verteilung der Positionen
##D     tmp <- data.frame(t(matrix(prop.table(table(dat[,var])))))
##D     names(tmp) <- c("unterhalb","innerhalb","oberhalb")
##D     tmp <- data.frame("ModellxBereich"=var,tmp)
##D     dfr <- rbind(dfr,tmp)
##D   }
##D   
##D   # Vergleich mit Wunschverteilung 25-50-25
##D   dfr1 <- dfr
##D   dfr1[,c(2,4)] <- (dfr1[,c(2,4)] - .25)^2
##D   dfr1[,3] <- (dfr1[,3] - .5)^2
##D   dfr1$sumquare <- rowSums(dfr1[,-1])
##D   # Auswahl markieren
##D   dfr$Auswahl <- 1*(dfr1$sumquare == min(dfr1$sumquare) )
##D   
##D   # Zum Liste hinzufügen
##D   list0[[ii]] <- dfr
##D   print(dfr[which(dfr$Auswahl == 1),])
##D   tab.erg <- rbind(tab.erg, dfr[which(dfr$Auswahl == 1),])
##D   
##D }
##D 
##D # Nur gewählte Ergebnisse im Datensatz beibehalten
##D all.vars <- grep("eb",names(dat),value=T)
##D # Untere und Obere Grenze mit speichern
##D eb.vars <- tab.erg[,1]
##D low.vars <- gsub("pos.eb","eblow",eb.vars)
##D upp.vars <- gsub("pos.eb","ebupp",eb.vars)
##D del.vars <- setdiff(all.vars, c(eb.vars,low.vars,upp.vars))
##D dat <- dat[,-match(del.vars,names(dat))]
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Appendix: Abbildungen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abbildung 9.4
##D #
##D 
##D # Koeffizienten bei der ersten 50 lambdas ausdrucken
##D # Stratum 4
##D 
##D lambda <- lasso.mod2$lambda[1:50]
##D a <- round2(lambda,2)
##D a1 <- a[order(a)]
##D L <- length(a)
##D 
##D dfr <- NULL
##D 
##D for(ll in 1:L){
##D   dfr.ll <- as.matrix(coef(lasso.mod2,newx = Z,s=a[ll] ))
##D   colnames(dfr.ll) <- paste0("a_",ll)
##D   dfr.ll <- data.frame("coef"=rownames(dfr.ll),dfr.ll)
##D   rownames(dfr.ll) <- NULL
##D   if(ll == 1) dfr <- dfr.ll else dfr <- merge(dfr, dfr.ll)
##D }
##D 
##D # Ohne Intercept
##D dfr <- dfr[-1,]
##D rownames(dfr) <- 1:nrow(dfr)
##D 
##D cl <- colors()
##D cl <- grep("grey",cl,value=T)
##D 
##D # Umgekehrte Reihenfolge
##D dfr1 <- dfr
##D for(x in 2:(L+1)) {dfr1[,x] <- dfr[,(L+3)-x]; 
##D names(dfr1)[x] <- names(dfr)[(L+3)-x]}
##D 
##D ###
##D plot(x = log(a), y = rep(0,L), xlim = rev(range(log(a))), ylim=c(-20,22), 
##D      type = "l", xaxt ="n", xlab = expression(paste(lambda)), 
##D      ylab="Geschätzte Regressionskoeffizienten")
##D axis(1, at=log(a), labels=a,cex=1)
##D 
##D tmp <- nrow(dfr)
##D for(ll in 1:tmp){
##D   # ll <- 1
##D   lines(x=log(a),y=dfr[ll,2:(L+1)],type="l",pch=15-ll,col=cl[15-ll])
##D   points(x=log(a),y=dfr[ll,2:(L+1)],type="p",pch=15-ll)
##D   legend(x=2.8-0.7*(ll>tmp/2),y=25-2*(ifelse(ll>7,ll-7,ll)),
##D          legend =dfr$coef[ll],pch=15-ll,bty="n",cex=0.9)
##D }
##D 
##D # Kennzeichung der gewählten lambda
##D v <- log(lasso.mod2$lambda.min)
##D lab2 <- expression(paste("ausgewähltes ",lambda," = .43"))
##D text(x=v+0.6,y=-8,labels=lab2)
##D 
##D abline(v = v,lty=2,cex=1.2)
##D 
##D # -------------------------------------------------------------
##D # Abbildung 9.5
##D # Auswahl Lambda anhand min(cvm)
##D #
##D 
##D xlab <- expression(paste(lambda))
##D plot(lasso.mod2, xlim = rev(range(log(lambda))), 
##D      ylim=c(550,1300),xlab=xlab,xaxt ="n",
##D      ylab = "Mittleres Fehlerquadrat der Kreuzvalidierung (cvm)",
##D      font.main=1,cex.main=1)
##D axis(1, at=log(a), labels=a,cex=1)
##D 
##D lab1 <- expression(paste(lambda," bei min(cvm)"))
##D text(x=log(lasso.mod2$lambda.min)+0.5,y=max(lasso.mod2$cvm)-50,
##D      labels=lab1,cex=1)
##D 
##D lab2 <- expression(paste("(ausgewähltes ",lambda," = .43)"))
##D text(x=log(lasso.mod2$lambda.min)+0.6,y=max(lasso.mod2$cvm)-100,
##D      labels=lab2,cex=1)
##D 
##D abline(v = log(lasso.mod2$lambda.min),lty=2)
##D 
##D text(x=log(lasso.mod2$lambda.min)-0.3,y = min(lasso.mod2$cvm)-30,
##D      labels="min(cvm)",cex=1 )
##D abline(h = min(lasso.mod2$cvm),lty=2)
##D 
##D text <- expression(paste("Anzahl der Nicht-null-Koeffizienten (",
##D                          lambda," entsprechend)"))
##D mtext(text=text,side=3,line=3)
##D 
##D 
##D # -------------------------------------------------------------
##D # Abbildung 9.6
##D # Rohwert-Schätzwert Schule 1196 & 1217 im Vergleich
##D #
##D 
##D id <- c(1196, 1217)
##D par(mai=c(1.2,3,1,.5))
##D plot(x=rep(NA,2),y=c(1:2),xlim=c(470,610),yaxt ="n",type="l",
##D      xlab="Erwartungswerte je nach Modell und Schulleistung",ylab="")
##D legend <- c("Schulleistung (TWLE)",paste0("", c("OLS1","OLS2","Lasso1",
##D                                                 "Lasso2","NP"),
##D                                           "-Modell"))
##D axis(2, at=c(seq(1,1.4,0.08),seq(1.6,2,0.08)), las=1,cex=0.7,
##D      labels=rep(legend,2))
##D text <- paste0("Schule ",id)
##D mtext(text=text,side=2,at = c(1.2,1.8),line = 10)
##D 
##D exp.vars <- c("TWLE", 
##D               paste0("expTWLE.", c("OLS1","OLS2","Lasso1","Lasso2","np")))
##D 
##D pch = c(19, 0,3,2,4,5)
##D ii <- 1
##D col = c("grey", rep("lightgrey",5))
##D for(vv in exp.vars){
##D   # vv <- "TWLE"
##D   x <- dat0[which(dat0$idschool %in% id),vv]
##D   abline(h = c(0.92+ii*0.08,1.52+ii*0.08), lty=1+1*(ii>1),col=col[ii])
##D   points(x=x,y=c(0.92+ii*0.08,1.52+ii*0.08),type="p",pch=pch[ii])
##D   ii <- ii + 1
##D }
## End(Not run)



