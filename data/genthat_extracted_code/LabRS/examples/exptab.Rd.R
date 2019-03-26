library(LabRS)


### Name: exptab
### Title: Esporta una o piu' tabelle in un unico file csv (standard
###   italiano)
### Aliases: exptab

### ** Examples

data("MYSLID")
tab1 = tabfreq(MYSLID$Genere)
tab2 = tabcont(MYSLID$Lingua, MYSLID$Genere)
# una tabella
exptab(list(tab1), file = "tabelle.csv")
# tabelle diverse con didascalie
exptab(list(tab1, tab2), file = "tabelle.csv",
        dids = c("Genere", "Lingua parlata per Genere"),
        aggiungi = TRUE)



