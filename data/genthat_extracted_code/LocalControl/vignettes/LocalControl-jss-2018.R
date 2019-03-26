### R code from vignette source 'LocalControl-jss-2018.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: init_libs_vars_calcs
###################################################
# toggle long computations for fast pdf building
doCalcs = F

# load packages
library(LocalControl)
library(xtable)
suppressPackageStartupMessages(library(TeachingDemos))

# heatmap/dendrogram
suppressPackageStartupMessages(library(gplots))
suppressPackageStartupMessages(library(dendextend))

# for lcc distribution analysis
library(data.table)

# plotting tools
library(colorspace)
library(RColorBrewer)
library(gridExtra)
library(ggplot2)

# recursive partitioning
suppressPackageStartupMessages(library(rpart))
library(rpart.plot)

# frequently used variables
data(lindner)
all7Vars <- c("stent", "height", "female", "diabetic", "acutemi", "ejecfrac", "ves1proc")
numClusters <- c(1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50)
t0Red = "#E41A1C"
t0Fill = rgb(red = 228, green = 26, blue = 28, alpha = 127, maxColorValue = 255)
t1Blue = "#377EB8"
t1Fill = rgb(red = 55, green = 126, blue = 184, alpha = 127, maxColorValue = 255)
t2Green = "#4DAF4A"

if(doCalcs){
  linResults = LocalControlClassic( data = lindner,
                                    clusterVars = all7Vars,
                                    treatmentColName = "abcix",
                                    outcomeColName = "cardbill",
                                    clusterCounts = numClusters)
  linRes = LocalControl(data=lindner,
                        clusterVars=all7Vars,
                        treatmentColName="abcix",
                        outcomeColName="cardbill",
                        treatmentCode=1)
  
  linSults = LocalControl(data = lindner,
                           treatmentColName = "abcix",
                           outcomeColName = "cardbill", treatmentCode = 1,
                           clusterVars = all7Vars, radDecayRate = .95, radMinFract = .01  )
  
  sdata = lindner
  
  linSummary = summary(linSults)
  linSummary$male_stent = 0
  linSummary$female_stent = 0
  linSummary$male_without = 0
  linSummary$female_without = 0
  linSummary$maleAverage = 0
  linSummary$femaleAverage = 0
  linSummary$medianLTD = 0
  
  stentMales = which(sdata$female==0 & sdata$stent==1)
  stentFemales = which(sdata$female==1 & sdata$stent==1)
  nosMales = which(sdata$female==0 & sdata$stent==0)
  nosFemales = which(sdata$female==1 & sdata$stent==0)
  allMen = which(sdata$female == 0)
  allWomen = which(sdata$female == 1)
  
  for(i in 1:nrow(linSummary)){
    linSummary$male_stent[i] = mean(linSults$ltds[stentMales,i],na.rm = T)
    linSummary$female_stent[i] = mean(linSults$ltds[stentFemales,i],na.rm = T)
    linSummary$male_without[i] = mean(linSults$ltds[nosMales,i],na.rm = T)
    linSummary$female_without[i] = mean(linSults$ltds[nosFemales,i],na.rm = T)
    linSummary$maleAverage[i] = mean(linSults$ltds[allMen,i],na.rm=T)
    linSummary$femaleAverage[i] = mean(linSults$ltds[allWomen,i],na.rm=T)
    linSummary$medianLTD[i] = median(linSults$ltds[,i], na.rm = T)
  }
  
  linRad33 = linSults$ltds$rad_33
  
  saveRDS(linRes, 'calcs/linRes.rds')
  saveRDS(linSummary, 'calcs/linSummary.rds')
  saveRDS(linRad33, 'calcs/linRad33.rds')
  
  lindnerResults = list()
  ltdds = list()
  for (cc in numClusters) {
      objName = paste0("UPSnnltd", cc)
      nnObj = linResults[[objName]]
      ltdds[[objName]] = nnObj$pbindif[nnObj$nnhbindf[,1]]
  }

  lindnerResults[["summary"]] = linResults[["summary"]]
  lindnerResults[["ltdds"]] = ltdds
  lindnerResults[["yname"]] = linResults[["UPSaccum.pars"]][,"yvar"]
  saveRDS(lindnerResults, 'calcs/lindnerResults.rds')
} else{
  lindnerResults = readRDS('calcs/lindnerResults.rds')
  linSummary = readRDS('calcs/linSummary.rds')
  linRad33 = readRDS('calcs/linRad33.rds')
  linRes = readRDS('calcs/linRes.rds')
}

set.seed(253748)
N = 10000
weight = c(rnorm(N/2, 75, 15), rnorm(N/2, 75, 15))
dosage = weight + c(rnorm(N/2, 0, 15), rnorm(N/2, 0,  5))
trmt = c(rep(1, N/2), rep(0, N/2))
ADR = abs(weight - dosage)
noise1 = rnorm(n = N, 0, 1)
noise2 = rnorm(n = N, 0, 1)
simData = data.frame(weight, trmt, dosage, ADR, noise1, noise2)

if(doCalcs){
  xSults = LocalControl(data = simData,
                        treatmentColName = "trmt",
                        treatmentCode = 1,
                        outcomeColName = "ADR",
                        clusterVars = c("weight", "dosage"),
                        radMinFract = .01,
                        radDecayRate = 0.95,
                        numThreads = 4)
  
  xSultsT1 = xSults$outcomes$T1[,"rad_91"]
  xSultsT0 = xSults$outcomes$T0[,"rad_91"]
  saveRDS(xSultsT1, 'calcs/xSultsT1.rds')
  saveRDS(xSultsT0, 'calcs/xSultsT0.rds')

} else{
  xSultsT1 = readRDS( 'calcs/xSultsT1.rds')
  xSultsT0 = readRDS( 'calcs/xSultsT0.rds')
}

if(doCalcs){
  noisyVars = c("weight", "dosage", "noise1", "noise2")
  noisySults =  LocalControl( simData,
                              treatmentCode = 1,
                              treatmentColName = "trmt",
                              outcomeColName = "ADR",
                              clusterVars = noisyVars,
                              radMinFract = .01,
                              radDecayRate = 0.95 , numThreads = 4)
  fixedRads = summary(noisySults)$radius
  varCombinations = expand.grid(0:1, 0:1, 0:1, 0:1)
  ltext = apply(X = varCombinations, MARGIN = 1,
                FUN = function(x) paste0(x, collapse = ''))
  ltdVecs = list()
  ltdVecs[[1]] = rep(summary(noisySults)$ltd[1], nrow(summary(noisySults)))
  for(i in 2:16){
    varSS = noisyVars[which(varCombinations[i,] == 1)]
    scaleFactor = sqrt(length(varSS)) / sqrt(length(noisyVars))
    scaleRads = fixedRads * scaleFactor
    sults = LocalControl( simData,
                          treatmentCode = 1,
                          treatmentColName = "trmt",
                          outcomeColName = "ADR",
                          clusterVars = varSS,
                          radiusLevels = scaleRads, numThreads = 4)
    ltdVecs[[i]] = summary(sults)$ltd
  }
  ltdFrame = data.frame(ltdVecs)
  names(ltdFrame) = ltext
  saveRDS(object = varCombinations, file = "calcs/ffvc.rds")
  resultSummary = summary(sults)
  saveRDS(object = resultSummary, file = "calcs/resultSummary.rds")
  saveRDS(object = ltdVecs, file = "calcs/ffltdv.rds")
  saveRDS(object = ltdFrame, file = "calcs/ffltdf.rds")
} else{
  varCombinations = readRDS(file = "calcs/ffvc.rds")
  resultSummary = readRDS(file = "calcs/resultSummary.rds")
  ltdVecs = readRDS(file = "calcs/ffltdv.rds")
  ltdFrame = readRDS(file = "calcs/ffltdf.rds")
}

