library(eegkitdata)


### Name: geteegdata
### Title: Create data matrix from UCI EEG data
### Aliases: geteegdata

### ** Examples

##########   EXAMPLE 1: UCI TRAIN DATA (not run)   ##########

# Note: you need to change 'indir' and 'outdir' in Steps 2-4

# #(1)# download and untar SMNI_CMI_TRAIN.tar.gz file from UCI:
# #   # http://archive.ics.uci.edu/ml/machine-learning-databases/eeg-mld/

##### for Unix/Mac  #####

# #(2)# extract condition "S1" and save as .rda
# eegS1=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                  cond="S1",filename="eegtrainS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                   cond="S2m",filename="eegtrainS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                   cond="S2n",filename="eegtrainS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)

##### for Windows  #####

# #(2)# extract condition "S1" and save as .rda
# eegS1=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                  cond="S1",filename="eegtrainS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                   cond="S2m",filename="eegtrainS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TRAIN/",
#                   cond="S2n",filename="eegtrainS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)


##########   EXAMPLE 2: UCI TEST DATA (not run)   ##########

# # Note: you need to change 'indir' and 'outdir' in Steps 2 and 3

# #(1)# download and untar SMNI_CMI_TEST.tar.gz file from UCI:
# #   # http://archive.ics.uci.edu/ml/machine-learning-databases/eeg-mld/

##### for Unix/Mac  #####

# #(2)# extract condition "S1" and save as .rda
# eegS1=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                  cond="S1",filename="eegtestS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                   cond="S2m",filename="eegtestS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                   cond="S2n",filename="eegtestS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)

##### for Windows  #####

# #(2)# extract condition "S1" and save as .rda
# eegS1=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                  cond="S1",filename="eegtestS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                   cond="S2m",filename="eegtestS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="C:/Users/Nate/Downloads/SMNI_CMI_TEST/",
#                   cond="S2n",filename="eegtestS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)


##########   EXAMPLE 3: UCI FULL DATA (not run)   ##########

# #(1)# download and untar eeg_full.tar file from UCI:
# #   # http://archive.ics.uci.edu/ml/machine-learning-databases/eeg-mld/

##### for Unix/Mac  #####

# #(2)# extract condition "S1" and save as .rda
# eegS1=geteegdata(indir="/Users/Nate/Downloads/eeg_full/",
#                  cond="S1",filename="eegfullS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="/Users/Nate/Downloads/eeg_full/",
#                   cond="S2m",filename="eegfullS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="/Users/Nate/Downloads/eeg_full/",
#                   cond="S2n",filename="eegfullS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)

##### for Windows  #####

# #(2)# extract all conditions and save as .rda (default use)
# eegS1=geteegdata(indir="C:/Users/Nate/Downloads/eeg_full/",
#                  cond="S1",filename="eegfullS1")
                   
# #(3)# extract condition "S2m" and save as .rda
# eegS2m=geteegdata(indir="C:/Users/Nate/Downloads/eeg_full/",
#                   cond="S2m",filename="eegfullS2m")
                   
# #(4)# extract condition "S2n" and save as .rda
# eegS2n=geteegdata(indir="C:/Users/Nate/Downloads/eeg_full/",
#                   cond="S2n",filename="eegfullS2n")

# #(5)# combine conditions
# eegdata=rbind(eegS1,eegS2m,eegS2n)



