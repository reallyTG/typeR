library(SemiCompRisks)


### Name: CIBMTR
### Title: Center for International Blood and Bone Marrow Transplant
###   Research (CIBMTR) data
### Aliases: CIBMTR
### Keywords: datasets

### ** Examples

data(CIBMTR_Params)
data(CIBMTR)

## CREATING DUMMY VARIABLES ##

# Sex (M: reference)
CIBMTR$sexP <- as.numeric(CIBMTR$sexP)-1

# Age (LessThan10: reference)
CIBMTR$ageP20to29 <- as.numeric(CIBMTR$ageP=="20to29")
CIBMTR$ageP30to39 <- as.numeric(CIBMTR$ageP=="30to39")
CIBMTR$ageP40to49 <- as.numeric(CIBMTR$ageP=="40to49")
CIBMTR$ageP50to59 <- as.numeric(CIBMTR$ageP=="50to59")
CIBMTR$ageP60plus <- as.numeric(CIBMTR$ageP=="60plus")

# Disease type (AML: reference)
CIBMTR$dTypeALL <- as.numeric(CIBMTR$dType=="ALL")
CIBMTR$dTypeCML <- as.numeric(CIBMTR$dType=="CML")
CIBMTR$dTypeMDS <- as.numeric(CIBMTR$dType=="MDS")

# Disease status (Early: reference)
CIBMTR$dStatusInt <- as.numeric(CIBMTR$dStatus=="Int")
CIBMTR$dStatusAdv <- as.numeric(CIBMTR$dStatus=="Adv")

# HLA compatibility (HLA_Id_Sib: reference)
CIBMTR$donorGrp8_8 <- as.numeric(CIBMTR$donorGrp=="8_8")
CIBMTR$donorGrp7_8 <- as.numeric(CIBMTR$donorGrp=="7_8")

# Covariate matrix
x <- CIBMTR[,c("sexP","ageP20to29","ageP30to39","ageP40to49","ageP50to59","ageP60plus",
"dTypeALL","dTypeCML","dTypeMDS","dStatusInt","dStatusAdv","donorGrp8_8","donorGrp7_8")]

# Set the parameter values
beta1 <- CIBMTR_Params$beta1.true
beta2 <- CIBMTR_Params$beta2.true
beta3 <- CIBMTR_Params$beta3.true
alpha1 <- CIBMTR_Params$alpha1.true
alpha2 <- CIBMTR_Params$alpha2.true
alpha3 <- CIBMTR_Params$alpha3.true
kappa1 <- CIBMTR_Params$kappa1.true
kappa2 <- CIBMTR_Params$kappa2.true
kappa3 <- CIBMTR_Params$kappa3.true
theta <- CIBMTR_Params$theta.true

set.seed(1405)
simCIBMTR <- simID(id=NULL, x, x, x, beta1, beta2, beta3, alpha1, alpha2, alpha3,
          kappa1, kappa2, kappa3, theta, SigmaV.true=NULL, cens=c(365,365))
          
names(simCIBMTR) <- c("time1", "event1", "time2", "event2")
CIBMTR <- cbind(simCIBMTR, CIBMTR) 
head(CIBMTR)