if(doCalcs){
  linCI = LocalControlNearestNeighborsConfidence(data=lindner,
                                           clusterVars=all7Vars,
                                           treatmentColName="abcix",
                                           outcomeColName="cardbill",
                                           treatmentCode=1,
                                           nBootstrap=100)
  saveRDS(object = linCI, file = "calcs/linCI.rds")
} else{
  linCI = readRDS(file = "calcs/linCI.rds")
}

# generate survival simulation
weibullSim = function(N, lambda, rho, betadrug, betaage, betabmi) {
  bmi = rnorm(N, mean = 26, sd = 4)       
  age = runif(N) * 47 + 18                  
  pbmi = (bmi - min(bmi)) / (max(bmi) - min(bmi)) * 0.8 + 0.1
  page = (age - min(age)) / (max(age) - min(age)) * 0.8 + 0.1
  drug = 1 - rbinom(N, 1, (pbmi + page) / 2) 
  et = exp(drug * betadrug + bmi * betabmi + age * betaage)
  Tlat = (-log(runif(n=N)) / (lambda * et))^(1 / rho)
  C = runif(N) * 30
  time = pmin(Tlat, C)                       
  status = as.numeric(Tlat <= C)
  data.frame(id = 1:N, drug, age, bmi, time, status)
}

survSimData = weibullSim(10000, 1e-10, 2.6, log(3), log(1.15), log(1.5))

if(doCalcs){
  sSults = LocalControl(survSimData, treatmentColName = "drug", timeColName = "time", outcomeType = "survival",
                                    outcomeColName = "status",treatmentCode = 1, clusterVars = c("age", "bmi"),
                                    radMinFract = .01)

  sSimFTs = sSults$Failtimes
  sSimT1R1 = sSults$KM$T1$rad_1
  sSimT0R1 = sSults$KM$T0$rad_1
  sSimT1R21 = sSults$KM$T1$rad_21
  sSimT0R21 = sSults$KM$T0$rad_21
  
  saveRDS(object = sSimFTs, file = "calcs/sSimFTs.rds")
  saveRDS(object = sSimT1R1, file = "calcs/sSimT1R1.rds")
  saveRDS(object = sSimT0R1, file = "calcs/sSimT0R1.rds")
  saveRDS(object = sSimT1R21, file = "calcs/sSimT1R21.rds")
  saveRDS(object = sSimT0R21, file = "calcs/sSimT0R21.rds")

} else{
  sSimFTs = readRDS(file = "calcs/sSimFTs.rds")
  sSimT1R1 = readRDS(file = "calcs/sSimT1R1.rds")
  sSimT0R1 = readRDS(file = "calcs/sSimT0R1.rds")
  sSimT1R21 = readRDS(file = "calcs/sSimT1R21.rds")
  sSimT0R21 = readRDS(file = "calcs/sSimT0R21.rds")
}

data(framingham)
shadeVect = c("Nonsmoker" = "#80000055", "Smoker" = "#0000FF55")
colVect = c("Smoker" = "red", "Nonsmoker" = "blue")
ltyVect = c("Hypertension" = "dashed", "Death" = "solid")

if(doCalcs){
  FHSResults = LocalControl( data = framingham, outcomeType = "survival",
                                        treatmentColName = "cursmoke",
                                        treatmentCode = 1,
                                        timeColName = "time_outcome",
                                        outcomeColName = "outcome",
                                        clusterVars = c("female", "totchol", "age", "bmi", "BPVar", "heartrte", "glucose"))
  
  FHSConfidence = LocalControlCompetingRisksConfidence(LCCompRisk = FHSResults, confLevel = "90%")
  
    
  getLines2Plot <- function(sult, conf, rad, fc, tr) {
    outFrame = data.frame(TIMES = sult$Failtimes,
                          UPPER = conf[[tr]][[fc]]$UPPER_CONF[,rad],
                          LOWER = conf[[tr]][[fc]]$LOWER_CONF[,rad],
                          CIF = sult$CIF[[fc]][[tr]][,rad])
    outFrame
  }
  
  FHSPlotLines = list()
  for(radLim in c("rad_1","rad_11")){
      plotLines = list()
      
      t1lines2plot = getLines2Plot(FHSResults, FHSConfidence, radLim, "Failcode_1", "T1")
      t1lines2plot$CLASS = "Smoker"
      t1lines2plot$FAIL = "Hypertension"
      t1lines2plot$NG = paste(t1lines2plot$CLASS, t1lines2plot$FAIL)
      plotLines[["t1HT"]] = t1lines2plot
      
      t0lines2plot = getLines2Plot(FHSResults, FHSConfidence, radLim, "Failcode_1", "T0") 
      t0lines2plot$CLASS = "Nonsmoker"
      t0lines2plot$FAIL = "Hypertension"
      t0lines2plot$NG = paste(t0lines2plot$CLASS, t0lines2plot$FAIL)
      plotLines[["t0HT"]] = t0lines2plot
      
      t1DeathLines = getLines2Plot(FHSResults, FHSConfidence, radLim, "Failcode_2", "T1")
      t1DeathLines$CLASS = "Smoker"
      t1DeathLines$FAIL = "Death"
      t1DeathLines$NG = paste(t1DeathLines$CLASS, t1DeathLines$FAIL)
      plotLines[["t1Death"]] = t1DeathLines
      
      t0DeathLines = getLines2Plot(FHSResults, FHSConfidence, radLim, "Failcode_2", "T0")
      t0DeathLines$CLASS = "Nonsmoker"
      t0DeathLines$FAIL = "Death"
      t0DeathLines$NG = paste(t0DeathLines$CLASS, t0DeathLines$FAIL)
      plotLines[["t0Death"]] = t0DeathLines
      
      FHSPlotLines[[radLim]] = plotLines
  }
  
  FHSSummary = summary(FHSResults)
  saveRDS(object = FHSSummary, file = "calcs/FHSSummary.rds")
  saveRDS(object = FHSPlotLines, file = "calcs/FHSPlotLines.rds")
  
} else{
  FHSPlotLines = readRDS(file = "calcs/FHSPlotLines.rds") 
  FHSSummary = readRDS(file = "calcs/FHSSummary.rds")

}


avgDif <- function(uncorrected, corrected) {
  return(sum(uncorrected-corrected, na.rm = TRUE)/
        length(which(!is.na(corrected))))
}

