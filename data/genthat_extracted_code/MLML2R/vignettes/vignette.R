## ----setup, include = FALSE,eval=FALSE-------------------------------------
#  knitr::opts_chunk$set(
#    collapse = TRUE,
#    comment = "#>"
#  )

## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----packages1,eval=FALSE,message=FALSE,warning=FALSE----------------------
#  library(MLML2R)
#  library(minfi)
#  library(GEOquery)
#  library(IlluminaHumanMethylation450kmanifest)

## ----getData1,eval=FALSE---------------------------------------------------
#  getGEOSuppFiles("GSE63179")
#  untar("GSE63179/GSE63179_RAW.tar", exdir = "GSE63179/idat")
#  
#  list.files("GSE63179/idat", pattern = "idat")
#  files <- list.files("GSE63179/idat", pattern = "idat.gz$", full = TRUE)
#  sapply(files, gunzip, overwrite = TRUE)

## ----readData1,eval=FALSE--------------------------------------------------
#  rgSet <- read.metharray.exp("GSE63179/idat")

## ----eval=FALSE------------------------------------------------------------
#  pData(rgSet)

## ----getPheno1,eval=FALSE--------------------------------------------------
#  if (!file.exists("GSE63179/GSE63179_series_matrix.txt.gz"))
#  download.file(
#  "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE63nnn/GSE63179/matrix/GSE63179_series_matrix.txt.gz",
#  "GSE63179/GSE63179_series_matrix.txt.gz")
#  
#  geoMat <- getGEO(filename="GSE63179/GSE63179_series_matrix.txt.gz",getGPL=FALSE)
#  pD.all <- pData(geoMat)
#  
#  #Another option
#  #geoMat <- getGEO("GSE63179")
#  #pD.all <- pData(geoMat[[1]])
#  
#  pD <- pD.all[, c("title", "geo_accession", "characteristics_ch1.1",
#                   "characteristics_ch1.2","characteristics_ch1.3")]
#  pD

## ----eval=FALSE------------------------------------------------------------
#  sampleNames(rgSet) <- sapply(sampleNames(rgSet),function(x)
#    strsplit(x,"_")[[1]][1])
#  rownames(pD) <- pD$geo_accession
#  pD <- pD[sampleNames(rgSet),]
#  pData(rgSet) <- as(pD,"DataFrame")
#  rgSet

## ----Preprocess1,eval=FALSE------------------------------------------------
#  BSindex <- c(1,3,5,6)
#  oxBSindex <- c(7,8,2,4)
#  
#  MSet.noob <- preprocessNoob(rgSet=rgSet)

## ----eval=FALSE------------------------------------------------------------
#  MChannelBS <- getMeth(MSet.noob)[,BSindex]
#  UChannelBS <- getUnmeth(MSet.noob)[,BSindex]
#  MChannelOxBS <- getMeth(MSet.noob)[,oxBSindex]
#  UChannelOxBS <- getUnmeth(MSet.noob)[,oxBSindex]

## ----MLML2Rexact1,eval=FALSE-----------------------------------------------
#  results_exact <- MLML(T.matrix = MChannelBS , U.matrix = UChannelBS,
#                        L.matrix = UChannelOxBS, M.matrix = MChannelOxBS)
#  
#  save(results_exact,file="results_exact_oxBS.rds")

## ----MLML2REM1,eval=FALSE--------------------------------------------------
#  results_em <- MLML(T.matrix = MChannelBS , U.matrix = UChannelBS,
#                     L.matrix = UChannelOxBS, M.matrix = MChannelOxBS,
#                     iterative = TRUE)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  all.equal(results_exact$hmC,results_em$hmC,scale=1)

## ----plot,echo=FALSE,eval=FALSE--------------------------------------------
#  beta_BS <- MChannelBS/(MChannelBS+UChannelBS)
#  beta_OxBS <- MChannelOxBS/(MChannelOxBS+UChannelOxBS)
#  hmC_naive <- beta_BS-beta_OxBS #5-hmC naive estimate
#  C_naive <- 1-beta_BS #uC naive estimate
#  mC_naive <- beta_OxBS #5-mC naive estimate
#  
#  pdf(file="Real1_estimates.pdf",width=15,height=10)
#  par(mfrow =c(2,3))
#  densityPlot(results_exact$hmC,main= "5-hmC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  densityPlot(results_exact$mC,main= "5-mC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  densityPlot(results_exact$C,main= "uC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  
#  densityPlot(hmC_naive,main= "5-hmC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  densityPlot(mC_naive,main= "5-mC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  densityPlot(C_naive,main= "uC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion")
#  dev.off()

