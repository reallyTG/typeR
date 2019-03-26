## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 6, fig.height = 6)

## ------------------------------------------------------------------------
library(polyRAD)
maphmcfile <- system.file("extdata", "ClareMap_HapMap.hmc.txt", 
                          package = "polyRAD")

mydata <- readHMC(maphmcfile,
                  possiblePloidies = list(2, c(2, 2)))
mydata

## ------------------------------------------------------------------------
GetTaxa(mydata)[c(1:10,293:299)]

## ------------------------------------------------------------------------
mydata <- SetDonorParent(mydata, "Kaskade-Justin")
mydata <- SetRecurrentParent(mydata, "Zebrinus-Justin")

## ------------------------------------------------------------------------
alignfile <- system.file("extdata", "ClareMap_alignments.csv", 
                         package = "polyRAD")

aligndata <- read.csv(alignfile, row.names = 1)
head(aligndata)

mydata$locTable$Chr <- aligndata[GetLoci(mydata), 1]
mydata$locTable$Pos <- aligndata[GetLoci(mydata), 2]
head(mydata$locTable)

## ------------------------------------------------------------------------
mydata2 <- PipelineMapping2Parents(mydata, 
                                  freqExcludeTaxa = c("Kaskade-Justin", 
                                                      "Zebrinus-Justin",
                                                     "IGR-2011-001",
                                                     "p196-150A-c", 
                                                     "p877-348-b"),
                                  freqAllowedDeviation = 0.06,
                                  useLinkage = FALSE,
                                  minLikelihoodRatio = 2)

## ----message = FALSE-----------------------------------------------------
library(qqman)
overdispersionP <- TestOverdispersion(mydata2, to_test = 6:10)
qq(overdispersionP[["6"]])
qq(overdispersionP[["7"]])
qq(overdispersionP[["8"]])
qq(overdispersionP[["9"]])
qq(overdispersionP[["10"]])

## ------------------------------------------------------------------------
mydata <- PipelineMapping2Parents(mydata, 
                                  freqExcludeTaxa = c("Kaskade-Justin", 
                                                      "Zebrinus-Justin",
                                                     "IGR-2011-001",
                                                     "p196-150A-c", 
                                                     "p877-348-b"),
                                  freqAllowedDeviation = 0.06,
                                  useLinkage = TRUE, overdispersion = 9,
                                  minLikelihoodRatio = 2)

## ------------------------------------------------------------------------
table(mydata$alleleFreq)

## ------------------------------------------------------------------------
mydata$alleleDepth[10,19:26]
mydata$genotypeLikelihood[[1]][,10,19:26]
mydata$genotypeLikelihood[[2]][,10,19:26]

## ------------------------------------------------------------------------
mydata$priorProb[[1]][,19:26]
mydata$priorProb[[2]][,19:26]

## ------------------------------------------------------------------------
mydata$ploidyChiSq[,19:26]

## ------------------------------------------------------------------------
plot(mydata$ploidyChiSq[1,], mydata$ploidyChiSq[2,], 
     xlab = "Chi-squared for diploid model",
     ylab = "Chi-squared for tetraploid model")
abline(a = 0, b = 1, col = "red")

## ------------------------------------------------------------------------
mydata$posteriorProb[[1]][,10,19:26]
mydata$posteriorProb[[2]][,10,19:26]

## ------------------------------------------------------------------------
mywm <- GetWeightedMeanGenotypes(mydata)
mywm[c(297,2:6), 10:13]

## ------------------------------------------------------------------------
mydata$likelyGeno_donor[,19:26]
mydata$likelyGeno_recurrent[,19:26]

## ----message=FALSE, warning=FALSE----------------------------------------
library(VariantAnnotation)

myVCF <- system.file("extdata", "Msi01genes.vcf", package = "polyRAD")

## ----eval=FALSE----------------------------------------------------------
#  mybg <- bgzip(myVCF)
#  indexTabix(mybg, format = "vcf")

## ------------------------------------------------------------------------
mydata <- VCF2RADdata(myVCF, possiblePloidies = list(2, c(2,2)),
                      expectedLoci = 100, expectedAlleles = 500)
mydata

## ------------------------------------------------------------------------
overdispersionP <- TestOverdispersion(mydata, to_test = 8:10)
qq(overdispersionP[["8"]])
qq(overdispersionP[["9"]])
qq(overdispersionP[["10"]])

## ----message = FALSE-----------------------------------------------------
mydataHWE <- IterateHWE(mydata, tol = 1e-3, overdispersion = 9)

## ------------------------------------------------------------------------
hist(mydataHWE$alleleFreq, breaks = 20)

## ----message = FALSE-----------------------------------------------------
set.seed(3908)
mydataPopStruct <- IteratePopStruct(mydata, nPcsInit = 8, tol = 5e-03,
                                    overdispersion = 9)

## ------------------------------------------------------------------------
hist(mydataPopStruct$alleleFreq, breaks = 20)

## ------------------------------------------------------------------------
plot(mydataPopStruct$PCA[,1], mydataPopStruct$PCA[,2],
     xlab = "PC axis 1", ylab = "PC axis 2")

## ------------------------------------------------------------------------
myallele <- 1
freqcol <- heat.colors(101)[round(mydataPopStruct$alleleFreqByTaxa[,myallele] * 100) + 1]
plot(mydataPopStruct$PCA[,1], mydataPopStruct$PCA[,2],
     xlab = "PC axis 1", ylab = "PC axis 2", pch = 21,
     bg = freqcol)

## ------------------------------------------------------------------------
wmgenoPopStruct <- GetWeightedMeanGenotypes(mydataPopStruct)
wmgenoPopStruct[1:10,1:5]

