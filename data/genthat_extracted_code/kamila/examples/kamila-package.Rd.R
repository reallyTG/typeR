library(kamila)


### Name: kamila-package
### Title: Clustering for mixed continuous and categorical data sets
### Aliases: kamila-package

### ** Examples

## Not run: 
##D # import and format a mixed-type data set
##D data(Byar, package='clustMD')
##D Byar$logSpap <- log(Byar$Serum.prostatic.acid.phosphatase)
##D conInd <- c(5,6,8:10,16)
##D conVars <- Byar[,conInd]
##D conVars <- data.frame(scale(conVars))
##D 
##D catVarsFac <- Byar[,-c(1:2,conInd,11,14,15)]
##D catVarsFac[] <- lapply(catVarsFac, factor)
##D catVarsDum <- dummyCodeFactorDf(catVarsFac)
##D 
##D # Modha-Spangler clustering with kmeans default Hartigan-Wong algorithm
##D gmsResHw <- gmsClust(conVars, catVarsDum, nclust = 3)
##D 
##D # Modha-Spangler clustering with kmeans Forgy-Lloyd algorithm
##D # NOTE searchDensity should be >= 10 for optimal performance:
##D # this is just a syntax demo
##D gmsResLloyd <- gmsClust(conVars, catVarsDum, nclust = 3,
##D   algorithm = "Lloyd", searchDensity = 3)
##D 
##D # KAMILA clustering
##D kamRes <- kamila(conVars, catVarsFac, numClust=3, numInit=10)
##D 
##D # Plot results
##D ternarySurvival <- factor(Byar$SurvStat)
##D levels(ternarySurvival) <- c('Alive','DeadProst','DeadOther')[c(1,2,rep(3,8))]
##D plottingData <- cbind(
##D   conVars,
##D   catVarsFac,
##D   KamilaCluster = factor(kamRes$finalMemb),
##D   MSCluster = factor(gmsResHw$results$cluster))
##D plottingData$Bone.metastases <- ifelse(
##D   plottingData$Bone.metastases == '1', yes='Yes',no='No')
##D 
##D # Plot Modha-Spangler/Hartigan-Wong results
##D msPlot <- ggplot(
##D   plottingData,
##D   aes(
##D     x=logSpap,
##D     y=Index.of.tumour.stage.and.histolic.grade,
##D     color=ternarySurvival,
##D     shape=MSCluster))
##D plotOpts <- function(pl) (pl + geom_point() + 
##D   scale_shape_manual(values=c(2,3,7)) + geom_jitter())
##D plotOpts(msPlot)
##D 
##D # Plot KAMILA results
##D kamPlot <- ggplot(
##D   plottingData,
##D   aes(
##D     x=logSpap,
##D     y=Index.of.tumour.stage.and.histolic.grade,
##D     color=ternarySurvival,
##D     shape=KamilaCluster))
##D plotOpts(kamPlot)
## End(Not run)