## ----echo=FALSE,fig.width=15,fig.height=10,fig.cap="Estimated proportions of 5-hmC, 5-mC and uC for the CpGs in the dataset from Field (2015) using the MLML function with default (PAVA) options (top row) and the naïve (subtraction) method (bottom row)."----
knitr::include_graphics("Real1_estimates.pdf") 

## ----packages2,eval=FALSE,message=FALSE,warning=FALSE----------------------
#  library(MLML2R)
#  library(minfi)
#  library(GEOquery)
#  library(IlluminaHumanMethylation450kmanifest)

## ----getData2,eval=FALSE---------------------------------------------------
#  getGEOSuppFiles("GSE71398")
#  untar("GSE71398/GSE71398_RAW.tar", exdir = "GSE71398/idat")
#  
#  list.files("GSE71398/idat", pattern = "idat")
#  files <- list.files("GSE71398/idat", pattern = "idat.gz$", full = TRUE)
#  sapply(files, gunzip, overwrite = TRUE)

## ----readData2,eval=FALSE--------------------------------------------------
#  rgSet <- read.metharray.exp("GSE71398/idat")

## ----eval=FALSE------------------------------------------------------------
#  pData(rgSet)

## ----getPheno2,eval=FALSE--------------------------------------------------
#  if (!file.exists("GSE71398/GSE71398_series_matrix.txt.gz"))
#  download.file(
#  "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE71nnn/GSE71398/matrix/GSE71398_series_matrix.txt.gz",
#  "GSE71398/GSE71398_series_matrix.txt.gz")
#  
#  geoMat <- getGEO(filename="GSE71398/GSE71398_series_matrix.txt.gz",getGPL=FALSE)
#  pD.all <- pData(geoMat)
#  
#  #Another option
#  #geoMat <- getGEO("GSE71398")
#  #pD.all <- pData(geoMat[[1]])
#  
#  pD <- pD.all[, c("title", "geo_accession", "source_name_ch1",
#                   "tabchip or bschip:ch1","hypoxia status:ch1",
#                   "tumor name:ch1","batch:ch1","platform_id")]
#  pD$method <- pD$`tabchip or bschip:ch1`
#  pD$group <- pD$`hypoxia status:ch1`
#  pD$sample <- pD$`tumor name:ch1`
#  pD$batch <- pD$`batch:ch1`

## ----eval=FALSE------------------------------------------------------------
#  sampleNames(rgSet) <- sapply(sampleNames(rgSet),function(x)
#    strsplit(x,"_")[[1]][1])
#  rownames(pD) <- as.character(pD$geo_accession)
#  pD <- pD[sampleNames(rgSet),]
#  pData(rgSet) <- as(pD,"DataFrame")
#  rgSet

## ----eval=FALSE------------------------------------------------------------
#  qcReport(rgSet, pdf= "qcReport_tab_bs.pdf")

## ----preprocess2,eval=FALSE------------------------------------------------
#  BSindex <- which(pD$method=="BSchip")[-which(pD$geo_accession
#                                               %in% c("GSM1833667","GSM1833691"))]
#  TABindex <- which(pD$method=="TABchip")[-which(pD$geo_accession
#                                                 %in% c("GSM1833667","GSM1833691"))]
#  
#  MSet.noob <- preprocessNoob(rgSet)
#  
#  MChannelBS <- getMeth(MSet.noob)[,BSindex]
#  UChannelBS <- getUnmeth(MSet.noob)[,BSindex]
#  MChannelTAB <- getMeth(MSet.noob)[,TABindex]
#  UChannelTAB <- getUnmeth(MSet.noob)[,TABindex]

