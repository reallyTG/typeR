### R code from vignette source 'rDNAse.Rnw'

###################################################
### code chunk number 1: prelim
###################################################
rDNA.version = '1.1-0'
now.date = strftime(Sys.Date(), "%Y-%m-%d")


###################################################
### code chunk number 2: kmer
###################################################
require(rDNAse)
x = "AATTCATGCGTCCGGACTTCTGCCTCGAGCCGCCGTACACTGGGCCCTGCAAAGCTC"
kmer(x)


###################################################
### code chunk number 3: kmer
###################################################
kmer(x, k = 2, reverse = TRUE)


###################################################
### code chunk number 4: InvDic
###################################################
pos = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))
neg = readFASTA(system.file('dnaseq/non-hs.fasta', package = 'rDNA'))
make_idkmer_vec(k = 6, x, pos, neg)


###################################################
### code chunk number 5: extrDAC
###################################################
extrDAC(x)

phyche_index = data.frame(cust1 = c(2.26, 3.03, 2.03, 3.83, 1.78, 1.65, 2.00, 
                                    2.03, 1.93, 2.61, 1.65, 3.03, 1.20, 1.93, 1.78, 2.26), cust2 = c(7.65, 8.93, 
                                                                                                     7.08, 9.07, 6.38, 8.04, 6.23, 7.08, 8.56, 9.53, 8.04, 8.93, 6.23, 8.56, 6.38, 
                                                                                                     7.65))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(2, alphabet = "ACGT")
extrDAC(x, normaliztion = TRUE, customprops = customprops)


###################################################
### code chunk number 6: extrDCC
###################################################
extrDCC(x)

phyche_index = data.frame(cust1 = c(2.26, 3.03, 2.03, 3.83, 1.78, 1.65, 2.00, 
                                    2.03, 1.93, 2.61, 1.65, 3.03, 1.20, 1.93, 1.78, 2.26), cust2 = c(7.65, 8.93, 
                                                                                                     7.08, 9.07, 6.38, 8.04, 6.23, 7.08, 8.56, 9.53, 8.04, 8.93, 6.23, 8.56, 6.38, 
                                                                                                     7.65))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(2, alphabet = "ACGT")
extrDCC(x, normaliztion = TRUE, customprops = customprops)


###################################################
### code chunk number 7: extrDACC
###################################################
# Use the 3 custom properties defined before
extrDACC(x)

phyche_index = data.frame(cust1 = c(2.26, 3.03, 2.03, 3.83, 1.78, 1.65, 2.00, 
                                    2.03, 1.93, 2.61, 1.65, 3.03, 1.20, 1.93, 1.78, 2.26), cust2 = c(7.65, 8.93, 
                                                                                                     7.08, 9.07, 6.38, 8.04, 6.23, 7.08, 8.56, 9.53, 8.04, 8.93, 6.23, 8.56, 6.38, 
                                                                                                     7.65))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(2, alphabet = "ACGT")
extrDACC(x, normaliztion = TRUE, customprops = customprops)


###################################################
### code chunk number 8: extrTAC
###################################################
# Use the 3 custom properties defined before
extrTAC(x)
phyche_index = data.frame(cust = c(7.176, 6.272, 4.736, 7.237, 3.810, 4.156, 
                                   4.156, 6.033, 3.410, 3.524, 4.445, 6.033, 1.613, 5.087, 2.169, 7.237, 3.581, 
                                   3.239, 1.668, 2.169, 6.813, 3.868, 5.440, 4.445, 3.810, 4.678, 5.440, 4.156, 
                                   2.673, 3.353, 1.668, 4.736, 4.214, 3.925, 3.353, 5.087, 2.842, 2.448, 4.678, 
                                   3.524, 3.581, 2.448, 3.868, 4.156, 3.467, 3.925, 3.239, 6.272, 2.955, 3.467, 
                                   2.673, 1.613, 1.447, 3.581, 3.810, 3.410, 1.447, 2.842, 6.813, 3.810, 2.955, 
                                   4.214, 3.581, 7.176))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(3, alphabet = "ACGT")
extrTAC(x, normaliztion = TRUE, customprops = customprops)


###################################################
### code chunk number 9: extrTCC
###################################################
extrTCC(x)

phyche_index = data.frame(cust = c(7.176, 6.272, 4.736, 7.237, 3.810, 4.156, 
                                   4.156, 6.033, 3.410, 3.524, 4.445, 6.033, 1.613, 5.087, 2.169, 7.237, 3.581, 
                                   3.239, 1.668, 2.169, 6.813, 3.868, 5.440, 4.445, 3.810, 4.678, 5.440, 4.156, 
                                   2.673, 3.353, 1.668, 4.736, 4.214, 3.925, 3.353, 5.087, 2.842, 2.448, 4.678, 
                                   3.524, 3.581, 2.448, 3.868, 4.156, 3.467, 3.925, 3.239, 6.272, 2.955, 3.467, 
                                   2.673, 1.613, 1.447, 3.581, 3.810, 3.410, 1.447, 2.842, 6.813, 3.810, 2.955, 
                                   4.214, 3.581, 7.176))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(3, alphabet = "ACGT")
extrTCC(x, normaliztion = TRUE, customprops = customprops)


###################################################
### code chunk number 10: extrTACC
###################################################
extrTACC(x)

phyche_index = data.frame(cust = c(7.176, 6.272, 4.736, 7.237, 3.810, 4.156,
                                   4.156, 6.033, 3.410, 3.524, 4.445, 6.033, 1.613, 5.087, 2.169, 7.237, 3.581, 
                                   3.239, 1.668, 2.169, 6.813, 3.868, 5.440, 4.445, 3.810, 4.678, 5.440, 4.156, 
                                   2.673, 3.353, 1.668, 4.736, 4.214, 3.925, 3.353, 5.087, 2.842, 2.448, 4.678, 
                                   3.524, 3.581, 2.448, 3.868, 4.156, 3.467, 3.925, 3.239, 6.272, 2.955, 3.467, 
                                   2.673, 1.613, 1.447, 3.581, 3.810, 3.410, 1.447, 2.842, 6.813, 3.810, 2.955, 
                                   4.214, 3.581, 7.176))
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(3, alphabet = "ACGT")
extrTACC(x, normaliztion = TRUE, customprops = customprops)

###################################################
### code chunk number 11: extrPseDNC
###################################################
extrPseDNC(x)

phyche_index = data.frame(cust1 = c(1.019, -0.918, 0.488, 0.567, 0.567, 
                                    -0.070, -0.579, 0.488, - 0.654, -2.455,-0.070, -0.918, 1.603, -0.654, 
                                    0.567, 1.019)) 
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(2, alphabet = "ACGT")
extrPseDNC(x, normalize = TRUE, customprops = customprops, lambda = 2, 
           w = 0.1)


###################################################
### code chunk number 12: extrPseKNC
###################################################
extrPseKNC(x)

phyche_index = data.frame(cust1 = c(1.019, -0.918, 0.488, 0.567, 0.567, 
                                    -0.070, -0.579, 0.488, - 0.654, -2.455,-0.070, -0.918, 1.603, -0.654, 
                                    0.567, 1.019)) 
customprops = t(phyche_index)
colnames(customprops) = make_kmer_index(2, alphabet = "ACGT")
extrPseKNC(x, normalize = TRUE, customprops = customprops, lambda = 1, 
           w = 0.05, k = 2)


###################################################
### code chunk number 13: dnacheck
###################################################
# A real sequence
dnacheck(x)
# An artificial sequence
dnacheck(paste(x, 'Z', sep = ''))