setColAlpha = function(col, intensity) {
  iint = 1 - as.double(intensity)
  cc = col2rgb(col)/255
  nc = rgb(red = cc[1], green = cc[2], blue = cc[3], alpha = iint)
  nc
}
if(doCalcs){
  
  lind = data.table(lindner)
  lindavgs = lind[, .(mean(cardbill)), by = .(abcix)]
  
  lindLC = LocalControlClassic( data = lindner,  clusterVars =  c("stent", "female", "acutemi"),
                                treatmentColName = "abcix", outcomeColName = "cardbill",  clusterCounts = c(30))
  
  lind$c = lindLC$UPSnnltd30$nnhbindf
  localOutcomes = data.table(lindLC$UPSnnltd30$binmean)
  localOutcomes$LTDobs = localOutcomes$`abcix = 1` - localOutcomes$`abcix = 0`

  setkey(lind, c)        
  setkey(localOutcomes, BIN) 
  lind = lind[localOutcomes, nomatch = NA] 
  
  
  set.seed(1772)
  
  randomData = lind # copy for randomizing 
  randomLTDs = data.table(cluster = 1:30, artltd = rep(0.0, 30)) #aggregate df
  setkey(randomLTDs, cluster) 
  for(i in 1:100){
    randomData[, "c"] = sample(x = lind$c, replace = F)           # random 2000 clusters w/ same sizes
    randomAverages = randomData[, .(mean(cardbill)), by = .(abcix, c)]   # avg outcome per trt in cluster
    randomAverages[abcix == 0, "V1"] = -randomAverages[ abcix == 0, "V1"]   # flip sign on t0s before sum 
    rltds = randomAverages[, .(sum(V1)), by = .(c)]                     # (t1 - t0) per cluster
    setkey(rltds, c)
    randomLTDs = randomLTDs[ rltds, nomatch = NA]
  }

  ccc = lind
  setkey(ccc, c)         # keys are used to join data.tables
  setkey(randomLTDs, cluster) # next line joins randomized cluster values back with main table based on cluster value.
  ccc = ccc[randomLTDs, nomatch = NA]            # set artltd value for each patient based on original clustering 
  ccc[ which(is.na(ccc$LTDobs)), "artltd"] = NA  # remove same number of noninformative clusters/patients 
  
  # above uses means (11 values for 100 resamplings)
  # this uses all 1100, rather than the average
  randomLTDs[which(is.na(localOutcomes$LTDobs)), 3:ncol(randomLTDs)] = NA
  allrands = as.vector(as.matrix(randomLTDs[, 3:ncol(randomLTDs)]))

  saveRDS(object = allrands, file = "calcs/allRands.rds")
  saveRDS(object = ccc, file = "calcs/ccc.rds")
  saveRDS(object = localOutcomes, file = "calcs/localoutcomes.rds")
} else{
  ccc = readRDS(file = "calcs/ccc.rds") 
  allrands = readRDS(file = "calcs/allRands.rds") 
  localOutcomes = readRDS(file = "calcs/localoutcomes.rds")
}

if(doCalcs){

  dflindner = lindner
  dflindner$c = lindLC$UPSnnltd30$nnhbindf$HclusBin
  dflindner$t = dflindner$abcix
  dflindner$y = dflindner$cardbill
  #
# [2] Compute observed Local Treatment Differences (within clusters) = 
#                      Local Differences in Mean y-outcomes between Treatment Groups.
# 

dfLTD <- do.call( rbind, lapply( split(dflindner, dflindner$c),
		function(x) {
			n1 = sum(x$t)
			n0 = length(x$t) - n1
			if(n1 == 0 || n0 == 0) LTD = NA else LTD = sum(x$y * x$t)/n1 - sum(x$y * (1-x$t))/n0
			data.frame(c=x$c[1], LTD=LTD, w=length(x$c))
		} ) )

# Create data.frame to hold full replicates of Local Treatment Effect-Size Estimates (many within-cluster ties)
dfLreps = as.data.frame(cbind(dflindner$c, dflindner$y))
colnames(dfLreps) = c("c","LTD")   # Here, Local Treatment Effect-Size Estimates are LTDs...
for(i in 1:length(dfLreps[,1])) {
	dfLreps$LTD[i] = dfLTD$LTD[dflindner$c[i]]  # insert observed LTD values
	}
dfLTDobs = dfLreps  # Save Observed LTD Distribution from lindner data...
#hist(dfLTDobs[,2])

#############################################

# Calculate random permutation (NULL) distribution of LTDs for N full Replications of given Clusters / Subgroups...
N = 100           # Number of Random Permutation Replications in LC Confirm Phase Calculations...
nobs = nrow(lindner)
set.seed(12345)   # Set seed for Monte Carlo pseudo random sequence...

for(i in 1:N) {
       crand <- as.vector(rnorm(nobs))      # next vector of Random numbers...
       srand <- dflindner$c[order(crand)]		# corresponding vector of Permuted cluster numbers
	   pdf <- as.data.frame(cbind(srand, dflindner$y, dflindner$t))  # pdf = PERMUTED, 3 variable data.frame
	   colnames(pdf) <- c("c","y","t")
	   pdfc <- do.call( rbind, lapply( split(pdf, pdf$c),
		   function(x) {
			   n1 = sum(x$t)
			   n0 = length(x$t) - n1
			   if(n1 == 0 || n0 == 0) LTD = NA else LTD = sum(x$y * x$t)/n1 - sum(x$y * (1-x$t))/n0
			   data.frame(c=x$c[1], LTD=LTD, w=length(x$c))
		   } ) )           
       colnames(pdfc) <- c("c","LTD","w")
	   
	   for(j in 1:length(dfLreps[,1])) {
	          dfLreps$LTD[j] = pdfc$LTD[dflindner$c[j]]  # insert permuted LTD values
			  }
	   if( i == 1 ) dfconfirm = dfLreps else dfconfirm = rbind(dfconfirm, dfLreps)   
	   }

#str(dfconfirm)  # full random permutation distribution of NULL LTD estimates...
permLTDs = dfconfirm$LTD

ksobserved = ks.test(dfLTDobs$LTD, dfconfirm$LTD)
# Warning message:
# In ks.test(dfLTDobs$LTD, dfconfirm$LTD) :
#   p-value will be approximate in the presence of ties
#length(dfLTDobs$LTD)		# 996
#length(dfconfirm$LTD)		# 99600
#ksobserved             # Observed KS D = 0.42208
#ksobserved$p.value	    # = 0

#####################################################################

NKS = 1000        
set.seed(54321)    
ksDperm <- as.vector(rnorm(NKS))
for(i in 1:NKS) {
       crand <- as.vector(rnorm(nobs))      
       srand <- dflindner$c[order(crand)]	
	   pdf <- as.data.frame(cbind(srand, dflindner$y, dflindner$t))  
	   colnames(pdf) <- c("c","y","t")
	   pdfc <- do.call( rbind, lapply( split(pdf, pdf$c),
	   	   function(x) {
			   n1 = sum(x$t)
			   n0 = length(x$t) - n1
			   if(n1 == 0 || n0 == 0) LTD = NA else LTD = sum(x$y * x$t)/n1 - sum(x$y * (1-x$t))/n0
			   data.frame(c=x$c[1], LTD=LTD, w=length(x$c))
		   } ) )       
       colnames(pdfc) <- c("c","LTD","w")
	   
	   for(j in 1:length(dfLreps[,1])) {
	          dfLreps$LTD[j] = pdfc$LTD[dflindner$c[j]]  # insert permuted LTD values
			  }
	   ksobserved <- ks.test(dfLreps$LTD, dfconfirm$LTD)	  
	   ksDperm[i] <- ksobserved$statistic  
	   }
	   
#ksDperm[order(ksDperm)]    # Max of 100 NULL KS D stats = 0.4122992

}


###################################################
### code chunk number 3: figure_1
###################################################
set.seed(12345)
lindSS = sample(1:996, size = 498, replace = F)
slinder <- scale(lindner[lindSS, all7Vars], center=T, scale=T)
colvect <- c("#800000FF", "#0000FFFF", "#00FF00FF", "#008000FF", "#FF00FFFF", "#FF0000FF", "#00FFFFFF", "#FFFF00FF","#FF0099FF")
hc = hclust(dist(slinder), method = "ward.D")
dendy = as.dendrogram(hc)
dendy = color_branches(dendy, k = 9, col = colvect)
col_labels <- get_leaves_branches_col(dendy)
col_labels <- col_labels[order(order.dendrogram(dendy))]
heatmap.2(slinder,  dendrogram = "row", trace = "none", Rowv = dendy, col = colorspace::diverge_hsv(32), 
          keysize = .5,key = F, lwid = c(0.4,0.6), cexCol = .9, labRow = F, lhei = c(0.01, 1))


