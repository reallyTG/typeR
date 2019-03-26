### R code from vignette source 'msnid_vignette.Rnw'

###################################################
### code chunk number 1: style
###################################################
BiocStyle::latex(use.unsrturl=FALSE)


###################################################
### code chunk number 2: msnid_vignette.Rnw:92-94
###################################################
library("MSnID")
msnid <- MSnID(".")


###################################################
### code chunk number 3: msnid_vignette.Rnw:100-105
###################################################
PSMresults <- read.delim(system.file("extdata", "human_brain.txt",
                                            package="MSnID"),
                                stringsAsFactors=FALSE)
psms(msnid) <- PSMresults
show(msnid)


###################################################
### code chunk number 4: msnid_vignette.Rnw:110-113
###################################################
mzids <- system.file("extdata", "c_elegans.mzid.gz", package="MSnID")
msnid <- read_mzIDs(msnid, mzids)
show(msnid)


###################################################
### code chunk number 5: msnid_vignette.Rnw:127-128
###################################################
sort(MSnID:::.mustBeColumns)


###################################################
### code chunk number 6: msnid_vignette.Rnw:131-132
###################################################
names(msnid)


###################################################
### code chunk number 7: msnid_vignette.Rnw:155-156
###################################################
show(msnid)


###################################################
### code chunk number 8: msnid_vignette.Rnw:171-172
###################################################
msnid <- assess_termini(msnid, validCleavagePattern="[KR]\\.[^P]")


###################################################
### code chunk number 9: msnid_vignette.Rnw:176-177
###################################################
msnid <- assess_missed_cleavages(msnid, missedCleavagePattern="[KR](?=[^P$])")


###################################################
### code chunk number 10: missedCleavages
###################################################
pepCleav <- unique(psms(msnid)[,c("numMissCleavages", "isDecoy", "peptide")])
pepCleav <- as.data.frame(table(pepCleav[,c("numMissCleavages", "isDecoy")]))
library("ggplot2")
ggplot(pepCleav, aes(x=numMissCleavages, y=Freq, fill=isDecoy)) +
    geom_bar(stat='identity', position='dodge') +
    ggtitle("Number of Missed Cleavages")


###################################################
### code chunk number 11: msnid_vignette.Rnw:198-199
###################################################
msnid$numCys <- sapply(lapply(strsplit(msnid$peptide,''),'==','C'),sum)


###################################################
### code chunk number 12: lengths
###################################################
msnid$PepLength <- nchar(msnid$peptide) - 4
pepLen <- unique(psms(msnid)[,c("PepLength", "isDecoy", "peptide")])
ggplot(pepLen, aes(x=PepLength, fill=isDecoy)) +
    geom_histogram(position='dodge', binwidth=3) +
    ggtitle("Distribution on of Peptide Lengths")


###################################################
### code chunk number 13: msnid_vignette.Rnw:227-228
###################################################
show(msnid)


###################################################
### code chunk number 14: msnid_vignette.Rnw:231-233
###################################################
msnid <- apply_filter(msnid, "numIrregCleavages == 0")
show(msnid)


###################################################
### code chunk number 15: msnid_vignette.Rnw:236-238
###################################################
msnid <- apply_filter(msnid, "numMissCleavages <= 2")
show(msnid)


###################################################
### code chunk number 16: ppmOriginal
###################################################
ppm <- mass_measurement_error(msnid)
ggplot(as.data.frame(ppm), aes(x=ppm)) +
    geom_histogram(binwidth=100)


###################################################
### code chunk number 17: deltaMass
###################################################
dM <- with(psms(msnid),
    (experimentalMassToCharge-calculatedMassToCharge)*chargeState)
x <- data.frame(dM, isDecoy=msnid$isDecoy)
ggplot(x, aes(x=dM, fill=isDecoy)) +
    geom_histogram(position='stack', binwidth=0.1)


###################################################
### code chunk number 18: ppmCorrectedMass
###################################################
msnid.fixed <- correct_peak_selection(msnid)
ppm <- mass_measurement_error(msnid.fixed)
ggplot(as.data.frame(ppm), aes(x=ppm)) +
    geom_histogram(binwidth=0.25)