## ----eval=FALSE------------------------------------------------------------
#  results_exact <- MLML(T.matrix = MChannelBS , U.matrix = UChannelBS,
#                        G.matrix = UChannelTAB, H.matrix = MChannelTAB)

## ----MLML2REM2,eval=FALSE--------------------------------------------------
#  results_em <- MLML(T.matrix = MChannelBS , U.matrix = UChannelBS,
#                     G.matrix = UChannelTAB, H.matrix = MChannelTAB,
#                     iterative = TRUE)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  all.equal(results_exact$hmC,results_em$hmC,scale=1)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  all.equal(results_exact$mC,results_em$mC,scale=1)

## ----plot3,echo=FALSE,eval=FALSE-------------------------------------------
#  beta_BS <- MChannelBS/(MChannelBS+UChannelBS)
#  beta_TAB <- MChannelTAB/(MChannelTAB+UChannelTAB)
#  hmC_naive <- beta_TAB #5-hmC naive estimate
#  C_naive <- 1-beta_BS #uC naive estimate
#  mC_naive <- beta_BS-beta_TAB #5-mC naive estimate
#  
#  pdf(file="Real2a_estimates.pdf",width=15,height=10)
#  par(mfrow =c(2,3))
#  densityPlot(results_exact$hmC,main= "5-hmC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  densityPlot(results_exact$mC,main= "5-mC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  densityPlot(results_exact$C,main= "uC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  
#  densityPlot(hmC_naive,main= "5-hmC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  densityPlot(mC_naive,main= "5-mC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  densityPlot(C_naive,main= "uC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=pD$group[BSindex])
#  dev.off()

## ----echo=FALSE,fig.width=15,fig.height=10,fig.cap="Estimated proportions of 5-hmC, 5-mC and uC for the CpGs in the dataset from Thienpont et al (2016), using the MLML function with default (PAVA) options (top row) and the naïve (subtraction) method (bottom row)."----
knitr::include_graphics("Real2a_estimates.pdf") 

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  library(GEOquery)
#  
#  getGEOSuppFiles("GSE70090")
#  untar("GSE70090/GSE70090_RAW.tar", exdir = "GSE70090/data")

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  dataFiles <- list.files("GSE70090/data", pattern = "txt.gz$", full = TRUE)
#  sapply(dataFiles, gunzip, overwrite = TRUE)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  files <- list.files("GSE70090/data")
#  filesfull <- list.files("GSE70090/data",full=TRUE)
#  tissue <- sapply(files,function(x) strsplit(x,"_")[[1]][2]) # tissue
#  id <- sapply(files,function(x) strsplit(x,"_")[[1]][3]) # sample id
#  tmp <- sapply(files,function(x) strsplit(x,"_")[[1]][4])
#  convMeth <- sapply(tmp, function(x) strsplit(x,"\\.")[[1]][1]) # DNA conversion method
#  group <- ifelse(id %in% c("N1","N2","N3","N4"),"normal","tumor")
#  id2 <- paste(tissue,id,sep="_")
#  GSM <- sapply(files,function(x) strsplit(x,"_")[[1]][1]) # GSM
#  pheno <- data.frame(GSM=GSM,tissue=tissue,id=id2,convMeth=convMeth,
#                      group=group,file=filesfull,stringsAsFactors = FALSE)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  library(data.table)
#  
#  phenoLung <- pheno[pheno$tissue=="lung",]
#  
#  # order to have all BS samples and then all oxBS samples
#  phenoLung <- phenoLung[order(phenoLung$convMeth,phenoLung$id),]

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  ### BS
#  files <- phenoLung$file[phenoLung$convMeth=="BS"]
#  C_BS    <- do.call(cbind,lapply(files,function(fn)
#    fread(fn,data.table=FALSE,select=c("methylated_read_count"))))
#  TotalBS    <- do.call(cbind,lapply(files,function(fn)
#    fread(fn,data.table=FALSE,select=c("total_read_count"))))
#  T_BS <- TotalBS - C_BS
#  
#  
#  ### oxBS
#  files <- phenoLung$file[phenoLung$convMeth=="oxBS"]
#  C_OxBS    <- do.call(cbind,lapply(files,function(fn)
#    fread(fn,data.table=FALSE,select=c("methylated_read_count"))))
#  TotalOxBS    <- do.call(cbind,lapply(files,function(fn)
#    fread(fn,data.table=FALSE,select=c("total_read_count"))))
#  T_OxBS <- TotalOxBS - C_OxBS
#  
#  # since rownames and colnames are the same across files:
#  tmp <- fread(files[1], data.table=FALSE, select=c("chr","position"))
#  CpG <- paste(tmp[,1],tmp[,2],sep="-")
#  
#  rownames(C_BS) <- CpG
#  rownames(T_BS) <- CpG
#  
#  colnames(C_BS) <- phenoLung$id[phenoLung$convMeth=="BS"]
#  colnames(T_BS) <- phenoLung$id[phenoLung$convMeth=="BS"]
#  
#  rownames(C_OxBS) <- CpG
#  rownames(T_OxBS) <- CpG
#  
#  colnames(C_OxBS) <- phenoLung$id[phenoLung$convMeth=="oxBS"]
#  colnames(T_OxBS) <- phenoLung$id[phenoLung$convMeth=="oxBS"]
#  
#  Tm = as.matrix(C_BS)
#  Um = as.matrix(T_BS)
#  Lm = as.matrix(T_OxBS)
#  Mm = as.matrix(C_OxBS)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  TotalBS <- Tm+Um
#  TotalOxBS <- Lm+Mm
#  
#  library(matrixStats)
#  
#  tmp1 <- rowMins(TotalBS,na.rm=TRUE) # minimum coverage across samples from BS for each CpG
#  tmp2 <- rowMins(TotalOxBS,na.rm=TRUE) # minimum coverage across samples from oxBS for each CpG
#  
#  aa <-which(tmp1>=10 & tmp2>=10)
#  # CpGs with coverage at least 10 across all samples for both methods (BS and oxBS)
#  length(aa)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  library(MLML2R)
#  
#  results_exact <- MLML(T.matrix = Tm[aa,],
#          U.matrix = Um[aa,],
#          L.matrix = Lm[aa,],
#          M.matrix = Mm[aa,])
#  
#  results_em <- MLML(T.matrix = Tm[aa,],
#          U.matrix = Um[aa,],
#          L.matrix = Lm[aa,],
#          M.matrix = Mm[aa,],
#          iterative = TRUE)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  all.equal(results_exact$hmC,results_em$hmC,scale=1)