###################################################
### code chunk number 4: echo_install_lc (eval = FALSE)
###################################################
## install.packages("LocalControl")
## library("LocalControl")
## data("lindner")


###################################################
### code chunk number 5: echo_lcc_covars (eval = FALSE)
###################################################
## all7Vars = c("stent", "height", "female", "diabetic", 
##   "acutemi", "ejecfrac", "ves1proc")
## numClusters = c(1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50)


###################################################
### code chunk number 6: echo_lcc_execution (eval = FALSE)
###################################################
## linResults = LocalControlClassic( data = lindner,
##   clusterVars = all7Vars, treatmentColName = "abcix",
##   outcomeColName = "cardbill", clusterCounts = numClusters)


###################################################
### code chunk number 7: echo_lindner_plot (eval = FALSE)
###################################################
## UPSLTDdist(linResults, ylim = c(-2500, 5000))


###################################################
### code chunk number 8: figure_2
###################################################

  ltdds = lindnerResults[["ltdds"]]
  infPatFrac = lindnerResults[["summary"]]$Informative_fraction
  actClusterCounts = lindnerResults[["summary"]]$Clusters_created
  
  ltdm = sapply(ltdds, function(x) mean(x,na.rm=T))
  boxes = lapply(ltdds, FUN = function(x) boxplot(x, plot=FALSE))
  bStats = sapply(boxes, FUN = function(x) x$stats)

  yname = lindnerResults[["yname"]]
  
  globMean = ltdm[1]
  par(mar = c(5,5,2,5))
    plot(x = actClusterCounts, y = ltdm, ylim = c(-3000,5000),
  	lwd = 3, type = "l", col = "black",
  	xlab = "Number of Clusters",
  	ylab = paste0(yname," LTD Distribution"),
  	main = paste0(yname," Local Treatment Differences vs. Number of Clusters"))
  grid()

  lines(actClusterCounts, bStats[2,], col = "black", lty = 3, lwd = 2)#lower hinge
  lines(actClusterCounts, bStats[4,], col = "black", lty = 3, lwd = 2)#upper hinge
  abline(h = globMean, col = "purple", lty = 2, lwd = 2)

  par(new = T)
  plot( x = actClusterCounts, y = infPatFrac,
      	type = "l", lwd = 3, lty = 3,
      	axes=F, xlab=NA, ylab=NA,
      	cex=1.2, col = "green", ylim = c(0,1))

  axis(side = 4)
  mtext(side = 4, line = 3, 'Fraction of Patients Informative')
  legend( "bottomright",
      	col = c("purple", "black", "black",  "green"),
      	lty = c(2, 1, 3, 3), lwd = c(2, 3, 2, 2), bg = "white",
      	legend = c( "Global Treatment Difference", "Mean of the LTD distribution",
                		"Lower and upper quartile",	"Fraction of Patients Informative"))


###################################################
### code chunk number 9: figure_2_6
###################################################
par(mfrow = c(1,1), mar = c(4.1, 4.1, .2, .2))
plxmin = min(allrands, na.rm =T)
plxmax = max(allrands, na.rm =T)
plot(ecdf(allrands), verticals=TRUE, do.points=FALSE, ann=FALSE, col="green3", lwd=2, pch=46, xlim=c(plxmin,plxmax), xaxt="n")
grid()
lines(ecdf(localOutcomes$LTDobs), verticals=TRUE, do.points=FALSE, ann=FALSE, col="red", pch=46)
axis(1, at=axTicks(1), labels=sprintf(ifelse(axTicks(1) >= 0, "$%s","-$%s"), abs(axTicks(1))), las=1)
abline(v=0, lty="dashed")
legend("topleft", legend = c("Observed", "Artifical"), col = c("red", "green3"), lty = 1, bg = "white")
title(main=" ", ylab="Cumulative Probability", xlab="Local Treatment Differences")


###################################################
### code chunk number 10: figure_3
###################################################
xSim = simData[order(simData$ADR),]
xSim$colIntensity = seq(1 , 240 , length.out = nrow(xSim))/255

xSim$pc = ifelse(xSim$trmt == 1, t1Blue, t0Red)
xSim$pca = apply(X = xSim, MARGIN = 1, FUN = function(x) {setColAlpha(col = x["pc"], intensity = x["colIntensity"])})

par(mar = c(2.1,2.5,1.1,1), xaxs = "i",yaxs = "r")
plot( NA,
      xlab="", ylab="", xaxt = "n", yaxt = "n",
      xlim = c(35,115), ylim = c(35,115),
      pch = 16, lwd=7,
      cex.lab = 1.75,
      cex.axis = 1.4)
title(ylab = "Dosage (40-110 mcg/kg)", line=0.3, cex.lab = 1.5)
title(xlab = "Weight (40-110 kg)", line=0.3, cex.lab = 1.5)
grid()
box()
points(xSim$weight, xSim$dosage, col = xSim$pca, pch = 16)
legend("bottomright", legend = c("Treatment 0", "Treatment 1"), col = c(t0Red, t1Blue), pch = 16)


###################################################
### code chunk number 11: table_3 (eval = FALSE)
###################################################
##   t1t0 = xSim
##   t1s = xSim[which(xSim$trmt == 1),]
##   t0s = xSim[which(xSim$trmt == 0),]
## 
##   npats = c(nrow(t1t0), nrow(t0s), nrow(t1s), NA)
##   wmean = c(mean(t1t0$weight), mean(t0s$weight), mean(t1s$weight), t.test(t1s$weight, t0s$weight)$p.value)
##   wvars = c(sqrt(var(t1t0$weight)), sqrt(var(t0s$weight)), sqrt(var(t1s$weight)), var.test(t1s$weight, t0s$weight)$p.value)
##   dmean = c(mean(t1t0$dosage), mean(t0s$dosage), mean(t1s$dosage), t.test(t1s$dosage, t0s$dosage)$p.value)
##   dvars = c(sqrt(var(t1t0$dosage)), sqrt(var(t0s$dosage)), sqrt(var(t1s$dosage)), var.test(t1s$dosage, t0s$dosage)$p.value)
##   amean = c(mean(t1t0$ADR), mean(t0s$ADR), mean(t1s$ADR), t.test(t1s$ADR, t0s$ADR)$p.value)
##   avars = c(sqrt(var(t1t0$ADR)), sqrt(var(t0s$ADR)), sqrt(var(t1s$ADR)), var.test(t1s$ADR, t0s$ADR)$p.value)
## 
##   tabOut = t(data.frame(n = npats, weightmean = wmean, weightvar = wvars, dosagemean = dmean, dosagevar = dvars, adrmean = amean, adrvar = avars))


###################################################
### code chunk number 12: echo_sim_generation (eval = FALSE)
###################################################
## set.seed(253748)
## N = 10000
## weight = c(rnorm(N/2, 75, 15), rnorm(N/2, 75, 15))
## dosage = weight + c(rnorm(N/2, 0, 15), rnorm(N/2, 0,  5))
## trmt = c(rep(1, N/2), rep(0, N/2))
## ADR = abs(weight - dosage)
## noise1 = rnorm(n = N, 0, 1)
## noise2 = rnorm(n = N, 0, 1)
## xSim = data.frame(weight, trmt, dosage, ADR, noise1, noise2)


