### R code from vignette source 'Change_Analysis.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
# Load the spsurvey package
library(spsurvey)



###################################################
### code chunk number 2: data
###################################################
# Load the data set and determine the number of rows in the data frame
data(NRSA_2009)
nr <- nrow(NRSA_2009)



###################################################
### code chunk number 3: data
###################################################
# Display the initial six lines in the data file
head(NRSA_2009)



###################################################
### code chunk number 4: data
###################################################
# Display the final six lines in the data file
tail(NRSA_2009)



###################################################
### code chunk number 5: Change
###################################################
#
# Conduct a change analysis
#

# Create the sites data frame, which identifies sites to use in the analysis
sites <- data.frame(siteID=NRSA_2009$siteID,
                    Survey1=NRSA_2009$Survey == "WSA",
                    Survey2=NRSA_2009$Survey == "NRSA")



###################################################
### code chunk number 6: Change
###################################################
# Create the repeats data frame, which identifies repeat visit sites to use in
# the analysis
repeats <- data.frame(siteID_1=NRSA_2009$siteID[NRSA_2009$Survey == "WSA" &
                         NRSA_2009$Revisit_Site == "Y"],
                      siteID_2=NRSA_2009$siteID[NRSA_2009$Survey == "NRSA" &
                         NRSA_2009$Revisit_Site == "Y"])



###################################################
### code chunk number 7: Change
###################################################
# Create the subpop data frame, which defines populations and subpopulations for
# which estimates are desired
subpop <- data.frame(siteID=NRSA_2009$siteID,
                     Western_Mountains=rep("Western Mountains", nr),
                     Stream_Size=NRSA_2009$Stream_Size)



###################################################
### code chunk number 8: Change
###################################################
# Create the design data frame, which identifies the stratum code, weight,
#    x-coordinate, and y-coordinate for each site ID
design <- data.frame(siteID=NRSA_2009$siteID,
                     wgt=NRSA_2009$wgt,
                     xcoord=NRSA_2009$xcoord,
                     ycoord=NRSA_2009$ycoord)



###################################################
### code chunk number 9: Change
###################################################
# Create the data.cat data frame, which specifies the categorical variables to
# use in the analysis
data.cat <- data.frame(siteID=NRSA_2009$siteID,
                       Nitrogen_Condition=NRSA_2009$NTL_Cond,
                       Phosphorus_Condition=NRSA_2009$PTL_Cond,
                       Benthic_MMI_Condition=NRSA_2009$Benthic_MMI_Cond)



###################################################
### code chunk number 10: Change
###################################################
# Create the data.cont data frame, which specifies the continuous variables to
# use in the analysis
data.cont <- data.frame(siteID=NRSA_2009$siteID,
                        Log_Total_Phosphorus=log10(NRSA_2009$PTL+1),
                        Log_Total_Nitrogen=log10(NRSA_2009$NTL+1),
                        Benthic_MMI=NRSA_2009$Benthic_MMI)



###################################################
### code chunk number 11: Change
###################################################
# Calculate change estimates
Change_Estimates <- change.analysis(sites, repeats, subpop, design, data.cat,
   data.cont, test=c("mean", "median"))



###################################################
### code chunk number 12: Change
###################################################
# Display warning messages 1 and 3
warnprnt(m = c(1, 3))



###################################################
### code chunk number 13: Change
###################################################
# Print Western Mountains change estimates for categorical variables
print(subset(Change_Estimates$catsum, Type == "Western_Mountains"))

# Print change estimates for continuous variables using the mean
print(Change_Estimates$contsum_mean)

# Print change estimates for continuous variables using the median
print(subset(Change_Estimates$contsum_median, Type == "Western_Mountains"))



###################################################
### code chunk number 14: Change
###################################################
# Write results as comma-separated value (csv) files
write.csv(Change_Estimates$catsum, file="Change_Estimates_Categorical.csv", row.names=FALSE)
write.csv(Change_Estimates$contsum_mean, file="Change_Estimates_Continuous_Mean.csv", row.names=FALSE)
write.csv(Change_Estimates$contsum_median, file="Change_Estimates_Continuous_Median.csv", row.names=FALSE)



