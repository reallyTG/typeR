library(NADA)


### Name: cenfit-methods
### Title: Methods for function cenfit in Package NADA
### Aliases: cenfit-methods cenfit,formula,missing,missing-method
###   cenfit,Cen,missing,missing-method
###   cenfit,numeric,logical,missing-method
###   cenfit,numeric,logical,factor-method
### Keywords: methods

### ** Examples

    data(Atrazine)

    cenfit(Atrazine$Atra, Atrazine$AtraCen)
    cenfit(Atrazine$Atra, Atrazine$AtraCen, Atrazine$Month)

    cenfit(Cen(Atrazine$Atra, Atrazine$AtraCen))
    cenfit(Cen(Atrazine$Atra, Atrazine$AtraCen)~Atrazine$Month)