## ----echo=TRUE,eval=FALSE--------------------------------------------------
#  all.equal(results_exact$mC,results_em$mC,scale=1)

## ----echo=FALSE,eval=FALSE-------------------------------------------------
#  beta_BS <- Tm/TotalBS
#  beta_OxBS <- Mm/TotalOxBS
#  hmC_naive <- beta_BS-beta_OxBS
#  C_naive <- 1-beta_BS
#  mC_naive <- beta_OxBS
#  
#  library(minfi)
#  pdf(file="Real3a_estimates.pdf",width=15,height=10)
#  par(mfrow =c(2,3))
#  densityPlot(results_exact$hmC,main= "5-hmC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  densityPlot(results_exact$mC,main= "5-mC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  densityPlot(results_exact$C,main= "uC estimates - MLML2R",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  
#  densityPlot(hmC_naive[aa,],main= "5-hmC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  densityPlot(mC_naive[aa,],main= "5-mC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  densityPlot(C_naive[aa,],main= "uC estimates - Naïve",cex.axis=1.4,cex.main=1.5,cex.lab=1.4,xlab="Proportion",sampGroups=phenoLung$group[1:6])
#  dev.off()

## ----echo=FALSE,fig.width=15,fig.height=10,fig.cap="Estimated proportions of 5-hmC, 5-mC and uC for the CpGs in the dataset from Li et al (2016) using the MLML function with default options (top row) and the naïve method (bottom row)."----
knitr::include_graphics("Real3a_estimates.pdf") 

