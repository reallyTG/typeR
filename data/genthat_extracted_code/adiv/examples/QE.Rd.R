library(adiv)


### Name: QE
### Title: Quadratic Entropy
### Aliases: QE discomQE
### Keywords: models

### ** Examples

data(ecomor, package="ade4")
dtaxo <- dist.taxo(ecomor$taxo)
QE(t(ecomor$habitat), dtaxo, formula="EDI")
QE(t(ecomor$habitat), dtaxo^2/2, formula="QE")
table.value(as.matrix(discomQE(t(ecomor$habitat), dtaxo, formula="EDI")))
EDIcom <- discomQE(t(ecomor$habitat), dtaxo, formula="EDI")
QEcom <- discomQE(t(ecomor$habitat), dtaxo^2/2, formula="QE")
QEcom 
EDIcom^2/2

bird.QE <- QE(t(ecomor$habitat), dtaxo, formula="EDI")
dotchart(bird.QE$diversity, labels = rownames(bird.QE))

data(humDNAm, package="ade4")
QE(t(humDNAm$samples), humDNAm$distances/2, formula="QE")
QE(t(humDNAm$samples), sqrt(humDNAm$distances), formula="EDI")
QEhumDNA.dist <- discomQE(t(humDNAm$samples), 
humDNAm$distances/2, humDNAm$structures)
is.euclid(QEhumDNA.dist$communities)
is.euclid(QEhumDNA.dist$regions)

EDIhumDNA.dist <- discomQE(t(humDNAm$samples), 
sqrt(humDNAm$distances), humDNAm$structures, formula="EDI")
is.euclid(EDIhumDNA.dist$communities)
is.euclid(EDIhumDNA.dist$regions)

QEhumDNA.dist$communities
EDIhumDNA.dist$communities^2/2

hum.QE <- QE(t(humDNAm$samples), humDNAm$distances/2, formula="QE")
dotchart(hum.QE$diversity, labels = rownames(hum.QE))



