### R code from vignette source 'GLIDE.Rnw'

###################################################
### code chunk number 1: loadLibrary
###################################################

library(GLIDE)


###################################################
### code chunk number 2: data
###################################################
data(simdata)
ls()


###################################################
### code chunk number 3: genotype_columns
###################################################
genotype_columns=which(grepl("^SNP",colnames(simdat)))


###################################################
### code chunk number 4: formula
###################################################
formula=as.formula("outcome~age+sex+pc1+pc2+pc3")
formula


###################################################
### code chunk number 5: out
###################################################
out=glide(formula=formula,exposure_coeff=coeff,genotype_columns,data=simdat,np=100000,
qcutoff=0.2,parallel=TRUE,corenumber=4,verbose=TRUE)
head(out)


###################################################
### code chunk number 6: GLIDE.Rnw:104-108
###################################################
cat('\\begin{figure}[h]\n')
file = "./plot.png"
cat('\\includegraphics{', file, '}\n', sep = '')
cat('\\end{figure}\n')


###################################################
### code chunk number 7: sessionInfo
###################################################
sessionInfo()


