library(MCI)


### Name: shopping2
### Title: Distance matrix for the point-of-sale survey in Karlsruhe
### Aliases: shopping2

### ** Examples

# Market area segmentation based on the POS survey in shopping1 #

data(shopping1)
# The survey dataset
data(shopping2)
# Dataset with distances and travel times

shopping1_adj <- shopping1[(shopping1$weekday != 3) & (shopping1$holiday != 1) 
& (shopping1$survey != "pretest"),]
# Removing every case from tuesday, holidays and the ones belonging to the pretest

ijmatrix_POS <- ijmatrix.create(shopping1_adj, "resid_code", "POS", "POS_expen")
# Creates an interaction matrix based on the observed frequencies (automatically)
# and the POS expenditures (Variable "POS_expen" separately stated)

ijmatrix_POS_data <- merge(ijmatrix_POS, shopping2, by.x="interaction", by.y="route", 
all.x = TRUE)
# Adding the distances and travel times

ijmatrix_POS_data_segm_visit <- shares.segm(ijmatrix_POS_data, "resid_code", "POS",
"d_time", "freq_ij_abs", 0,10,20,30)
# Segmentation by travel time using the number of customers/visitors
# Parameters: interaction matrix (data frame), columns with origins and destinations,
# variable to divide in classes, absolute frequencies/expenditures, class segments

ijmatrix_POS_data_segm_exp <- shares.segm(ijmatrix_POS_data, "resid_code", "POS",
"d_time", "freq_ij_abs_POS_expen", 0,10,20,30)
# Segmentation by travel time using the POS expenditures



