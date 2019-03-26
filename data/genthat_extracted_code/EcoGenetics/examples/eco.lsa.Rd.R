library(EcoGenetics)


### Name: eco.lsa
### Title: Local spatial analysis
### Aliases: eco.lsa

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D #---------------------------------------------------------------------------#
##D 
##D 
##D #####################
##D # LOCAL MORAN'S I
##D #####################
##D 
##D DETAILED EXAMPLE
##D 
##D #-------------------------
##D # TESTING PHENOTYPIC DATA-
##D #-------------------------
##D 
##D set.seed(10)
##D 
##D # test for a single variable---------------------------------
##D #computing weights
##D 
##D con <- eco.weight(eco[["XY"]], method = "knearest",  k = 4, row.sd = TRUE) 
##D # row standardized weights = TRUE
##D 
##D # test for the first trait of the data frame P 
##D localmoran <- eco.lsa(eco[["P"]][, 1], con, method = "I", nsim = 99)     
##D 
##D # "rankplot" graph
##D eco.plotLocal(localmoran)
##D 
##D # test for several variables---------------------------------
##D 
##D # ordering the factor "pop" in increasing order and the object "eco"
##D # in relation to this ordered factor prior to the multivariate analysis.
##D # This step is important for "localplot" graphs.
##D 
##D eco <- eco[order(eco[["S"]][,1])]
##D 
##D #computing weights with the ordered object
##D 
##D con <- eco.weight(eco[["XY"]], method = "knearest",  k = 4, row.sd = TRUE) 
##D # row standardized weights = TRUE
##D 
##D all.traits <- eco.lsa(eco[["P"]], con, method = "I", nsim = 99)     
##D 
##D # Plot of the phenotypic spatial patterns
##D 
##D # "rasterplot" graph 
##D eco.plotLocal(all.traits)
##D 
##D # in grey: non significant results (P > 0.05)
##D # set significant = FALSE for showing significant and no significant results
##D eco.plotLocal(all.traits, significant = FALSE)
##D 
##D # single plots using "rankplot" graphs
##D all.single.traits <- eco.lsa(eco[["P"]],con, method = "I", nsim = 99, multi="list")
##D eco.plotLocal(all.single.traits)
##D 
##D # removing legends for a better visualization
##D eco.plotLocal(all.single.traits, legend = FALSE)
##D # - individual plots support ggplot2 sintax (plot equivalent to the previous):
##D eco.plotLocal(all.single.traits) + ggplot2::theme(legend.position="none")
##D 
##D 
##D #-------------------------
##D # TESTING GENOTYPIC DATA-
##D #-------------------------
##D 
##D # eco[["A"]] is a matrix with the genetic data of "eco"
##D # as frequencies for each allele in each individual.
##D 
##D head(eco[["A"]])      # head of the matrix - 40 alleles
##D 
##D # ordering the factor "pop" in increasing order and the object "eco"
##D # in relation to this ordered factor prior to the multivariate analysis.
##D # This step is important for "localplot" graphs
##D 
##D data(eco.test) # for security this resets the data (unordered)
##D 
##D eco <- eco[order(eco[["S"]][,1])] # ordering
##D 
##D # computing weights with the ordered object
##D 
##D con <- eco.weight(eco[["XY"]], method = "knearest",  k = 4, row.sd = TRUE) 
##D # row standardized weights = TRUE
##D 
##D # test for a single allele
##D localmoran.geno <-  eco.lsa(eco[["A"]][, 32], con, method = "I", nsim = 99)
##D 
##D # test for several alleles -  40 alleles (it runs in less than 1 min 
##D # for 99 simulations per allele;  999 simulations takes ~ 11 s per allele, 
##D # less than 8 min in total.) 
##D all.alleles <-  eco.lsa(eco[["A"]], con, method = "I", nsim = 99)
##D 
##D # plot all alleles to get an overview of the spatial patterns
##D eco.plotLocal(all.alleles)
##D 
##D # in grey: non significant results (P > 0.05)
##D # set significant = FALSE for showing significant and no significant results
##D eco.plotLocal(all.alleles, significant = FALSE)
##D 
##D # counting individuals with P < 0.05 for each allele (5 * 225 /100 ~  12 significant tests 
##D # by random)
##D signif <- apply(ecoslot.PVAL(all.alleles), 2, function(x) sum (x < 0.05))
##D 
##D # filtering alleles, loci with > 12 significant individual tests
##D 
##D A.local <- eco[["A"]][, signif > 12]     #filtered matrix
##D 
##D all.alleles.f <-  eco.lsa(eco[["A"]][, signif > 12] , con, method = "I", nsim = 99)
##D 
##D 
##D # Plot of the genotypic spatial patterns using "localplot" graphs
##D 
##D eco.plotLocal(all.alleles.f)
##D 
##D 
##D ## using "rankplot" graphs
##D 
##D all.sf <- eco.lsa(A.local,  2, eco.lsa, con, method = "I", nsim = 99, multi = "list")
##D eco.plotLocal(all.sf, legend = FALSE) 
##D 
##D 
##D #####################
##D # GETIS-ORD'S G*
##D #####################
##D 
##D con<- eco.weight(eco[["XY"]], method = "knearest",  k = 4, self = TRUE) # self = TRUE for G*
##D getis.ak <- eco.lsa(eco[["P"]][, 1], con, method = "G*", nsim = 99, adjust = "none")
##D getis.ak
##D 
##D ### to plot the results, the function "eco.lsa" calls "eco.rankplot"
##D ### (see ?eco.rankplot) when test = "permutation" and "eco.forestplot" (see ?eco.forestplot)
##D ###  when test = "bootstrap"
##D 
##D p <- eco.plotLocal(getis.ak)      # rankplot graph
##D p    #  points with colors of the color-scale:  
##D      #  points with P < 0.05. Yellow points : points with P > 0.05
##D p <- eco.plotLocal(getis.ak, significant = FALSE)  
##D p    # all points have a color of the color-scale 
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OUT(getis.ak)
##D 
##D ## bootstrap example
##D getis.akb <- eco.lsa(eco[["P"]][, 1], con, method = "G*", nsim = 99, test = "bootstrap")
##D p <- eco.plotLocal(getis.akb)      # forestplot graph
##D 
##D p2 <- eco.plotLocal(getis.akb, interactivePlot = FALSE)  
##D p2 + ggplot2::theme_bw()   # the plot can be modified with ggplot2
##D                           # In this case, the background is modified  (white color)
##D 
##D #---------------------------------------------------------------------------#
##D  
##D #####################
##D # GETIS-ORD'S G
##D #####################
##D 
##D con <- eco.weight(eco[["XY"]], method = "knearest", k = 4) 
##D # self = FALSE for G
##D getis <- eco.lsa(eco[["P"]][, 1], con, method = "G", nsim = 99)
##D eco.plotLocal(getis)
##D 
##D #---------------------------------------------------------------------------#
##D 
##D #####################
##D # LOCAL GEARY'S C
##D #####################
##D 
##D con<- eco.weight(eco[["XY"]], method = "knearest",  k = 4, row.sd = TRUE) 
##D # row standardized weights = TRUE
##D localgeary <- eco.lsa(eco[["P"]][, 1], con, method = "C", nsim = 99, adjust = "none")
##D eco.plotLocal(localgeary)
##D 
## End(Not run)




