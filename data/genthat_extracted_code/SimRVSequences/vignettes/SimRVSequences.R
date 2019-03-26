## ------------------------------------------------------------------------
# load the SimRVSequences library
library(SimRVSequences)

# load the hg_exons dataset
data("hg_exons")

# print the first four rows of hg_exons
head(hg_exons, n = 4)

## ------------------------------------------------------------------------
# create recombination map for exon-only data using the hg_exons dataset 
s_map <- create_slimMap(exon_df = hg_exons)

# print first four rows of s_map 
head(s_map, n = 4)

## ------------------------------------------------------------------------
# restrict output to the variables required by SLiM
slimMap <- s_map[, c("recRate", "mutRate", "endPos")]

# shift endPos up by one unit
slimMap$endPos <- slimMap$endPos - 1

# print first four rows of slimMap 
head(slimMap, n = 4)

## ------------------------------------------------------------------------
# load the hg_apopPath data
data("hg_apopPath")

# View the first 4 observations of hg_apopPath
head(hg_apopPath, n = 4)

## ---- eval =  FALSE, echo = TRUE-----------------------------------------
#  # Let's suppose the output is saved in the
#  # current working directory and is named "slimOut.txt".
#  # We import the data using the read_slim function.
#  s_out <- read_slim(file_path  = "slimOut.txt",
#                     recomb_map = create_slimMap(hg_exons),
#                     pathway_df = hg_apopPath)

## ------------------------------------------------------------------------
# import the EXmuts dataset
data(EXmuts)

# view the first 4 observations of EXmuts
head(EXmuts, n = 4)

## ------------------------------------------------------------------------
# import the EXhaps dataset
data(EXhaps)

# dimensions of EXhaps
dim(EXhaps)

## ------------------------------------------------------------------------
# number of rows in EXmuts
nrow(EXmuts)

## ------------------------------------------------------------------------
# View the first 30 mutations of the first 15 haplotypes in EXhaps
EXhaps[1:15, 1:30]

## ------------------------------------------------------------------------
# Recall that the variable pathwaySNV, which was created in 
# section 3.2, is TRUE for any SNVs in the pathway of interest.
# Here we tabulate the derived allele frequencies 
# of the SNVs located in our pathway.
table(EXmuts$afreq[EXmuts$pathwaySNV == TRUE])

## ------------------------------------------------------------------------
# Create the variable 'is_CRV', which is TRUE for SNVs
# in our pathway with derived allele frequency 5e-05 or 1e-04,
# and FALSE otherwise
EXmuts$is_CRV <- EXmuts$pathwaySNV & EXmuts$afreq %in% c(5e-5, 1e-04)

# verify that sum of the derived allele 
# frequencies of causal SNVs is 0.001
sum(EXmuts$afreq[EXmuts$is_CRV])

# determine the number of variants in our pool of causal variants
sum(EXmuts$is_CRV)

## ------------------------------------------------------------------------
# view first 4 observations of EXmuts
head(EXmuts, n = 4)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # load the SimRVPedigree library
#  library(SimRVPedigree)
#  
#  # Create hazard object from AgeSpecific_Hazards data
#  data(AgeSpecific_Hazards)
#  my_HR = hazard(AgeSpecific_Hazards)
#  
#  # load libraries needed to simulate pedigrees in parallel.
#  library(doParallel)
#  library(doRNG)
#  
#  npeds <- 5    #set the number of pedigrees to generate
#  
#  cl <- makeCluster(2)   # create cluster
#  registerDoParallel(cl) # register cluster
#  
#  
#  # simulate a sample of five pedigrees using foreach
#  study_peds = foreach(i = seq(npeds), .combine = rbind,
#                    .packages = c("SimRVPedigree"),
#                    .options.RNG = 844090518
#  ) %dorng% {
#    # Simulate pedigrees ascertained for at least three disease-affected individuals,
#    # according to the age-specific hazard rates in the `AgeSpecific_Hazards` data
#    # set, ascertained from 1980 to 2010, with start year spanning
#    # from 1900 to 1920, stop year set to 2018, and with genetic relative-risk 50.
#    sim_RVped(hazard_rates = my_HR,
#              GRR = 50, FamID = i,
#              RVfounder = TRUE,
#              founder_byears = c(1900, 1920),
#              ascertain_span = c(1980, 2010),
#              stop_year = 2018,
#              recall_probs = c(1, 0.5, 0),
#              num_affected = 3)[[2]]}
#  
#  stopCluster(cl) #shut down cluster

## ---- fig.height = 8, fig.width = 8.6------------------------------------
# import study peds
data("study_peds")

# Plot the pedigree with FamID 3
plot(study_peds[study_peds$FamID == 3, ],
     ref_year = 2018)

## ------------------------------------------------------------------------
# View the first 4 rows of study_peds
head(study_peds, n = 4)

## ------------------------------------------------------------------------
set.seed(11956)
# simulate SNV data using sim_RVstudy
study_seq <- sim_RVstudy(ped_files = study_peds, 
                         SNV_map = EXmuts,
                         haplos = EXhaps)

# determine the class of study seq
class(study_seq)

## ---- fig.height = 4.5, fig.width = 5.5----------------------------------
# plot the pedigree returned by sim_RVseq for family 3.
# Since we used the affected_only option the pedigree has
# been reduced to contain only disease-affected relatives.
plot(study_seq$ped_files[study_seq$ped_files$FamID == 3, ],
     location = "bottomleft")

## ------------------------------------------------------------------------
# View the first 15 haplotypes in ped_haplos
study_seq$ped_haplos[1:15, ]

## ------------------------------------------------------------------------
# Determine the dimensions of ped_haplos
dim(study_seq$ped_haplos)

# Determine the dimensions of EXhaps
dim(EXhaps)

## ------------------------------------------------------------------------
# View the first 4 observations in SNV_map
head(study_seq$SNV_map, n = 4)

## ------------------------------------------------------------------------
# view the first observations in haplo_map
head(study_seq$haplo_map)

## ------------------------------------------------------------------------
# to quickly view the causal rare variant for 
# each family we supply the appropriate columns of 
# haplo_map to unique
unique(study_seq$haplo_map[, c("FamID", "FamCRV")])

## ------------------------------------------------------------------------
# supply the famStudy object, returned by 
# sim_RVstudy, to the summary function
study_summary <- summary(study_seq)

# determine the class of study_summary
class(study_summary)

# view the names of the items in study_summary
names(study_summary)

## ------------------------------------------------------------------------
# view fam_allele_count
study_summary$fam_allele_count

## ------------------------------------------------------------------------
# view pathway_count
study_summary$pathway_count

## ------------------------------------------------------------------------
# create an example data frame that contains the 
# the variables: chrom, exonStart, and exonEnd
exDat <- data.frame(chrom     = c(1, 1, 1, 2, 2, 2),
                    exonStart = c(1, 2, 5, 1, 3, 3),
                    exonEnd   = c(3, 4, 7, 4, 5, 6))

# View exDat data set
exDat

## ------------------------------------------------------------------------
# supply exDat to combine_exons
# and view the results
combine_exons(exDat)

