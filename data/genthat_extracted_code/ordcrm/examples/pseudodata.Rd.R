library(ordcrm)


### Name: pseudodata
### Title: Pseudodata for Likelihood-Based Continual Reassessment Method
###   (CRM) Dose Finding Designs
### Aliases: pseudodata

### ** Examples


######################
###For POM Model######
######################
#Creates pseudodata with no stabilization and continuous dose levels
pseudodata(design='POM', dose10 = 200, dose90 = 3600, targetDLT = 0.3,
           stabilize = TRUE, discrete = FALSE, discretedoses = NA,
           percentagegradedose10 = c(45, 35, 10, 8, 2),
           percentagegradedose90 = c(2, 3, 5, 40, 50), combine01 = FALSE)
#Creates pseudodata with stabilize=T and discrete dose levels
pseudodata(design='POM', dose10 = 500, dose90 = 2000, targetDLT = 0.3,
           stabilize = TRUE, discrete = TRUE,
           discretedoses = c(200, 500, 1000, 1200, 1500, 1800))
#Creates pseudodata when toxicity grades 0 and 1 are one category
pseudodata(design='POM', dose10 = 200, dose90 = 1000, targetDLT = 0.3,
           stabilize = TRUE, discrete = FALSE, discretedoses = NA,
           percentagegradedose10 = c(80, 10, 8, 2),
           percentagegradedose90 = c(5, 5, 40, 50), combine01 = TRUE)

######################
###For CR Model#######
######################
#Creates pseudodata with no stabilization and continuous dose levels
pseudodata(design='CR', dose10 = 200, dose90 = 3600, targetDLT = 0.3,
           stabilize = TRUE, discrete = FALSE, discretedoses = NA,
           percentagegradedose10 = c(45, 35, 10, 8, 2),
           percentagegradedose90 = c(2, 3, 5, 40, 50), combine01 = FALSE)
#Creates pseudodata with stabilize=T and discrete dose levels
pseudodata(design='CR', dose10 = 500, dose90 = 2000, targetDLT = 0.3,
           stabilize = TRUE, discrete = TRUE,
           discretedoses = c(200, 500, 1000, 1200, 1500, 1800))
#Creates pseudodata when toxicity grades 0 and 1 are one category
pseudodata(design='CR', dose10 = 200, dose90 = 1000, targetDLT = 0.3,
           stabilize = TRUE, discrete = FALSE, discretedoses = NA,
           percentagegradedose10 = c(80, 10, 8, 2),
           percentagegradedose90=c(5, 5, 40, 50), combine01 = TRUE)

######################
###For Binary CRM#####
######################
#Creates pseudodata with no stabilization and continuous dose levels
pseudodata(design='CRM', dose10 = 200, dose90 = 3600, targetDLT = 0.3,
           stabilize = TRUE, discrete = FALSE, discretedoses = NA)
#Creates pseudodata with stabilize=T and discrete dose levels
pseudodata(design='CRM', dose10 = 200, dose90 = 3000, targetDLT = 0.3,
           stabilize = TRUE, discrete = TRUE,
           discretedoses = c(200, 500, 1000, 1200, 1500, 1800))



