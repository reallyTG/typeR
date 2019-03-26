library(optiSel)


### Name: opticont
### Title: Optimum Contributions of Selection Candidates
### Aliases: opticont

### ** Examples


## For other objective functions and constraints see the vignettes


######################################################
# Example 1: Advanced OCS with overlapping           #
#            generations using pedigree data         #
#   - maximize genetic gain                 (BV)     #
#   - restrict increase of mean kinship     (pKin)   #
#   - restrict increase of native kinship   (pKinatN)#
#   - avoid decrease of native contribution (NC)     #
######################################################

### Define object cand containing all required 
### information on the individuals

data(PedigWithErrors)
Pedig    <- prePed(PedigWithErrors, thisBreed="Hinterwaelder", lastNative=1970, 
                   keep=PedigWithErrors$Born%in%1992)
Pedig$NC <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")$native
use      <- Pedig$Born %in% (1980:1990) & Pedig$Breed=="Hinterwaelder"
use      <- use & summary(Pedig)$equiGen>=3
cont     <- agecont(Pedig, use, maxAge=10)

Phen     <- Pedig[use, ]
pKin     <- pedIBD(Pedig, keep.only=Phen$Indiv)
pKinatN  <- pedIBDatN(Pedig, thisBreed="Hinterwaelder",  keep.only=Phen$Indiv)
Phen$isCandidate <-  Phen$Born < 1990
cand     <- candes(phen=Phen, pKin=pKin, pKinatN=pKinatN, cont=cont)

### Mean values of the parameters in the population:

cand$mean
#          BV        NC      pKin    pKinatN
#1 -0.5648208 0.5763161 0.02305245 0.0469267


### Define constraints for OCS
### Ne: Effective population size
### L:  Generation interval

Ne   <- 100
L    <- 1/(4*cont$male[1]) + 1/(4*cont$female[1])
con <- list(uniform    = "female",
            ub.pKin    = cand$mean$pKin + (1-cand$mean$pKin)*(1/(2*Ne*L)),
            ub.pKinatN = cand$mean$pKinatN + (1-cand$mean$pKinatN)*(1/(2*Ne*L)),
            lb.NC      = cand$mean$NC)

### Solve the optimization problem

Offspring  <- opticont("max.BV", cand, con, trace=FALSE)

### Expected average values of traits and kinships 
### in the population now and at the next evaluation time

rbind(cand$mean, Offspring$mean)   
#          BV        NC       pKin    pKinatN
#1 -0.5648208 0.5763161 0.02305245 0.04692670
#2 -0.4972791 0.5763177 0.02341923 0.04790749

### Data frame with optimum contributions

Candidate <- Offspring$parent
Candidate[Candidate$oc>0.01, c("Indiv", "Sex", "BV", "NC", "lb", "oc", "ub")] 


######################################################
# Example 2: Advanced OCS with overlapping           #
#            generations using genotype data         #
#   - minimize mean kinship                 (sKin)   #
#   - restrict increase of native kinship   (sKinatN)#
#   - avoid decrease of breeding values     (BV)     #
#   - cause increase of native contribution (NC)     #
######################################################

## Not run: 
##D ### Prepare genotype data
##D 
##D data(map) 
##D data(Cattle)
##D 
##D ### Compute genomic kinship and genomic kinship at native segments
##D dir     <- system.file("extdata", package = "optiSel")
##D files   <- file.path(dir, paste("Chr", 1:2, ".phased", sep=""))
##D sKin    <- segIBD(files, map, minL=1.0)
##D sKinatN <- segIBDatN(files, Cattle, map, thisBreed="Angler",  minL=1.0)
##D 
##D ### Compute migrant contributions of selection candidates 
##D Haplo   <- haplofreq(files, Cattle, map, thisBreed="Angler", minL=1.0, what="match")
##D Comp    <- segBreedComp(Haplo$match, map)
##D Cattle[Comp$Indiv, "NC"] <- Comp$native
##D 
##D Phen  <- Cattle[Cattle$Breed=="Angler",]
##D cand  <- candes(phen=Phen, sKin=sKin, sKinatN=sKinatN, cont=cont)
##D 
##D ### Define constraints for OCS
##D ### Ne: Effective population size
##D ### L:  Generation interval
##D 
##D Ne <- 100 
##D L  <- 4.7 
##D con <- list(uniform    = "female",
##D             ub.sKinatN = cand$mean$sKinatN + (1-cand$mean$sKinatN)*(1/(2*Ne*L)),
##D             lb.NC      = 1.03*cand$mean$NC,
##D             lb.BV      = cand$mean$BV)
##D 
##D # Compute optimum contributions; the objective is to minimize mean kinship 
##D Offspring   <- opticont("min.sKin", cand, con=con)
##D 
##D # Check if the optimization problem is solved 
##D Offspring$info           
##D 
##D # Average values of traits and kinships 
##D rbind(cand$mean, Offspring$mean)         
##D #           BV        NC       sKin    sKinatN
##D #1 -0.07658022 0.4117947 0.05506277 0.07783431
##D #2 -0.07657951 0.4308061 0.04830328 0.06395410
##D 
##D # Value of the objective function 
##D Offspring$obj.fun
##D #      sKin 
##D #0.04830328 
##D 
##D ### Data frame with optimum contributions
##D 
##D Candidate <- Offspring$parent
##D Candidate[Candidate$oc>0.01, c("Indiv", "Sex", "BV", "NC", "lb", "oc", "ub")] 
##D 
##D 
##D #######################################################
##D # Example 3: Advanced OCS with overlapping            #
##D #            generations using genotype data          #
##D #            for multiple breeds or beeding lines     #
##D #   - Maximize breeding values in all breeds          #
##D #   - restrict increase of kinships within each breed #
##D #   - reduce average kinship across breeds            #
##D #   - restrict increase of native kinship in Angler   #
##D #   - cause increase of native contribution in Angler #
##D # by optimizing contributions of males from all breeds#
##D #######################################################
##D 
##D 
##D cand <- candes(phen=Cattle, sKin=sKin, sKinatN.Angler=sKinatN, cont=cont)
##D L  <- 5
##D Ne <- 100
##D 
##D con  <- list(uniform          = "female", 
##D              ub.sKin          = cand$mean$sKin - 0.01/L,
##D              ub.sKin.Angler   = cand$mean$sKin.Angler   +  (1-cand$mean$sKin.Angler  )/(2*Ne*L),
##D              ub.sKin.Holstein = cand$mean$sKin.Holstein + (1-cand$mean$sKin.Holstein )/(2*Ne*L),
##D              ub.sKin.Rotbunt  = cand$mean$sKin.Rotbunt  + (1-cand$mean$sKin.Rotbunt  )/(2*Ne*L),
##D              ub.sKin.Fleckvieh= cand$mean$sKin.Fleckvieh+ (1-cand$mean$sKin.Fleckvieh)/(2*Ne*L),
##D              ub.sKinatN.Angler= cand$mean$sKinatN.Angler+ (1-cand$mean$sKinatN.Angler)/(2*Ne*L), 
##D              lb.NC            = cand$mean$NC + 0.05/L)
##D             
##D Offspring <- opticont("max.BV", cand, con, trace=FALSE, solver="slsqp")
##D 
##D Offspring$mean
##D 
##D 
##D Candidate <- Offspring$parent[Offspring$parent$Sex=="male", ]
##D Candidate[Candidate$oc>0.01, c("Indiv", "Sex", "BV", "NC", "lb", "oc", "ub")] 
##D 
## End(Not run)