## ----simulation,echo=TRUE,eval=FALSE---------------------------------------
#  load("results_exact_oxBS.rds") # load estimates from previous example
#  
#  set.seed(112017)
#  
#  index <- sample(1:dim(results_exact$mC)[1],1000,replace=FALSE) # 1000 CpGs
#  
#  Coverage <- round(MChannelBS+UChannelBS)[index,1:2] # considering 2 samples
#  
#  temp1 <- data.frame(n=as.vector(Coverage),
#                      p_m=c(results_exact$mC[index,1],
#                            results_exact$mC[index,1]),
#                      p_h=c(results_exact$hmC[index,1],
#                            results_exact$hmC[index,1]))
#  
#  MChannelBS_temp <- c()
#  for (i in 1:dim(temp1)[1])
#  {
#    MChannelBS_temp[i] <- rbinom(n=1, size=temp1$n[i],
#                                   prob=(temp1$p_m[i]+temp1$p_h[i]))
#  }
#  
#  
#  UChannelBS_sim2 <- matrix(Coverage - MChannelBS_temp,ncol=2)
#  MChannelBS_sim2 <- matrix(MChannelBS_temp,ncol=2)
#  
#  
#  MChannelOxBS_temp <- c()
#  for (i in 1:dim(temp1)[1])
#  {
#    MChannelOxBS_temp[i] <- rbinom(n=1, size=temp1$n[i], prob=temp1$p_m[i])
#  }
#  
#  UChannelOxBS_sim2 <- matrix(Coverage - MChannelOxBS_temp,ncol=2)
#  MChannelOxBS_sim2 <- matrix(MChannelOxBS_temp,ncol=2)
#  
#  
#  MChannelTAB_temp <- c()
#  for (i in 1:dim(temp1)[1])
#  {
#    MChannelTAB_temp[i] <- rbinom(n=1, size=temp1$n[i], prob=temp1$p_h[i])
#  }
#  
#  
#  UChannelTAB_sim2 <- matrix(Coverage - MChannelTAB_temp,ncol=2)
#  MChannelTAB_sim2 <- matrix(MChannelTAB_temp,ncol=2)
#  
#  true_parameters_sim2 <- data.frame(p_m=results_exact$mC[index,1],
#                                     p_h=results_exact$hmC[index,1])
#  true_parameters_sim2$p_u <- 1-true_parameters_sim2$p_m-true_parameters_sim2$p_h

## ----eval=FALSE,echo=FALSE-------------------------------------------------
#  save(true_parameters_sim2,MChannelBS_sim2,UChannelBS_sim2,MChannelOxBS_sim2,UChannelOxBS_sim2,MChannelTAB_sim2,UChannelTAB_sim2,file="Data_sim2.rds")

## ----plot2,echo=FALSE,eval=FALSE-------------------------------------------
#  pdf(file="True_parameters.pdf",width=15,height=5)
#  par(mfrow =c(1,3))
#  plot(density(results_exact$hmC[index,1]),main= "True 5-hmC",xlab="Proportions",xlim=c(0,1),ylim=c(0,10),cex.axis=1.5,cex.main=1.5,cex.lab=1.5)
#  plot(density(results_exact$mC[index,1]),main= "True 5-mC",xlab="Proportions",xlim=c(0,1),ylim=c(0,10),cex.axis=1.5,cex.main=1.5,cex.lab=1.5)
#  plot(density(results_exact$C[index,1]),main= "True uC",ylim=c(0,10),xlab="Proportions",xlim=c(0,1),cex.axis=1.5,cex.main=1.5,cex.lab=1.5)
#  dev.off()

## ----echo=FALSE,fig.width=15,fig.height=5,fig.cap="True proportions of hydroxymethylation, methylation and unmethylation for the CpGs used to generate the datasets."----
knitr::include_graphics("True_parameters.pdf") 

## ----echo=FALSE,eval=TRUE--------------------------------------------------
load("Data_sim2.rds")

## --------------------------------------------------------------------------
library(MLML2R)
 results_exactBO1 <- MLML(T.matrix = MChannelBS_sim2, 
                          U.matrix = UChannelBS_sim2,
                          L.matrix = UChannelOxBS_sim2, 
                          M.matrix = MChannelOxBS_sim2)

