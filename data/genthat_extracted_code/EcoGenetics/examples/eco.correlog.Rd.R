library(EcoGenetics)


### Name: eco.correlog
### Title: Moran's I, Geary's C and bivariate Moran's I correlograms,
###   omnidirectional and directional
### Aliases: eco.correlog

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D require(ggplot2)
##D 
##D 
##D ##########################
##D # Moran's I correlogram
##D ##########################
##D 
##D ## single test with phenotypic traits
##D moran <- eco.correlog(Z=eco[["P"]][,1], XY = eco[["XY"]], 
##D method = "I", smax=10, size=1000)
##D 
##D # interactive plot via plotly
##D eco.plotCorrelog(moran)
##D 
##D # standard plot via ggplot2
##D eco.plotCorrelog(moran, interactivePlot = FALSE)
##D 
##D 
##D #-------------------------------------------------------
##D ## A directional approach based in bearing correlograms
##D #-------------------------------------------------------
##D 
##D moran_b <- eco.correlog(Z=eco[["P"]][,1], XY = eco[["XY"]], 
##D method = "I", smax = 10, size = 1000, angle  = seq(0, 175, 5))
##D 
##D  # use eco.plotCorrelogB for this object
##D eco.plotCorrelogB(moran_b)
##D 
##D  # plot for the first distance class, 
##D  use a number between 1 and the number of classes to select the corresponding class
##D eco.plotCorrelogB(moran_b, var = 1) 
##D 
##D #-----------------------------
##D ## Multivariable correlograms
##D #-----------------------------
##D 
##D ## multiple tests with phenotypic traits
##D moran2 <- eco.correlog(Z=eco[["P"]], XY = eco[["XY"]],
##D method = "I", smax=10, size=1000)
##D 
##D eco.plotCorrelog(moran2, var ="P2") ## single plots
##D eco.plotCorrelog(moran2, var ="P3") ## single plots
##D 
##D 
##D  ## Multivariable interactive plot with mean correlogram 
##D  ## and jackknifed confidence intervals.
##D  
##D  graf <- eco.plotCorrelog(moran2, meanplot = TRUE)
##D  
##D  # Only mean
##D  graf$mean.correlog
##D  
##D  # Mean and variables
##D  graf$multi.correlog
##D  
##D  # Information
##D  - correlogram data for individual variables
##D  - manhattan distance matrix
##D  - mean correlogram data
##D  - method used for analysis
##D  - names and numbers (column in data frame) of significant variables 
##D  
##D  
##D  
##D  graf$data
##D  
##D  
##D  # plot only alleles
##D  graf <- eco.plotCorrelog(moran2, meanplot = FALSE)
##D  graf
##D  
##D  # Both plots can also be constructed using ggplot2
##D  
##D  gg_graf <- eco.plotCorrelog(moran2, meanplot = TRUE, interactivePlot = FALSE)
##D  gg_graf[[1]]
##D  gg_graf[[2]]
##D  
##D  gg_graf <- eco.plotCorrelog(moran2, meanplot = FALSE, interactivePlot = FALSE)
##D  gg_graf
##D 
##D 
##D # standard ggplot2 correlograms support the use of ggplot2 syntax
##D require(ggplot2)
##D moranplot <- eco.plotCorrelog(moran2, var ="P3", interactivePlot = FALSE) 
##D moranplot <- moranplot + theme_bw() + theme(legend.position="none")
##D moranplot
##D 
##D moranplot2 <- gg_graf[[2]] + theme_bw() + theme(legend.position="none")
##D moranplot2
##D 
##D 
##D #-----------------------
##D Analyzing genetic data
##D #-----------------------
##D 
##D # single test with genotypic traits
##D 
##D # eco[["A"]] is a matrix with the genetic data of "eco" 
##D # as frequencies for each allele in each individual. Each allele
##D # can be analyzed as single traits. 
##D 
##D head(eco[["A"]])      # head of the matrix
##D 
##D # analyzing allele 1
##D moran <- eco.correlog(Z=[["A"]][,1], XY = eco[["XY"]], method = "I",
##D smax=10, size=1000)                
##D eco.plotCorrelog(moran)
##D 
##D # multiple tests with genotypic traits. 
##D # nsim is set to 10 only for speed in the example
##D moran2 <- eco.correlog(Z = eco[["A"]], XY = eco[["XY"]], 
##D method = "I",smax=10, size=1000, nsim=99)
##D 
##D 
##D ## multiple plot with mean 
##D ## correlogram and jackknifed 
##D ## confidence intervals.
##D 
##D graf <- eco.plotCorrelog(moran2, meanplot = TRUE)
##D 
##D ## the same example, but with nsim = 99. 
##D moran3 <- eco.correlog(Z = eco[["A"]], XY = eco[["XY"]], method = "I", 
##D smax=10, size=1000, nsim=99)  
##D        
##D ## plot for alleles with at least one significant value after
##D ## Bonferroni-Holm sequential P correction
##D ## (set adjust "none" for no family-wise 
##D ## P correction in "eco.correlog")
##D 
##D eco.plotCorrelog(moran3, meanplot = TRUE, significant.M = TRUE)
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accesed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OUT(moran)      # slot OUT
##D ecoslot.BREAKS(moran)   # slot BREAKS
##D                                              
##D #---------------------------------------------------------------------------#
##D 
##D ##########################
##D # Geary's C correlogram
##D ##########################
##D 
##D geary <- eco.correlog(Z = eco[["P"]][,1], XY = eco[["XY"]], method = "C",
##D smax=10, size=1000)
##D # Interactive plot
##D eco.plotCorrelog(geary)
##D # ggplot2 plot
##D eco.plotCorrelog(geary, interactivePlot = FALSE)
##D 
##D #---------------------------------------------------------------------------#
##D 
##D ##########################
##D # Bivariate Moran's Ixy
##D ##########################   
##D 
##D cross <- eco.correlog(Z=eco[["P"]][,1], XY = eco[["XY"]], Y = eco[["P"]][, 1],
##D method = "CC", int= 2, smax=15)
##D # Interactive plot
##D eco.plotCorrelog(cross)
##D # ggplot2 plot
##D eco.plotCorrelog(cross, interactivePlot = FALSE)
##D 
## End(Not run)




