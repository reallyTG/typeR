library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  8
### Title: Kapitel 8: Fehlende Daten und Plausible Values
### Aliases: 'Kapitel 8'

### ** Examples

library(TAM)
library(mice)
library(miceadds)
library(pls)
library(combinat)
library(mitml)

data(datenKapitel08)
data08H <- datenKapitel08$data08H
data08I <- datenKapitel08$data08I
data08J <- datenKapitel08$data08J
data08K <- datenKapitel08$data08K

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 8.1.1: Konsequenzen fehlender Daten und 
##D ##                  messfehlerbehafteter Variablen
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.1.1, Listing 1: Deskriptive Statistiken des 
##D #                             Illustrationsdatensatzes
##D #
##D 
##D data(datenKapitel08)
##D dat <- datenKapitel08$data08I[,-1]
##D #*** Missinganteile
##D round( colMeans( is.na(dat), na.rm=TRUE) , 2 )     
##D #*** Mittelwerte
##D round( apply( dat , 2 , mean , na.rm=TRUE ) , 2 )   
##D #*** Zusammenhang von Missingindikator und Variablen 
##D round( miceadds::mi_dstat( dat[,c("WLE","X")] ) , 2 )
##D #*** Varianzen
##D round( apply( dat , 2 , var , na.rm=TRUE ) , 2 ) 
##D #*** Korrelationsmatrix
##D round( cor( dat , use = "pairwise.complete.obs") , 2 )
##D 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 8.2: Multiple Imputation
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 1: Variablenauswahl und leere 
##D #                             Imputation
##D #
##D 
##D set.seed(56) 
##D data(datenKapitel08)
##D dat <- datenKapitel08$data08H
##D # wähle Variablen aus 
##D dat1 <- dat[ , c("idschool", "HISEI", "buch", "E8LWLE",
##D                  "SES_Schule") ]
##D colMeans(is.na(dat1)) 
##D # führe leere Imputation durch
##D imp0 <- mice::mice(dat1, m=0, maxit=0)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 2: Spezifikation der Imputations-
##D #                             methoden
##D #
##D 
##D impMethod <- imp0$method 
##D impMethod["HISEI"] <- "2l.continuous" 
##D # [...]  weitere Spezifikationen
##D impMethod["SES_Schule"] <- "2lonly.norm" 
##D impMethod     
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 2b: Ergänzung zum Buch
##D #
##D 
##D # [...]  weitere Spezifikationen
##D impMethod["buch"]  <- "2l.pmm"
##D impMethod
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 3: Definition der Prädiktormatrix 
##D #                             für die Imputation in mice
##D #
##D 
##D predMatrix <- imp0$predictorMatrix 
##D predMatrix[-1,"idschool"] <- -2 
##D # [...]
##D predMatrix    
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 3b: Ergänzung zum Buch
##D #
##D 
##D # [...]
##D predMatrix[2:4,2:4] <- 3*predMatrix[2:4,2:4]
##D predMatrix
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 4: Führe Imputation durch
##D #
##D 
##D imp1 <- mice::mice( dat1, imputationMethod=impMethod, 
##D   predictorMatrix=predMatrix, donors=5, m=10, maxit=7)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.2.5, Listing 4b: Ergänzung zum Buch
##D #
##D 
##D #-- Mittelwert HISEI
##D wmod1 <- with( imp1 , lm(HISEI ~ 1))
##D summary( mice::pool( wmod1 ) )
##D 
##D #-- lineare Regression HISEI auf Büchervariable
##D wmod2 <- with( imp1 , lm(E8LWLE ~ HISEI) )
##D summary( mice::pool( wmod2 ))
##D 
##D #-- Inferenz Mehrebenenmodelle mit Paket mitml
##D imp1b <- mitml::mids2mitml.list(imp1)
##D wmod3 <- with(imp1b, lme4::lmer( HISEI ~ (1|idschool)) )
##D mitml::testEstimates(wmod3, var.comp=TRUE)
##D 
##D ## ------------------------------------------------------------
##D ## Abschnitt 8.3.2: Dimensionsreduzierende Verfahren für 
##D ## Kovariaten im latenten Regressionsmodell
##D ## ------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.2, Listing 1: Kovariatenauswahl, Interaktions- 
##D #                         bildung und Bestimmung PLS-Faktoren
##D #
##D 
##D set.seed(56)
##D data(datenKapitel08)
##D dat <- datenKapitel08$data08J
##D 
##D #*** Kovariatenauswahl
##D kovariaten <- scan(what="character", nlines=2) 
##D   female migrant HISEI  eltausb buch  
##D   SK LF NSchueler NKlassen SES_Schule
##D 
##D X <- scale( dat[, kovariaten ] )
##D V <- ncol(X) 
##D # bilde alle Zweifachinteraktionen 
##D c2 <- combinat::combn(V,2) 
##D X2 <- apply( c2 , 2 , FUN = function(cc){ 
##D             X[,cc[1]] * X[,cc[2]] } ) 
##D X0 <- cbind( X , X2 )
##D # Partial Least Squares Regression
##D mod1 <- pls::plsr( dat$E8LWLE ~ X0 , ncomp=55  ) 
##D summary(mod1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.2, Listing 1b: Ergänzung zum Buch
##D # Abbildung: Aufgeklärter Varianzanteil
##D #
##D 
##D # Principal Component Regression (Extraktion der Hauptkomponenten)
##D mod2 <- pls::pcr(  dat$E8LWLE ~ X0 , ncomp=55 )
##D summary(mod2)
##D 
##D #*** extrahierte Varianzen mit PLS-Faktoren und PCA-Faktoren
##D res <- mod1
##D R2 <- base::cumsum(res$Xvar) / res$Xtotvar
##D ncomp <- 55
##D Y <- dat$E8LWLE
##D R21 <- base::sapply( 1:ncomp , FUN = function(cc){
##D   1 - stats::var( Y -  res$fitted.values[,1,cc] ) / stats::var( Y )
##D } )
##D dfr <- data.frame("comp" = 1:ncomp , "PLS" = R21 )
##D 
##D res <- mod2
##D R2 <- base::cumsum(res$Xvar) / res$Xtotvar
##D ncomp <- 55
##D Y <- dat$E8LWLE
##D R21 <- base::sapply( 1:ncomp , FUN = function(cc){
##D            1 - stats::var( Y -  res$fitted.values[,1,cc] ) / stats::var( Y )
##D } )
##D dfr$PCA <- R21
##D 
##D 
##D plot( dfr$comp , dfr$PLS , type="l" , xlab="Anzahl Faktoren" , 
##D       ylab="Aufgeklärter Varianzanteil" ,
##D       ylim=c(0,.3) )
##D points( dfr$comp , dfr$PLS , pch=16 )        
##D points( dfr$comp , dfr$PCA , pch=17 )        
##D lines( dfr$comp , dfr$PCA , lty=2 )        
##D legend( 45 , .15 , c("PLS" , "PCA") , pch=c(16,17) , lty=c(1,2))
##D 
##D ## ------------------------------------------------------------
##D ## Abschnitt 8.3.3: Ziehung von Plausible Values in R
##D ## ------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 1: PLS-Faktoren auswählen
##D #
##D 
##D facs <- mod1$scores[,1:10]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 1b: Ergänzung zum Buch
##D #
##D set.seed(98766)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 2: Anpassung kognitive Daten
##D #
##D 
##D data(datenKapitel08)
##D dat2 <- datenKapitel08$data08K
##D items <- grep("E8L", colnames(dat2), value=TRUE)
##D # Schätzung des Rasch-Modells in TAM
##D mod11 <- TAM::tam.mml( resp= dat2[,items ] , 
##D        pid = dat2$idstud, pweights = dat2$wgtstud ) 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 3: Individuelle Likelihood, latentes 
##D #                             Regressionsmodell und PV-Ziehung
##D #
##D 
##D #*** extrahiere individuelle Likelihood
##D lmod11 <- IRT.likelihood(mod11) 
##D #*** schätze latentes Regressionsmodell
##D mod12 <- TAM::tam.latreg( like = lmod11 , Y = facs )
##D #*** ziehe Plausible Values 
##D pv12 <- TAM::tam.pv(mod12, normal.approx=TRUE, 
##D                samp.regr=TRUE , ntheta=400)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 4: Plausible Values extrahieren
##D #
##D 
##D #*** Plausible Values für drei verschiedene Schüler
##D round( pv12$pv[c(2,5,9),] , 3 )
##D 
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 8.3.3, Listing 4b: Ergänzung zum Buch
##D #
##D 
##D hist( pv12$pv$PV1.Dim1 )
##D 
##D # Korrelation mit Kovariaten
##D round( cor( pv12$pv$PV1.Dim1 , dat[,kovariaten] , 
##D             use="pairwise.complete.obs") , 3 )
##D round( cor( dat$E8LWLE , dat[,kovariaten] , 
##D             use="pairwise.complete.obs" ) , 3 )
## End(Not run)



