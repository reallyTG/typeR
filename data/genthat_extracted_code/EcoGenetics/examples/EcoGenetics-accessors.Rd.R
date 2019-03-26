library(EcoGenetics)


### Name: EcoGenetics accessors
### Title: Generic accessors for EcoGenetics objects
### Aliases: 'EcoGenetics accessors' ecoslot.XY ecoslot.XY<- ecoslot.P
###   ecoslot.P<- ecoslot.G ecoslot.G<- ecoslot.A ecoslot.A<- ecoslot.AF
###   ecoslot.AF<- ecoslot.E ecoslot.E<- ecoslot.S ecoslot.S<- ecoslot.C
###   ecoslot.C<- ecoslot.OUT ecoslot.OUT<- int.ecoslot.INT
###   int.ecoslot.INT<- ecoslot.XY,ecogen-method ecoslot.XY<-,ecogen-method
###   ecoslot.P,ecogen-method ecoslot.P<-,ecogen-method
###   ecoslot.G,ecogen-method ecoslot.G<-,ecogen-method
###   ecoslot.A,ecogen-method ecoslot.A<-,ecogen-method
###   ecoslot.E,ecogen-method ecoslot.E<-,ecogen-method
###   ecoslot.S,ecogen-method ecoslot.S<-,ecogen-method
###   ecoslot.C,ecogen-method ecoslot.C<-,ecogen-method
###   ecoslot.OUT,ecogen-method ecoslot.OUT<-,ecogen-method
###   int.ecoslot.INT,ecogen-method ecoslot.XY,ecopop-method
###   ecoslot.XY<-,ecopop-method ecoslot.P,ecopop-method
###   ecoslot.P<-,ecopop-method ecoslot.AF,ecopop-method
###   ecoslot.AF<-,ecopop-method ecoslot.E,ecopop-method
###   ecoslot.E<-,ecopop-method ecoslot.S,ecopop-method
###   ecoslot.S<-,ecopop-method ecoslot.C,ecopop-method
###   ecoslot.C<-,ecopop-method 'EcoGenetics accessors' ecoslot.ALTER
###   ecoslot.ANALYSIS ecoslot.ANOVA.MLM ecoslot.AVERAGE ecoslot.BREAKS
###   ecoslot.CARDINAL ecoslot.COND ecoslot.CONNECTED ecoslot.DF1
###   ecoslot.DF2 ecoslot.DISTMETHOD ecoslot.EXP ecoslot.FREQUENCIES
###   ecoslot.GF ecoslot.IN ecoslot.LOGMEAN ecoslot.LWR ecoslot.MEAN
###   ecoslot.METHOD ecoslot.MLM ecoslot.MODEL ecoslot.MULTI ecoslot.NAMES
###   ecoslot.NONZERO ecoslot.NONZEROIND ecoslot.NSIM ecoslot.OBS
###   ecoslot.OBS.RES ecoslot.PADJUST ecoslot.PAR ecoslot.PAR.VAL
###   ecoslot.POLY.DEG ecoslot.POP ecoslot.PREDICTIONS ecoslot.PVAL
###   ecoslot.RES ecoslot.ROW.SD ecoslot.SELF ecoslot.SP
###   ecoslot.SUMMARY.MLM ecoslot.TEST ecoslot.TREES ecoslot.UPPR ecoslot.W
### Keywords: internal

### ** Examples


## Not run: 
##D 
##D #--------------
##D # GENERAL USE
##D #--------------
##D 
##D # Example 1
##D 
##D data(eco.test)
##D 
##D ## Test with phenotypic traits (example of ?eco.correlog)
##D moran <- eco.correlog(Z=eco[["P"]][,1], XY = eco[["XY"]], method = "I", smax=10, size=1000)
##D # the slots are accesed with the generic format:
##D # ecoslot. + name of the slot + (name of the object)
##D 
##D ecoslot.OUT(moran)      # slot OUT
##D ecoslot.BREAKS(moran)   # slot BREAKS
##D 
##D 
##D #----------------------------------------------
##D # SPECIFIC USE OF ACCESSORS WITH ECOGEN OBJECTS
##D #----------------------------------------------
##D 
##D #1) GET MODE
##D 
##D # Example 2
##D 
##D # Example with G data of class "data.frame", corresponding to
##D # microsatellites of a diploid organism.
##D 
##D eco <- ecogen(XY = coordinates, P = phenotype, G = genotype,
##D               E = environment, S = structure, order.G = TRUE)
##D eco              
##D 
##D 
##D # Access to the slots   
##D 
##D ecoslot.XY(eco) 
##D ecoslot.P(eco)
##D ecoslot.G(eco)
##D ecoslot.A(eco)
##D ecoslot.E(eco)
##D ecoslot.S(eco)
##D ecoslot.C(eco)
##D ecoslot.OUT(eco)         
##D 
##D # For ecogen objects, the double square brackets ("[[")
##D # are symbolic abbreviations of the accessors:
##D 
##D ecoslot.XY(eco) 
##D # is identical to:
##D eco[["XY"]]
##D 
##D #2) SET MODE (REPLACEMENT OF SLOTS)
##D 
##D # Example 3
##D 
##D eco <- ecogen(XY = coordinates, P = phenotype)
##D eco
##D 
##D ecoslot.G(eco, order.G = TRUE) <- genotype
##D 
##D # this is identical to
##D eco[["G", order.G=TRUE]] <- genotype
##D 
##D ecoslot.E(eco) <- environment
##D ecoslot.S(eco) <- structure
##D 
##D # Storing the data of Example 1 in the slot OUT
##D 
##D ecoslot.OUT(eco) <- moran
##D  
##D # Storing several data
##D singers <- c("carlos_gardel", "billie_holiday")
##D golden.number <- (sqrt(5) + 1) / 2
##D ecoslot.OUT(eco) <- list(singers, golden.number)    # several objects must be passed as a list
##D 
##D # In get mode, ecoslot.OUT has a double behavior:
##D # when only the name of the ecogen object is passed to
##D # the accessor, it has an overview method, 
##D # returning a data frame with the objects
##D # stored and their classes
##D 
##D ecoslot.OUT(eco)
##D 
##D # ecoslot.OUT in get mode, has two arguments:
##D # ecoslot.OUT(object, ...)
##D # here, the three dots (...) means any object(s) stored in the slot OUT.
##D 
##D ecoslot.OUT(eco, "moran", "singers")
##D 
##D # In double square brackets notation, this is equivalent to
##D eco[["OUT"]][c("moran", "singers")]
##D # This is, it works as a list and have no overview method
##D eco[["OUT"]]
##D eco[["OUT"]]["moran"]
##D 
##D # ecoslot.OUT in set mode, has two arguments:
##D # ecoslot.OUT(object, value)
##D # here value means object(s) to store in the slot OUT. Several objects
##D # must be passed as a list.
##D # The names of the input data is recoded in case of
##D # duplicates
##D 
##D ecoslot.OUT(eco) <- singers
##D ecoslot.OUT(eco)
##D ecoslot.OUT(eco) <- list(singers, singers, singers)
##D ecoslot.OUT(eco)
##D 
##D # The set operation is equivalent with double square brackets
##D eco[["OUT"]] <- list(singers, c(1,2,3))
##D ecoslot.OUT(eco)
##D 
## End(Not run)