###################################################
### code chunk number 13: figure_4
###################################################
t1UVals = xSim[which(xSim$trmt == 1),"ADR"]
t0UVals = xSim[which(xSim$trmt == 0),"ADR"]
ulegtxt = c("Treatment 0", "Treatment 1" ,
            paste0("T0 mean outcome = ", round(mean(t0UVals, na.rm = T),digits = 2)),
            paste0("T1 mean outcome = ", round(mean(t1UVals, na.rm = T),digits = 3)))

t1CVals = xSultsT1
t0CVals = xSultsT0
clegtxt = c("Treatment 0", "Treatment 1" ,
             paste0("T0 mean outcome = ", round(mean(t0CVals, na.rm = T),digits = 2)),
             paste0("T1 mean outcome = ", round(mean(t1CVals, na.rm = T),digits = 3)))

par(mar = c(3.1,2.1,1.1,1.1), mfrow = c(1,2))
hist(t1UVals,breaks = seq(0, 60, by = 2), ylim = c(0,2500), xlim = c(0,30), yaxt = "n", panel.first = {grid(); box()},
     xaxs="i", yaxs="i", xlab="", col = t1Fill, lwd = 1, main = "", ylab = "",mgp=c(1.2,0.5,0))
hist(t0UVals, col = t0Fill, lwd = 5, add = T,breaks = seq(0,60, by = 2))
legend("topright", legend = ulegtxt, ncol = 1,cex = 1.1,x.intersp = c(-1, -1, 1, 1),
       fill = c(t0Fill, t1Fill, NA,  NA), bty = "n",
       border = c("black", "black", NA, NA), lty = c(NA,NA,3,3), lwd = c(NA,NA,5,5), col = c(NA,NA,t0Red,t1Blue))
abline(v = mean(t1UVals, na.rm = TRUE), col = t1Blue, lty = 3, lwd = 5)
abline(v = mean(t0UVals, na.rm = TRUE), col = t0Red, lty = 3, lwd = 5)
title(ylab = "Frequency", line=0.3, cex.lab = 1.5)
title(xlab = "ADR", line = 2, cex.lab = 1.5)

hist(t1CVals,breaks = seq(0, 60, by = 2), ylim = c(0,2500), xlim = c(0,30), yaxt = "n", panel.first = {grid(); box()},
     xaxs="i", yaxs="i", xlab="", col = t1Fill, lwd = 1, main = "", ylab = "",mgp=c(1.2,0.5,0))
hist(t0CVals, col = t0Fill, lwd = 5, add = T,breaks = seq(0,60, by = 2))
legend("topright", legend = clegtxt, ncol = 1,cex = 1.1,x.intersp = c(-1, -1, 1, 1),
       fill = c(t0Fill, t1Fill, NA,  NA), bty = "n",
       border = c("black", "black", NA, NA), lty = c(NA,NA,3,3), lwd = c(NA,NA,5,5), col = c(NA,NA,t0Red,t1Blue))
abline(v = mean(t1CVals, na.rm = TRUE), col = t1Blue, lty = 3, lwd = 5)
abline(v = mean(t0CVals, na.rm = TRUE), col = t0Red, lty = 3, lwd = 5)
title(ylab = "Frequency", line=0.3, cex.lab = 1.5)
title(xlab = "ADR", line = 2, cex.lab = 1.5)


###################################################
### code chunk number 14: echo_nnsim_execution (eval = FALSE)
###################################################
## xSults = LocalControl(data = xSim,
##   treatmentColName = "trmt",
##   treatmentCode = 1,
##   outcomeColName = "ADR",
##   clusterVars = c("weight", "dosage"),
##   radMinFract = .01,
##   radDecayRate = 0.95,
##   numThreads = 4)


###################################################
### code chunk number 15: table_4
###################################################
#ltdFrame = readRDS('calcs/ffltds.rds')
noisyVars = c("weight", "dosage", "noise1", "noise2")

difs = numeric()
difs[1] = 0
for(i in 2:ncol(ltdFrame)){
   difs[i] = avgDif(ltdFrame[1:92,1], ltdFrame[1:92,i])
}
outmat = expand.grid(c(-1,1),c(-1,1),c(-1,1),c(-1,1))
outmat = data.frame(outmat)
names(outmat) = noisyVars
outmat$difs = difs

dm = matrix(data = 0, nrow = 16, ncol = 6)
dm[,6] = 2

print(xtable(outmat, digits = dm), include.rownames = F, sanitize.text.function = function(x){x}, floating=FALSE)


###################################################
### code chunk number 16: echo_ff_step1 (eval = FALSE)
###################################################
## noisyVars = c("weight", "dosage", "noise1", "noise2")
## noisySults =  LocalControl( xSim,
##   treatmentColName = "trmt",
##   outcomeColName = "ADR",
##   clusterVars = noisyVars,
##   radMinFract = .01,
##   radDecayRate = 0.95 )
## fixedRads = summary(noisySults)$limits


###################################################
### code chunk number 17: echo_ff_step2 (eval = FALSE)
###################################################
## varCombinations = expand.grid(0:1, 0:1, 0:1, 0:1)
## ltext = apply(X = varCombinations, MARGIN = 1,
##   FUN = function(x) paste0(x, collapse = ''))
## ltdVecs = list()
## ltdVecs[[1]] = rep(summary(noisySults)$ltd[1], nrow(summary(noisySults)))
## for(i in 2:16){
##   varSS = noisyVars[which(varCombinations[i, ] == 1)]
##   scaleFactor = sqrt(length(varSS)) / sqrt(length(noisyVars))
##   scaleRads = fixedRads * scaleFactor
##   sults = LocalControl( xSim,
##     treatmentColName = "trmt",
##     outcomeColName = "ADR",
##     clusterVars = varSS,
##     radiusLevels = scaleRads )
##   ltdVecs[[i]] = summary(sults)$ltd
## }
## ltdFrame = data.frame(ltdVecs)
## names(ltdFrame) = ltext


###################################################
### code chunk number 18: echo_ff_step3 (eval = FALSE)
###################################################
## avgDif = function(uncorrected, corrected){
##   return(sum(uncorrected - corrected, na.rm = TRUE)/
##     length(which(!is.na(corrected))))
## }
## difs = numeric()
## difs[1] = 0
## for(i in 2:ncol(ltdFrame)){
##   difs[i] = avgDif(ltdFrame[1:92, 1], ltdFrame[1:92, i])
## }
## outmat = data.frame(expand.grid(c(-1,1), c(-1,1), c(-1,1), c(-1,1)))
## names(outmat) = noisyVars
## outmat$difs = difs


###################################################
### code chunk number 19: figure_5
###################################################
  ltext = apply(varCombinations, 1, function(x) paste0(x, collapse = ""))
  ltys = apply(varCombinations[,3:4], 1, function(x) ifelse(sum(x) == 1, 5, ifelse(sum(x) == 2, 2, 1)))
  cols = apply(varCombinations, 1, function(x) ifelse(x[1] == 1, ifelse(x[2] == 1, "purple", "red"), ifelse(x[2] == 1, "blue", "green")))
  cols[1] = "black"
  prads = resultSummary$pct_radius[1:(nrow(resultSummary) - 1)]
  
  xl = c(1,min(prads))
  par(mar=c(4.1,4.1,2.1,0.5))
  plot(NA, xlim = xl, ylim = c(0,9),
       xlab = "Fraction of maximum radius",
       ylab = "ADR treatment difference", log = "x", panel.first = grid(equilogs=FALSE),main = "Full-factorial simulation analysis")

  for(i in 16:1){
    ltdz = ltdVecs[[i]]
    lines(x = prads, y = ltdz[1:(length(ltdz)-1)], xlim = xl, ylim = c(0, 9), col = cols[i], lty = ltys[i],  pch = 16, lwd = 3)
  }

  lt = c("Uncorrected", "Weight and noise only", "Dosage and noise only", "Both weight and dosage", "Noise only")
  box()
  legend("bottomleft",col = cols, lwd = 2, lty = ltys, legend = ltext)
  legend(x = .702, y = 1.66,cex = 1, legend = lt, col = c("black", "red", "blue", "purple", "green"), lwd = NA, pch = 15)


