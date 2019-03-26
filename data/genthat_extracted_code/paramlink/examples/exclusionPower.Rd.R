library(paramlink)


### Name: exclusionPower
### Title: Power of exclusion
### Aliases: exclusionPower

### ** Examples


############################################
### A standard case paternity case:
### Compute the power of exclusion when the claimed father is in fact unrelated to the child.
############################################

claim = nuclearPed(noffs=1, sex=2)     # Specifies individual 1 as the father of 3
true = list(singleton(id=1,sex=1), singleton(id=3, sex=2))     # Specifies 1 and 3 as unrelated
available = c(1, 3)     # Individuals 1 and 3 are available for genotyping

# Equifrequent autosomal SNP:
PE1 = exclusionPower(claim, true, available, alleles = 2, afreq=c(0.5,0.5))

# If the child is known to have genotype 1/1:
PE2 = exclusionPower(claim, true, available, alleles = 2, afreq=c(0.5,0.5), 
                     known_genotypes=list(c(3,1,1)))

# Equifrequent SNP on the X chromosome:
PE3 = exclusionPower(claim, true, available, alleles = 2, afreq=c(0.5,0.5), Xchrom=TRUE)

stopifnot(PE1==0.125, PE2==0.25, PE3==0.25)

############################################
### Example from Egeland et al. (2012): 
### Two females claim to be mother and daughter. Below we compute the power of various 
### markers to reject this claim if they in reality are sisters.
############################################

mother_daughter = nuclearPed(1, sex = 2)
sisters = relabel(nuclearPed(2, sex = c(2, 2)), c(101, 102, 2, 3))

# Equifrequent SNP:
PE1 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters, ids = c(2, 3),
                     alleles = 2)

# SNP with MAF = 0.1:
PE2 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters, ids = c(2, 3), 
                     alleles = 2, afreq=c(0.9, 0.1))

# Equifrequent tetra-allelic marker:
PE3 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters, ids = c(2, 3),
                     alleles = 4)

# Tetra-allelic marker with one major allele:
PE4 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters, ids = c(2, 3),
                     alleles = 4, afreq=c(0.7, 0.1, 0.1, 0.1))              

stopifnot(round(c(PE1,PE2,PE3,PE4), 5) == c(0.03125, 0.00405, 0.08203, 0.03090))

####### How does the power change if the true pedigree is inbred?  
sisters_LOOP = addParents(sisters, 101, father = 201, mother = 202)
sisters_LOOP = addParents(sisters_LOOP, 102, father = 201, mother = 203)

# Equifrequent SNP:
PE5 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters_LOOP,
                     ids = c(2, 3), alleles = 2)

# SNP with MAF = 0.1:
PE6 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters_LOOP,
                     ids = c(2, 3), alleles = 2, afreq=c(0.9, 0.1))

stopifnot(round(c(PE5,PE6), 5) == c(0.03125, 0.00765))

## Not run: 
##D # Equifrequent tetra-allelic marker:
##D PE7 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters_LOOP,
##D                      ids = c(2, 3), alleles = 4)
##D 
##D # Tetra-allelic marker with one major allele:
##D PE8 = exclusionPower(ped_claim = mother_daughter, ped_true = sisters_LOOP, 
##D                      ids = c(2, 3), alleles = 4, afreq=c(0.7, 0.1, 0.1, 0.1))  
##D 
##D stopifnot(round(c(PE7,PE8), 5) == c(0.07617, 0.03457))
## End(Not run)




