library(ERP)


### Name: impulsivity
### Title: Event-Related Potentials data from a study conducted by Shen et
###   al. (2014) to investigate neural correlates of impulsive behavior.
### Aliases: impulsivity
### Keywords: datasets

### ** Examples


data(impulsivity)

head(impulsivity[,1:10])  # each row of impulsivity contains an ERP curve (from column 5 to 505)
                  # Column 1: electrode position (channel)
                  # Column 2: subject id
                  # Column 3: impulsivity group (High/Low)
                  # Column 4: response inhibition condition (Success/Failure)  

time_pt = seq(0, 1000, 2)     # sequence of time points (1 time point every 2ms in [0,1000])
erpdta = impulsivity[,5:505]          # erpdta contains the ERP curves
T = length(time_pt)           # number of time points

covariates = impulsivity[,1:4]        # contains the experimental covariates of interest

# Impulsivity ERP design

with(data=covariates,table(Channel,Condition,Group)) 
   # 48 ERP curves for each of the 3 channels
   # Within each channel, 12 ERP curves in each Condition x Group
   # Within each channel, 12 subjects in group High, 12 in group Low




