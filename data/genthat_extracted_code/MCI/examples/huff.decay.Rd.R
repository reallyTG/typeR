library(MCI)


### Name: huff.decay
### Title: Distance decay function in the Huff model
### Aliases: huff.decay

### ** Examples

# Market area analysis based on the POS survey in shopping1 #

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

ijmatrix_POS_data$freq_ij_abs_cor <- var.correct(ijmatrix_POS_data$freq_ij_abs, 
corr.mode = "inc", incby = 0.1)
# Correcting the absolute values (frequencies) by increasing by 0.1

data(shopping3)
ijmatrix_POS_data_residdata <- merge(ijmatrix_POS_data, shopping3)
# Adding the information about the origins (places of residence) stored in shopping3

ijmatrix_POS_data_residdata$visitper1000 <- (ijmatrix_POS_data_residdata$
freq_ij_abs_cor/ijmatrix_POS_data_residdata$resid_pop2015)*1000
# Calculating the dependent variable
# visitper1000: surveyed customers per 1.000 inhabitants of the origin

ijmatrix_POS_data_residdata <- 
ijmatrix_POS_data_residdata[(!is.na(ijmatrix_POS_data_residdata$
visitper1000)) & (!is.na(ijmatrix_POS_data_residdata$d_time)),]
# Removing NAs (data for some outlier origins and routes not available)

ijmatrix_POS_data_residdata_POS1 <- 
ijmatrix_POS_data_residdata[ijmatrix_POS_data_residdata$POS=="POS1",]
# Dataset for POS1 (town centre)

ijmatrix_POS_data_residdata_POS2 <- 
ijmatrix_POS_data_residdata[ijmatrix_POS_data_residdata$POS=="POS2",]
# Dataset for POS2 (out-of-town shopping centre)

huff.decay(ijmatrix_POS_data_residdata_POS1, "d_km", "visitper1000")
huff.decay(ijmatrix_POS_data_residdata_POS1, "d_time", "visitper1000")
huff.decay(ijmatrix_POS_data_residdata_POS2, "d_km", "visitper1000")
huff.decay(ijmatrix_POS_data_residdata_POS2, "d_time", "visitper1000")



