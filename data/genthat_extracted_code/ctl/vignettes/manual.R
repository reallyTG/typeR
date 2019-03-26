### R code from vignette source 'manual.Rnw'

###################################################
### code chunk number 1: manual.Rnw:38-40
###################################################
options(width=87, digits=3, scipen=4)
set.seed(61777369)


###################################################
### code chunk number 2: manual.Rnw:155-160 (eval = FALSE)
###################################################
##   setwd("/Path/To/Data/")
##   genotypes <- read.csv("genotypes.csv",row.names=1, header=FALSE, sep="\t")
##   traits <- read.csv("phenotypes.csv",row.names=1, header=FALSE, sep="\t")
##   genotypes[1:5,1:10]    #Show 5 individuals, 10 markers
##   traits[1:5,1:10]       #Show 5 individuals, 10 traits


###################################################
### code chunk number 3: manual.Rnw:170-174 (eval = FALSE)
###################################################
## require(qtl)        #Loads the R/qtl package
## data(multitrait)    #Loads the dataset
## multitrait          #Print basic dataset information
## ?read.cross         #List of formats supported by R/qtl


###################################################
### code chunk number 4: manual.Rnw:196-198 (eval = FALSE)
###################################################
## mapinfo <- read.csv("mapinfo.csv",row.names=1,col.names=TRUE)
## mapinfo[1:5,1:3]     #Show the first 5 marker records


###################################################
### code chunk number 5: manual.Rnw:208-215 (eval = FALSE)
###################################################
## require(ctl)                     #Loads the R/ctl package
## data(ath.metabolites)            #Loads the example dataset
## geno   <- ath.metab$genotypes    #Short name
## traits <- ath.metab$phenotypes   #Short name
## 
## # Scan all phenotypes against each other for CTLs, using the default options
## ctls   <- CTLscan(geno,traits)


###################################################
### code chunk number 6: manual.Rnw:220-223 (eval = FALSE)
###################################################
## library(qtl)
## data(multitrait)
## ctls   <- CTLscan.cross(multitrait)


###################################################
### code chunk number 7: manual.Rnw:245-248 (eval = FALSE)
###################################################
## ctls_quick_scan1      <- CTLscan(geno, traits)
## ctls_quick_scan2      <- CTLscan(geno, traits, strategy = "Full", n.perm=100)
## ctls_for_publication  <- CTLscan(geno, traits, strategy = "Full", n.perm=15000)


###################################################
### code chunk number 8: manual.Rnw:256-257 (eval = FALSE)
###################################################
## ctls_quicker_scan <- CTLscan(geno, traits, nthreads = 4)


###################################################
### code chunk number 9: manual.Rnw:266-267 (eval = FALSE)
###################################################
## ctls_parametric_scan <- CTLscan(geno, traits, parametric = TRUE)


###################################################
### code chunk number 10: manual.Rnw:279-280 (eval = FALSE)
###################################################
## ctls_uncorrected_scan <- CTLscan(geno, traits, adjust = FALSE)


###################################################
### code chunk number 11: manual.Rnw:290-291 (eval = FALSE)
###################################################
## ctls_scan <- CTLscan(geno, traits, verbose = TRUE)


###################################################
### code chunk number 12: manual.Rnw:302-303 (eval = FALSE)
###################################################
## image(ctls,against="markers")


###################################################
### code chunk number 13: manual.Rnw:307-308 (eval = FALSE)
###################################################
## image(ctls,against="phenotypes")


###################################################
### code chunk number 14: manual.Rnw:313-314 (eval = FALSE)
###################################################
## ctls[[1]]


###################################################
### code chunk number 15: manual.Rnw:319-320 (eval = FALSE)
###################################################
## plot(ctls[[1]])


###################################################
### code chunk number 16: manual.Rnw:329-330 (eval = FALSE)
###################################################
## sign <- CTLsignificant(ctl_scan)


###################################################
### code chunk number 17: manual.Rnw:339-340 (eval = FALSE)
###################################################
## ctl_network <- CTLnetwork(ctls, lod.threshold = 5, mapinfo)


###################################################
### code chunk number 18: manual.Rnw:379-380 (eval = FALSE)
###################################################
## ctls <- read.dctl("genotypes.csv","phenotypes.csv",results="<PATH>/output/")