###################################################
### code chunk number 20: echo_nnlc_regression
###################################################
model <- formula("difs ~ (weight + dosage + noise1 + noise2)^4")
fit <- glm( difs ~ 1, data = outmat, family = gaussian)
fit.AIC <- step( fit, model, k = 2, trace = 0, direction = "both")
regTable = summary.glm( fit.AIC )$coef


###################################################
### code chunk number 21: table_5
###################################################
dm = matrix(data = 2, nrow = 4, ncol = 5)
dm[,5] = -2
print(xtable(regTable, digits = dm), include.rownames = T, floating=FALSE)


###################################################
### code chunk number 22: echo_nnlc_regression (eval = FALSE)
###################################################
## model = formula("difs ~ (weight + dosage + noise1 + noise2)^4")
## fit = glm( difs ~ 1, data = outmat, family = gaussian)
## fit.AIC = step( fit, model, direction = "both", k = 2, trace = 0)
## regTable = summary.glm( fit.AIC )$coef


###################################################
### code chunk number 23: echo_lind_nnlc_execution (eval = FALSE)
###################################################
## linRes = LocalControl(data = lindner,
##   clusterVars = all7Vars, treatmentColName= "abcix",
##   outcomeColName = "cardbill", treatmentCode = 1)
## linCI = LocalControlNearestNeighborsConfidence(data = lindner,
##   clusterVars = all7Vars, treatmentColName = "abcix",
##   outcomeColName = "cardbill", treatmentCode = 1,
##   nBootstrap = 100)
## plot(linRes, nnConfidence = linCI)


###################################################
### code chunk number 24: figure_6
###################################################
plot(linRes, nnConfidence = linCI, main = "LocalControl confidence intervals")


###################################################
### code chunk number 25: table_7
###################################################
  tas = survSimData[which(survSimData$drug == 1),]
  tbs = survSimData[which(survSimData$drug == 0),]
  ot = data.frame(matrix(data = 0, nrow = 3, ncol = 4), row.names = c("n (patients)", "age (years)", "BMI ($\\frac{kg}{m^2}$)"))
  names(ot) = c("A + B", "A", "B", "$p$~value")
  ot[1,] = as.numeric(c(nrow(survSimData), nrow(tas),nrow(tbs),  NA))
  ageTest = t.test(tas$age, tbs$age)
  ot[2,] = as.numeric(c(mean(survSimData$age), mean(tas$age), mean(tbs$age), as.numeric(ageTest$p.value)))
  bmiTest = t.test(tas$bmi, tbs$bmi)
  ot[3,] = as.numeric(c(mean(survSimData$bmi), mean(tas$bmi), mean(tbs$bmi), as.numeric(bmiTest$p.value)))
  ctext = "Survival simulation cohort summary. A hypothetical hypertension Treatment A (blue) is prescribed more frequently to younger, healthier patients with a low body mass index (BMI), Treatment B (red) is prescribed to older patients with a higher body mass index. Significant treatment biases exist for age and BMI."
  dm = matrix(data = 2, nrow = 3, ncol = 5)
  dm[,5] = -2
  dm[1,] = 0

  print(xtable(ot, caption = ctext, label = "tab:ssimData", digits = dm, align = "lrrrr"),
        sanitize.text.function = function(x){x},
        floating=FALSE,
        hline.after=NULL,
        add.to.row=list(pos=list(-1, 0, nrow(ot)),
                        command = c('\\hline\n','\\hline\n','\\hline\n')))


###################################################
### code chunk number 26: echo_survival_sim_generation (eval = FALSE)
###################################################
## weibullSim = function(N, lambda, rho, betadrug, betaage, betabmi)
## {
##   bmi = rnorm(N, mean = 26, sd = 4)
##   age = runif(N) * 47 + 18
##   pbmi = (bmi - min(bmi)) / (max(bmi) - min(bmi)) * 0.8 + 0.1
##   page = (age - min(age)) / (max(age) - min(age)) * 0.8 + 0.1
##   drug = 1 - rbinom(N, 1, (pbmi + page) / 2)
##   et = exp(drug * betadrug + bmi * betabmi + age * betaage)
##   Tlat = (-log(runif(n = N)) / (lambda * et))^(1 / rho)
##   C = runif(N) * 30
##   time = pmin(Tlat, C)
##   status = as.numeric(Tlat <= C)
##   data.frame(id = 1:N, drug, age, bmi, time, status)
## }
## survSimData = weibullSim(10000, 1e-10, 2.6, log(3), log(1.15), log(1.5))


###################################################
### code chunk number 27: echo_call_cardsim (eval = FALSE)
###################################################
## results = LocalControl( data = cardSim, 
##   outcomeType = "survival",
##   treatmentColName = "drug",
##   timeColName = "time",
##   outcomeColName = "status",
##   clusterVars =  c("age", "bmi"))


###################################################
### code chunk number 28: figure_7
###################################################
sSim = survSimData
maxtime = max(sSim$time)
sSim$pc = ifelse(sSim$drug == 1, t1Blue, t0Red)
sSim$ci = 1 - sSim$time/maxtime
sSim$pca = apply(X = sSim, MARGIN = 1, FUN = function(x) {setColAlpha(col = x["pc"], intensity = x["ci"])})
sSim = sSim[sample(nrow(sSim), nrow(sSim)),]

par(mar = c(2.6,2.6,1,.9), mgp = c(1.6, 0.5, 0))
plot(NA,xlim = c(0,30), ylim = c(0,1),xaxs="i", yaxs="i", xlab = "Time in years",cex.lab = 1, cex.axis = 1, cex = 1,
  ylab = "Survival probability")
grid()

lines(x =sSimFTs, y=sSimT1R1, xlim = c(0,30), ylim = c(0,1), col = t1Blue, lty = 2, lwd = 2)
lines(x = sSimFTs, y=sSimT0R1, xlim = c(0,30), ylim = c(0,1), col = t0Red, lty = 2, lwd = 2)
lines(x = sSimFTs, y=sSimT1R21, xlim = c(0,30), ylim = c(0,1), col = t1Blue, lwd = 2)
lines(x = sSimFTs, y=sSimT0R21, xlim = c(0,30), ylim = c(0,1), col = t0Red, lwd = 2)

box()
legend("bottomleft", legend = c("Treatment A (uncorrected)", "Treatment A (corrected)",
                                "Treatment B (uncorrected)", "Treatment B (corrected)"),
       lty = c(2, 1, 2, 1), lwd = c(2,2,2,2), pt.cex = 1, cex = 1,col = c(t1Blue, t1Blue, t0Red, t0Red))

#http://stackoverflow.com/questions/17041246/how-to-add-an-inset-to-topright-of-an-r-plot
subplot(
  plot(x = sSim$age, y = sSim$bmi, xlab = "Age (18-65)", ylab = "BMI (10-40)",col=sSim$pca,
       xaxt = 'n', yaxt = 'n', pch=20, cex.lab=1, cex = .8,
       mgp=c(0.5,0,0),cex.axis=0.5), x=grconvertX(c(0.5,1), from='npc'),
       y=grconvertY(c(0.5,1), from='npc'), type='fig', pars=list( mar=c(1.5,1.5,0,0)+0.1, mgp = c(0,0,0)))