## ----eval = FALSE--------------------------------------------------------
#  library(polyRAD)
#  library(VariantAnnotation)
#  
#  # Two files produced by the TASSEL-GBSv2 pipeline using two different
#  # enzyme systems.
#  NsiI_file <- "170705Msi_NsiI_genotypes.vcf.bgz"
#  PstI_file <- "170608Msi_PstI_genotypes.vcf.bgz"
#  
#  # The vector allSam was defined outside of this script, and contains the
#  # names of all samples that I wanted to import.  Below I find sample names
#  # within the VCF files that match those samples.
#  NsiI_sam <- allSam[allSam %in% samples(scanVcfHeader(NsiI_file))]
#  PstI_sam <- allSam[allSam %in% samples(scanVcfHeader(PstI_file))]
#  
#  # Import two RADdata objects, assuming diploidy.  A large yield size was
#  # used due to the computer having 64 Gb RAM; on a typical laptop you
#  # would probably want to keep the default of 5000.
#  PstI_RAD <- VCF2RADdata(PstI_file, samples = PstI_sam, yieldSize = 5e4,
#                          expectedAlleles = 1e6, expectedLoci = 2e5)
#  NsiI_RAD <- VCF2RADdata(NsiI_file, samples = NsiI_sam, yieldSize = 5e4,
#                          expectedAlleles = 1e6, expectedLoci = 2e5)
#  
#  # remove any loci duplicated across the two sets
#  nLoci(PstI_RAD)    # 116757
#  nLoci(NsiI_RAD)    # 187434
#  nAlleles(PstI_RAD) # 478210
#  nAlleles(NsiI_RAD) # 952511
#  NsiI_keeploci <- which(!GetLoci(NsiI_RAD) %in% GetLoci(PstI_RAD))
#  cat(nLoci(NsiI_RAD) - length(NsiI_keeploci),
#      file = "180522Num_duplicate_loci.txt") #992 duplicate
#  NsiI_RAD <- SubsetByLocus(NsiI_RAD, NsiI_keeploci)
#  
#  # combine allele depth into one matrix
#  PstI_depth <- PstI_RAD$alleleDepth
#  NsiI_depth <- NsiI_RAD$alleleDepth
#  total_depth <- matrix(0L, nrow = length(allSam),
#                        ncol = ncol(PstI_depth) + ncol(NsiI_depth),
#                        dimnames = list(allSam,
#                                        c(colnames(PstI_depth),
#                                          colnames(NsiI_depth))))
#  total_depth[,colnames(PstI_depth)] <- PstI_depth[allSam,]
#  total_depth[rownames(NsiI_depth),colnames(NsiI_depth)] <- NsiI_depth
#  
#  # combine other slots
#  total_alleles2loc <- c(PstI_RAD$alleles2loc,
#                         NsiI_RAD$alleles2loc + nLoci(PstI_RAD))
#  total_locTable <- rbind(PstI_RAD$locTable, NsiI_RAD$locTable)
#  total_alleleNucleotides <- c(PstI_RAD$alleleNucleotides,
#                               NsiI_RAD$alleleNucleotides)
#  
#  # build new RADdata object and save
#  total_RAD <- RADdata(total_depth, total_alleles2loc, total_locTable,
#                       list(2L), 0.001, total_alleleNucleotides)
#  #save(total_RAD, file = "180524_RADdata_NsiIPstI.RData")
#  
#  # Make groups representing pairs of chromosomes, and one group for all
#  # non-assembled scaffolds.
#  splitlist <- list(c("^01$", "^02$"),
#                    c("^03$", "^04$"),
#                    c("^05$", "^06$"),
#                    c("^07$", "^08$"),
#                    c("^09$", "^10$"),
#                    c("^11$", "^12$"),
#                    c("^13$", "^14$", "^15$"),
#                    c("^16$", "^17$"),
#                    c("^18$", "^194"), "^SCAFFOLD")
#  # split by chromosome and save seperate objects
#  SplitByChromosome(total_RAD, chromlist = splitlist,
#                    chromlist.use.regex = TRUE, fileprefix = "180524splitRAD")
#  
#  # files with RADdata objects
#  splitfiles <- grep("^180524splitRAD", list.files("."), value = TRUE)
#  
#  # list to hold markers formatted for GAPIT/FarmCPU
#  GAPITlist <- list()
#  length(GAPITlist) <- length(splitfiles)
#  
#  # loop through RADdata objects
#  for(i in 1:length(splitfiles)){
#    load(splitfiles[i])
#    splitRADdata <- IteratePopStructLD(splitRADdata)
#    GAPITlist[[i]] <- ExportGAPIT(splitRADdata)
#  }
#  #save(GAPITlist, file = "180524GAPITlist.RData")
#  
#  # put together into one dataset for FarmCPU
#  GM.all <- rbind(GAPITlist[[1]]$GM, GAPITlist[[2]]$GM, GAPITlist[[3]]$GM,
#                  GAPITlist[[4]]$GM, GAPITlist[[5]]$GM, GAPITlist[[6]]$GM,
#                  GAPITlist[[7]]$GM, GAPITlist[[8]]$GM,
#                  GAPITlist[[9]]$GM, GAPITlist[[10]]$GM)
#  GD.all <- cbind(GAPITlist[[1]]$GD, GAPITlist[[2]]$GD[,-1],
#                  GAPITlist[[3]]$GD[,-1], GAPITlist[[4]]$GD[,-1],
#                  GAPITlist[[5]]$GD[,-1], GAPITlist[[6]]$GD[,-1],
#                  GAPITlist[[7]]$GD[,-1], GAPITlist[[8]]$GD[,-1],
#                  GAPITlist[[9]]$GD[,-1], GAPITlist[[10]]$GD[,-1])
#  #save(GD.all, GM.all, file = "180525GM_GD_all_polyRAD.RData") # 1076888 markers