###################################################
### code chunk number 19: ppmFiltered20
###################################################
msnid.chopped <- apply_filter(msnid, "abs(mass_measurement_error(msnid)) < 20")
ppm <- mass_measurement_error(msnid.chopped)
ggplot(as.data.frame(ppm), aes(x=ppm)) +
    geom_histogram(binwidth=0.25)


###################################################
### code chunk number 20: ppmRecalibrated
###################################################
msnid <- recalibrate(msnid.chopped)
ppm <- mass_measurement_error(msnid)
ggplot(as.data.frame(ppm), aes(x=ppm)) +
    geom_histogram(binwidth=0.25)


###################################################
### code chunk number 21: msmsScoreDistribution
###################################################
msnid$msmsScore <- -log10(msnid$`MS-GF:SpecEValue`)
params <- psms(msnid)[,c("msmsScore","isDecoy")]
ggplot(params) +
    geom_density(aes(x = msmsScore, color = isDecoy, ..count..))


###################################################
### code chunk number 22: absPpmDistribution
###################################################
msnid$absParentMassErrorPPM <- abs(mass_measurement_error(msnid))
params <- psms(msnid)[,c("absParentMassErrorPPM","isDecoy")]
ggplot(params) +
    geom_density(aes(x = absParentMassErrorPPM, color = isDecoy, ..count..))


###################################################
### code chunk number 23: msnid_vignette.Rnw:369-373
###################################################
filtObj <- MSnIDFilter(msnid)
filtObj$absParentMassErrorPPM <- list(comparison="<", threshold=10.0)
filtObj$msmsScore <- list(comparison=">", threshold=10.0)
show(filtObj)


###################################################
### code chunk number 24: msnid_vignette.Rnw:377-380
###################################################
evaluate_filter(msnid, filtObj, level="PSM")
evaluate_filter(msnid, filtObj, level="peptide")
evaluate_filter(msnid, filtObj, level="accession")


###################################################
### code chunk number 25: msnid_vignette.Rnw:396-400
###################################################
filtObj.grid <- optimize_filter(filtObj, msnid, fdr.max=0.01,
                                method="Grid", level="peptide",
                                n.iter=500)
show(filtObj.grid)


###################################################
### code chunk number 26: msnid_vignette.Rnw:406-410
###################################################
filtObj.nm <- optimize_filter(filtObj.grid, msnid, fdr.max=0.01,
                                method="Nelder-Mead", level="peptide",
                                n.iter=500)
show(filtObj.nm)


###################################################
### code chunk number 27: msnid_vignette.Rnw:417-419
###################################################
evaluate_filter(msnid, filtObj, level="peptide")
evaluate_filter(msnid, filtObj.nm, level="peptide")


###################################################
### code chunk number 28: msnid_vignette.Rnw:423-425
###################################################
msnid <- apply_filter(msnid, filtObj.nm)
show(msnid)


###################################################
### code chunk number 29: msnid_vignette.Rnw:430-434
###################################################
msnid <- apply_filter(msnid, "isDecoy == FALSE")
show(msnid)
msnid <- apply_filter(msnid, "!grepl('Contaminant',accession)")
show(msnid)


###################################################
### code chunk number 30: msnid_vignette.Rnw:442-444
###################################################
psm.df <- psms(msnid)
psm.dt <- as(msnid, "data.table")


###################################################
### code chunk number 31: msnid_vignette.Rnw:448-454
###################################################
peps <- peptides(msnid)
head(peps)
prots <- accessions(msnid)
head(prots)
prots <- proteins(msnid) # may be more intuitive then accessions
head(prots)


###################################################
### code chunk number 32: convertingToMSnSet
###################################################
msnset <- as(msnid, "MSnSet")
library("MSnbase")
head(fData(msnset))
head(exprs(msnset))


###################################################
### code chunk number 33: msnid_vignette.Rnw:479-486
###################################################
msnset <- combineFeatures(msnset,
                            fData(msnset)$accession,
                            redundancy.handler="unique",
                            fun="sum",
                            cv=FALSE)
head(fData(msnset))
head(exprs(msnset))


###################################################
### code chunk number 34: msnid_vignette.Rnw:491-492
###################################################
unlink(".Rcache", recursive=TRUE)