## --------------------------------------------------------------------------
 results_emBO1 <- MLML(T.matrix = MChannelBS_sim2, 
                       U.matrix = UChannelBS_sim2,
                       L.matrix = UChannelOxBS_sim2, 
                       M.matrix = MChannelOxBS_sim2,
                       iterative=TRUE)

## --------------------------------------------------------------------------
 all.equal(results_emBO1$hmC,results_exactBO1$hmC,scale=1)

## --------------------------------------------------------------------------
 library(microbenchmark)
 mbmBO1 = microbenchmark(
    EXACT = MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2),
    EM =    MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2,
                 iterative=TRUE),
    times=10)
 mbmBO1

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_exactBO1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_emBO1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
results_exactBT1 <- MLML(T.matrix = MChannelBS_sim2, 
                         U.matrix = UChannelBS_sim2,
                         G.matrix = UChannelTAB_sim2, 
                         H.matrix = MChannelTAB_sim2)

## --------------------------------------------------------------------------
 results_emBT1 <- MLML(T.matrix = MChannelBS_sim2, 
                       U.matrix = UChannelBS_sim2,
                       G.matrix = UChannelTAB_sim2, 
                       H.matrix = MChannelTAB_sim2,
                       iterative=TRUE)

## --------------------------------------------------------------------------
 all.equal(results_emBT1$hmC,results_exactBT1$hmC,scale=1)

## --------------------------------------------------------------------------
 mbmBT1 = microbenchmark(
    EXACT = MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2),
    EM =    MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2,
                 iterative=TRUE),
    times=10)
 mbmBT1

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_exactBT1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_emBT1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
 results_exactOT1 <- MLML(L.matrix = UChannelOxBS_sim2, 
                          M.matrix = MChannelOxBS_sim2,
                          G.matrix = UChannelTAB_sim2, 
                          H.matrix = MChannelTAB_sim2)

## --------------------------------------------------------------------------
 results_emOT1 <- MLML(L.matrix = UChannelOxBS_sim2, 
                       M.matrix = MChannelOxBS_sim2,
                       G.matrix = UChannelTAB_sim2, 
                       H.matrix = MChannelTAB_sim2,
                       iterative=TRUE)

## --------------------------------------------------------------------------
 all.equal(results_emOT1$hmC,results_exactOT1$hmC,scale=1)

## --------------------------------------------------------------------------
 mbmOT1 = microbenchmark(
    EXACT = MLML(L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2),
    EM =    MLML(L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2,
                 iterative=TRUE),
    times=10)
 mbmOT1

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_exactOT1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_emOT1$hmC[,1],scale=1)

## --------------------------------------------------------------------------

results_exactBOT1 <- MLML(T.matrix = MChannelBS_sim2, 
                          U.matrix = UChannelBS_sim2,
                          L.matrix = UChannelOxBS_sim2, 
                          M.matrix = MChannelOxBS_sim2,
                          G.matrix = UChannelTAB_sim2, 
                          H.matrix = MChannelTAB_sim2)

## --------------------------------------------------------------------------
 results_emBOT1 <- MLML(T.matrix = MChannelBS_sim2, 
                        U.matrix = UChannelBS_sim2,
                        L.matrix = UChannelOxBS_sim2, 
                        M.matrix = MChannelOxBS_sim2,
                        G.matrix = UChannelTAB_sim2, 
                        H.matrix = MChannelTAB_sim2,iterative=TRUE)

## --------------------------------------------------------------------------
 all.equal(results_emBOT1$hmC,results_exactBOT1$hmC,scale=1)

## ----computationCost-------------------------------------------------------
 mbmBOT1 = microbenchmark(
    EXACT = MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2),
    EM =    MLML(T.matrix = MChannelBS_sim2, 
                 U.matrix = UChannelBS_sim2,
                 L.matrix = UChannelOxBS_sim2, 
                 M.matrix = MChannelOxBS_sim2,
                 G.matrix = UChannelTAB_sim2, 
                 H.matrix = MChannelTAB_sim2,
                 iterative=TRUE),
    times=10)
 mbmBOT1

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_exactBOT1$hmC[,1],scale=1)

## --------------------------------------------------------------------------
all.equal(true_parameters_sim2$p_h,results_emBOT1$hmC[,1],scale=1)