###################################################
### code chunk number 29: table_8
###################################################
  data(framingham)
  
  smokers = framingham[which(framingham$cursmoke == 1), ]
  nonsmokers = framingham[which(framingham$cursmoke == 0), ]
  framVars = c("female", "totchol", "age", "bmi", "BPVar", "heartrte", "glucose")

  ot = data.frame(matrix(data = 0, nrow = 8, ncol = 4),
                  row.names = c("n (patients)",
                                "female",
                                "totchol ($\\frac{mg}{dL}$)",
                                "age (years)",
                                "BMI ($\\frac{kg}{m^2}$)",
                                "BPVar (mm Hg)",
                                "heartrte (bpm)",
                                "glucose ($\\frac{mg}{dL}$)"))

  names(ot) = c("All patients", "Smokers", "Nonsmokers", "$p$~value")
  ot[1,] = as.numeric(c(nrow(framingham), nrow(smokers),nrow(nonsmokers),  NA))

  for(i in 1:length(framVars)){
    cv = framVars[i]
    ot[i+1,] = as.numeric(c(mean(framingham[, cv]), mean(smokers[, cv]), 
                            mean(nonsmokers[, cv]), as.numeric(t.test(smokers[, cv],nonsmokers[, cv])$p.value)))
  }

  ctext = 'Framingham Heart Study cohort biases. Patients with preexisting cardiovascular conditions are dropped from the study. Fisher\'s exact test is used for the comparison of the female binary covariate. For the remaining continuous covariates, a t-test is used to compare the two groups. Smoking "treatment" bias significantly affects sex, age, BMI, blood pressure, and heart rate.'
  dm = matrix(data = 2, nrow = 8, ncol = 5)
  dm[,5] = -2
  dm[1,] = 0

  print(xtable(ot, caption = ctext, label = "tab:framData", digits = dm), sanitize.text.function = function(x){x}, table.placement="ht")


###################################################
### code chunk number 30: echo_fram_ana (eval = FALSE)
###################################################
## data("framingham")
## 
## framVars = c("female","totchol","age","bmi","BPVar","heartrte","glucose")
## FHSResults = LocalControl( data = framingham, outcomeType = "survival",
##   treatmentColName = "cursmoke", treatmentCode = 1,
##   timeColName = "time_outcome", outcomeColName = "outcome",
##   clusterVars = framVars)
## print(summary(FHSResults))


###################################################
### code chunk number 31: table_9
###################################################
dm = matrix(data = 2, nrow = 11, ncol = 6)
dm[1,] = 0
dm[,6] = -2

print(xtable(FHSSummary[1:11,], digits = dm, caption = "Framingham Local Control summary. Each row corresponds to one radius of correction. The values in the first column are the radius lengths in normalized units. The second column contains the fraction of observations who are informative at the given radius. The pct\\_radius column is the size of the radius as a fraction of the maximum distance between any two observations. The last two columns contain the results from the hypothesis tests comparing the hypertension CIFs for the two treatment groups (as described in Section~\\ref{sec:pepe}).", label = 'tab:framSumm'), include.rownames = T,NA.string = "-", table.placement="hb")


###################################################
### code chunk number 32: figure_8
###################################################
plotz = list()
for(radLim in c("rad_1","rad_11")){

    t1lines2plot = FHSPlotLines[[radLim]][["t1HT"]] 
    t0lines2plot = FHSPlotLines[[radLim]][["t0HT"]]
    t1DeathLines = FHSPlotLines[[radLim]][["t1Death"]] 
    t0DeathLines = FHSPlotLines[[radLim]][["t0Death"]]

    ptitle = ifelse(radLim=="rad_1", "Uncorrected cumulative incidence", "Local control corrected")

    plotz[[radLim]]<-ggplot() +
                     theme_bw(base_size = 12) +
                     theme(plot.title = element_text(hjust = 0.5)) +
                     ggtitle(ptitle) +
                     geom_line(data = t1lines2plot, aes(x = TIMES, y=CIF, colour=NG, linetype = NG)) +
                     geom_ribbon(data = t1lines2plot,aes(x = TIMES,ymin=LOWER, ymax=UPPER, fill = NG), alpha=0.2) +
                     geom_line(data = t0lines2plot, aes(x = TIMES, y=CIF, colour=NG, linetype = NG)) +
                     geom_ribbon(data = t0lines2plot,aes(x = TIMES,ymin=LOWER, ymax=UPPER, fill = NG), alpha=0.2) +
                     geom_line(data = t0DeathLines, aes(x = TIMES, y=CIF, colour=NG, linetype = NG)) +
                     geom_ribbon(data = t0DeathLines,aes(x = TIMES,ymin=LOWER, ymax=UPPER, fill = NG), alpha=0.2)  +
                     geom_line(data = t1DeathLines, aes(x = TIMES, y=CIF, colour=NG, linetype = NG)) +
                     geom_ribbon(data = t1DeathLines,aes(x = TIMES,ymin=LOWER, ymax=UPPER, fill = NG), alpha=0.2) +
                     scale_fill_manual(values = c( "#377EB8", "#377EB8","#E41A1C","#E41A1C"), name = "Smoker status and outcome",
                                       labels = c("Nonsmoker Death", "Nonsmoker Hypertension","Smoker Death", "Smoker Hypertension")) +
                     scale_colour_manual( values = c( "#377EB8", "#377EB8","#E41A1C","#E41A1C"), name = "Smoker status and outcome",
                                          labels = c("Nonsmoker Death", "Nonsmoker Hypertension","Smoker Death", "Smoker Hypertension"))+
                     scale_linetype_manual(name = "Smoker status and outcome",
                                           labels = c("Nonsmoker Death", "Nonsmoker Hypertension","Smoker Death", "Smoker Hypertension"),
                                           values = c(1, 2, 1, 2)) +
                     scale_x_continuous(limits =c(0,24),expand = c(0, 0), breaks = seq(0, 24, 2),
                                        name = "Time (years)") +
                     scale_y_continuous(limits =c(0,.7), expand = c(0, 0), breaks = seq(0, .7, .1),
                                        name = "Cumulative incidence of death and hypertension") +
                     theme(legend.justification=c(0,1),
                           legend.position=c(0,1),
                           legend.title=element_blank(),
                           legend.direction='vertical',
                           legend.box='horizontal',
                           legend.background = element_rect(colour = 'transparent', fill = 'transparent'))


}
grid.arrange(plotz$rad_1, plotz$rad_11, ncol=1)


###################################################
### code chunk number 33: figure_9
###################################################
#sults = linSults
lindner$rad_33 = linRad33 # sults$ltds$rad_33

lindner$stent = ifelse(lindner$stent == 1, "1", "0")
lindner$female = ifelse(lindner$female == 1, "1", "0")

fit <- rpart(formula = rad_33 ~ female + stent, cost = c(0.5, 2),
             data = lindner, control=rpart.control(maxdepth=2,cp=-1), method = "anova")

boxlabs = c("Entire population",  "All male", "Male without stent", "Male with stent","All female", "Female with stent", "Female without stent")
boxlabs = paste0(boxlabs, "\ncb = ")

prp(fit, main=NA,
    type=4, fallen=T, branch=.3, round=0, leaf.round=0,
    clip.right.labs=F, under.cex=1,
    border.col = c("purple", "blue","blue","blue", "#FF0099FF", "#FF0099FF","#FF0099FF"),
    box.palette=0, prefix = boxlabs,
    branch.col = c("#FF0099FF", "blue", "blue", "blue", "#FF0099FF", "#FF0099FF"),
    branch.lwd=3, branch.lty = rep(1,6),  # branch.lty = c(2,1,2,1,1,1),
    extra=1, under=F, lt=" < ", ge=" >= ")

