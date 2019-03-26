library(LSAmitR)


### Encoding: UTF-8

### Name: Kapitel  2
### Title: Kapitel 2: Stichprobenziehung
### Aliases: 'Kapitel 2'

### ** Examples

data(datenKapitel02)
schueler <- datenKapitel02$schueler
schule <- datenKapitel02$schule
set.seed(20150506)

## Not run: 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.1: Stratifizierung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.1, Listing 1
##D 
##D # Information in Strata
##D strata <- aggregate(schule[,"NSchueler", drop = FALSE],
##D                     by=schule[,"stratum", drop = FALSE], sum)
##D colnames(strata)[2] <- "NSchuelerStratum"
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.2: Schulenziehung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 1
##D 
##D # Dummyvariable Klassenziehung
##D schule$Klassenziehung <- 0
##D schule[which(schule$NKlassen>3), "Klassenziehung"] <- 1
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 2
##D 
##D # erwarteter Beitrag zur Stichprobe pro Schule 
##D schule$NSchueler.erw <- schule$NSchueler
##D ind <- which(schule$Klassenziehung == 1)
##D schule[ind, "NSchueler.erw"] <- 
##D   schule[ind, "NSchueler"]/schule[ind, "NKlassen"]*3
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 3
##D 
##D # relativer Anteil Schüler pro Schule
##D temp <- merge(schule[, c("SKZ","stratum","NSchueler")], 
##D               strata[, c("stratum","NSchuelerStratum")])
##D schule$AnteilSchueler <- 
##D   temp$NSchueler/temp$NSchuelerStratum
##D # mittlere Anzahl von Schülern pro Schule
##D strata$"NSchueler/Schule.erw" <- 
##D   rowsum(apply(schule, 1, function(x)
##D     x["NSchueler.erw"]*x["AnteilSchueler"]), schule$stratum)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 4
##D 
##D # Bestimmung Anzahl zu ziehender Schulen
##D strata$Schulen.zu.ziehen <- 
##D   round(2500/strata[,"NSchueler/Schule.erw"])
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 5
##D 
##D # Schulenliste nach Stratum und Groesse ordnen
##D schule <- 
##D   schule[order(schule$stratum, schule$NSchueler),]
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 6
##D 
##D # Berechnung Sampling-Intervall
##D strata$Samp.Int <- 
##D   strata$NSchuelerStratum/strata$Schulen.zu.ziehen
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 7
##D 
##D # Startwerte bestimmen
##D strata$Startwert <- 
##D   sapply(ceiling(strata$Samp.Int), sample, size = 1)
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 8
##D 
##D # Schüler-Tickets
##D tickets <- sapply(1:4, function(x)
##D   trunc(0:(strata[strata$stratum==x,"Schulen.zu.ziehen"]-1)
##D   * strata[strata$stratum==x, "Samp.Int"] +
##D     strata$Startwert[x]))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 9
##D 
##D # kummulierte Schüleranzahl pro Stratum berechnen
##D schule$NSchuelerKum <- 
##D   unlist(sapply(1:4, function(x)
##D     cumsum(schule[schule$stratum==x, "NSchueler"])))
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 10
##D 
##D # Schulen ziehen
##D schule$SInSamp <- 0 
##D for(s in 1:4) {
##D   NSchuelerKumStrat <- 
##D     schule[schule$stratum==s, "NSchuelerKum"]
##D   inds <- sapply(tickets[[s]], function(x)
##D     setdiff(which(NSchuelerKumStrat <= x),
##D             which(NSchuelerKumStrat[-1] <= x)))
##D   schule[schule$stratum==s, "SInSamp"][inds] <- 1 }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.2, Listing 11
##D 
##D # Berechnung Ziehungswahrscheinlichkeit Schule
##D temp <- merge(schule[, c("stratum", "AnteilSchueler")],
##D   strata[, c("stratum", "Schulen.zu.ziehen")])
##D schule$Z.Wsk.Schule <- 
##D   temp$AnteilSchueler*temp$Schulen.zu.ziehen
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.3: Klassenziehung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.3, Listing 1
##D 
##D ### Klassenziehung (Alternative 2)
##D schukla <- unique(merge(
##D   schule[, c("SKZ","NKlassen", "Klassenziehung", 
##D     "Z.Wsk.Schule", "SInSamp")],
##D     schueler[, c("SKZ", "idclass")], by="SKZ"))
##D schukla$KlInSamp <- 0
##D for(skz in unique(schukla[schukla$SInSamp==1,"SKZ"])) {
##D   temp <- schukla[schukla$SKZ==skz, "idclass"]
##D   schukla[schukla$idclass%in%temp[sample.int(
##D     min(3, length(temp)))], "KlInSamp"] <- 1 }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.3, Listing 2
##D 
##D # Ziehungswahrscheinlichkeit Klasse 
##D schukla$Z.Wsk.Klasse <- ((1 - schukla$Klassenziehung) * 1 + 
##D      schukla$Klassenziehung * 3 / schukla$NKlassen) 
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 4.4: Gewichtung
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4, Listing 1
##D 
##D ### Gewichte
##D schueler <- merge(schueler, schukla[, c("idclass", "KlInSamp", "Z.Wsk.Schule", 
##D                                         "Z.Wsk.Klasse")],
##D                   by="idclass", all.x=T)
##D # Ziehungswahrscheinlichkeiten Schueler 
##D schueler$Z.Wsk.Schueler <- 
##D   schueler$Z.Wsk.Schule * schueler$Z.Wsk.Klasse
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4, Listing 2
##D 
##D schueler <- schueler[schueler$KlInSamp==1,]
##D # Nonresponse Adjustment 
##D temp <- merge(schueler[, c("idclass", "Z.Wsk.Schueler")],
##D   aggregate(schueler$teilnahme, 
##D     by=list(schueler$idclass),
##D     function(x) sum(x)/length(x)), 
##D   by.x="idclass", by.y="Group.1")
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4, Listing 3
##D 
##D # Schülergewichte
##D schueler$studwgt <- 1/temp$x/temp$Z.Wsk.Schueler
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 4.4, Listing 4
##D 
##D # Normierung
##D Normierung <- strata$NSchuelerStratum / 
##D   rowsum(schueler$studwgt * schueler$teilnahme,
##D          group = schueler$Stratum)
##D schueler$NormStudwgt <- 
##D   schueler$studwgt * Normierung[schueler$Stratum]
##D 
##D ## -------------------------------------------------------------
##D ## Abschnitt 5.3: Jackknife-Repeated-Replication
##D ## -------------------------------------------------------------
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3, Listing 1
##D 
##D ### Ergänzung zum Buch: Hilfsfunktion zones.within.stratum
##D zones.within.stratum <- function(offset,n.str) {
##D   maxzone <- offset-1+floor(n.str/2)
##D   zones <- sort(rep(offset:maxzone,2))
##D   if (n.str %% 2 == 1) zones <- c(zones,maxzone)
##D   return(zones) }
##D ### Ende der Ergänzung
##D 
##D # Sortieren der Schulliste (explizite und implizite Strata)
##D schule <- schule[schule$SInSamp==1,]
##D schule <- schule[order(schule$stratum,-schule$NSchueler),]
##D 
##D # Unterteilung in Pseudostrata 
##D cnt.strata <- length(unique(schule$stratum))
##D offset <- 1
##D jkzones.vect <- integer()
##D for (i in 1:cnt.strata) {
##D   n.str <- table(schule$stratum)[i]
##D   jkzones.vect <- 
##D     c(jkzones.vect,zones.within.stratum(offset,n.str))
##D   offset <- max(jkzones.vect)+1 }
##D schule$jkzone <- jkzones.vect
##D 
##D # Zufällige Auswahl von Schulen mit Gewicht 0
##D schule$jkrep <- 1
##D cnt.zones <- max(schule$jkzone)
##D jkrep.rows.null <- integer()
##D for (i in 1:cnt.zones) {
##D   rows.zone <- which(schule$jkzone==i)
##D ### Ergänzung zum Buch: Fallunterscheidung je nach Anzahl Schulen in der Zone
##D   if (length(rows.zone)==2) jkrep.rows.null <- 
##D     c(jkrep.rows.null,sample(rows.zone,size=1))
##D   else {
##D       num.null <- sample(1:2,size=1)
##D       jkrep.rows.null <- 
##D         c(jkrep.rows.null,sample(rows.zone,size=num.null)) 
##D     } }
##D schule[jkrep.rows.null,]$jkrep <- 0
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3, Listing 2
##D 
##D # Übertragung auf Schülerebene
##D schueler <- 
##D   merge(schueler,schule[,c("SKZ","jkzone","jkrep")],all.x=TRUE)
##D # Schleife zur Generierung von Replicate Weights
##D for (i in 1:cnt.zones) {
##D   in.zone <- as.numeric(schueler$jkzone==i)
##D   schueler[paste0("w_fstr",i)] <-   # vgl. Formel 5
##D     in.zone * schueler$jkrep * schueler$NormStudwgt * 2 +
##D     (1-in.zone) * schueler$NormStudwgt }
##D 
##D # -------------------------------------------------------------
##D # Abschnitt 5.3, Listing 3
##D 
##D # Schätzung mittels Gesamtgewicht
##D n.female <- sum(schueler[schueler$female==1,]$NormStudwgt)
##D perc.female <- n.female / sum(schueler$NormStudwgt)
##D # wiederholte Berechnung und Varianz
##D var.jrr = 0
##D for (i in 1:cnt.zones) {
##D   n.female.rep <- 
##D     sum(schueler[schueler$female==1,paste0("w_fstr",i)])
##D   perc.female.rep <- 
##D     n.female.rep / sum(schueler[paste0("w_fstr",i)])
##D   var.jrr <-   # vgl. Formel 6
##D     var.jrr + (perc.female.rep - perc.female) ^ 2.0 }
## End(Not run) 