par(mar = c(0,0,0,0))

botrowbot = -0.01
botrowtop = 0.165
sidePoints = 5
tbPoints = 8
pcex = 0.7

#MEN WITHOUT STENT BOX
box1LX = -0.015
box1RX =  0.1875
points(x = rep(box1LX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "blue", pch = 1, cex = pcex) #left
points(x = rep(box1RX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "blue", pch = 1, cex = pcex) #right
points(x = seq(from = box1LX, to = box1RX, length.out = tbPoints), y = rep(botrowtop, tbPoints) , col = "blue", pch = 1, cex = pcex) #top
points(x = seq(from = box1LX, to = box1RX, length.out = tbPoints), y = rep(botrowbot, tbPoints) , col = "blue", pch = 1, cex = pcex) #bot

box2LX = 0.273
box2RX = 0.4423
points(x = rep(box2LX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "blue", pch = 16, cex = pcex) #left
points(x = rep(box2RX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "blue", pch = 16, cex = pcex) #right
points(x = seq(from = box2LX, to = box2RX, length.out = tbPoints), y = rep(botrowtop, tbPoints) , col = "blue", pch = 16, cex = pcex) #top
points(x = seq(from = box2LX, to = box2RX, length.out = tbPoints), y = rep(botrowbot, tbPoints) , col = "blue", pch = 16, cex = pcex) #bot

box3LX = 0.53
box3RX = .73
points(x = rep(box3LX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "#FF0099FF", pch = 16, cex = pcex) #left
points(x = rep(box3RX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "#FF0099FF", pch = 16, cex = pcex) #right
points(x = seq(from = box3LX, to = box3RX, length.out = tbPoints), y = rep(botrowtop, tbPoints) , col = "#FF0099FF", pch = 16, cex = pcex) #top
points(x = seq(from = box3LX, to = box3RX, length.out = tbPoints), y = rep(botrowbot, tbPoints) , col = "#FF0099FF", pch = 16, cex = pcex) #bot

box4LX = 0.789
box4RX = 1.02
points(x = rep(box4LX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "#FF0099FF", pch = 1, cex = pcex) #left
points(x = rep(box4RX, sidePoints), y = seq(from = botrowbot, to = botrowtop, length.out = sidePoints) , col = "#FF0099FF", pch = 1, cex = pcex) #right
points(x = seq(from = box4LX, to = box4RX, length.out = tbPoints), y = rep(botrowtop, tbPoints) , col = "#FF0099FF", pch = 1, cex = pcex) #top
points(x = seq(from = box4LX, to = box4RX, length.out = tbPoints), y = rep(botrowbot, tbPoints) , col = "#FF0099FF", pch = 1, cex = pcex) #bot


###################################################
### code chunk number 34: figure_10
###################################################

pMatches = linSummary[nrow(linSummary),]
everyone = linSummary[1:(nrow(linSummary)-1),]

logXlimits = c(1,min(everyone$pct_radius))

layMatrix = matrix(1, nrow = 20, ncol = 20, byrow = TRUE)
layMatrix[1:5,1:18] = 3
layMatrix[6:20,19:20] = 2
layMatrix[1:5,19:20] = 4

layout(layMatrix)

#Bottomleft - Main plot
par(mar = c(4.1,4.1,0,0))
{
plot(x = everyone$pct_radius,y = everyone$ltd, xlim = logXlimits,type = "l",
     xlab = "Fraction of maximum radius", ylim = c(-16001, 8000), col = "purple",
     ylab = "Cardbill difference (Abciximab - control)", log = "x", panel.first=grid(equilogs=FALSE), lwd= 2)
lines(x = everyone$pct_radius, y = everyone$maleAverage, col = "blue", lwd= 2)
lines(x = everyone$pct_radius, y = everyone$femaleAverage, col = "#FF0099FF", lwd= 2)
lines(x = everyone$pct_radius,y = everyone$male_without, col = "blue", pch = 1, type = "o")
lines(x = everyone$pct_radius,y = everyone$female_without, col = "#FF0099FF", pch = 1, type = "o")
lines(x = everyone$pct_radius,y = everyone$male_stent, col = "blue", pch = 16, type = "o")
lines(x = everyone$pct_radius,y = everyone$female_stent, col = "#FF0099FF", pch = 16, type = "o")
abline(v=linSummary["rad_33","pct_radius"],col="forestgreen", lwd = 3, lty = 3)

legend("bottomleft", cex = 1.1,
       legend = c( "Entire population", "Women", "Men",
                   "Women with stents", "Men with stents",
                   "Women without stents", "Men without stents",
                   "Fraction of informative data","Tree-radius"),
       col = c("purple", rep(c("#FF0099FF", "blue" ),3), "black","forestgreen"), 
       lwd = c(2,2,2,rep(1,4),2,3), lty = c(rep(1,8),3), pch = c(NA,NA,NA,16,16,1,1,NA,NA))
}

#Bottomright - Perfect matches
par(mar = c(4.1, 0.5,0,2))
{
plot(NA, xaxt = "n", yaxt = "n", ylim = c(-16001, 8000) ,xlim=c(-1,1), xlab = NA, ylab=NA, panel.first = grid(nx = 2, ny = NULL))
axis(side = 1, at = 0)
mtext(side = 1, text = "Perfect\n matches", cex = 0.6, line = 3)
lines(x = c(-1/2,1/2),y = c(pMatches$ltd,pMatches$ltd), col = "purple", lwd = 2)
lines(x = c(-1/2,1/2),y = c(pMatches$maleAverage,pMatches$maleAverage), col = "blue", lwd = 2)
lines(x = c(-1/2,1/2),y = c(pMatches$femaleAverage,pMatches$femaleAverage), col = "#FF0099FF", lwd = 2)
points(x = c(-1/2,0,1/2),y = rep(pMatches$male_without,3), col = "blue",  pch = 1, type = "o")
points(x = c(-1/2,0,1/2),y = rep(pMatches$female_without,3), col = "#FF0099FF",  pch = 1, type = "o")
points(x = c(-1/2,0,1/2),y = rep(pMatches$male_stent,3), col = "blue",  pch = 16, type = "o")
points(x = c(-1/2,0,1/2),y = rep(pMatches$female_stent,3), col = "#FF0099FF", pch = 16, type = "o")
}

#Topleft - pct info for main plot
par(mar = c(0.5, 4.1, 2, 0))
{
plot(x = everyone$pct_radius, y = everyone$pct_data,
     xaxt = "n",yaxt="n",type = "l", lwd = 3,
     ylab =NA , xlab=NA, xlim = logXlimits, ylim = c(0,1),
     log="x", panel.first=grid(ny = 5,nx=NULL,equilogs = F))
abline(v=linSummary["rad_33","pct_radius"],col="forestgreen", lwd = 3, lty = 3)

mtext(side = 2, text = "Fraction\ninformative data", cex = 0.6, line = 2)
axis(side = 2, at = c(0,0.2,0.4,0.6,0.8,1), labels = c(0,".2",".4",".6",".8","1"),cex.axis = .9)
}

#Topright - pct info for perfect matches
par(mar = c(0.5, 0.5, 2, 2))
{
plot(x=c(-1/2,1/2), y= c(pMatches$pct_data, pMatches$pct_data),
     type = "l", xlim = c(-1,1), ylim = c(0,1), xaxt = "n", lwd = 3,
     yaxt = "n", xlab = NA, ylab=NA, panel.first=grid(ny = 5,nx=2))
}



