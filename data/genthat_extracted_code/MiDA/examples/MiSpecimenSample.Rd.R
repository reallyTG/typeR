library(MiDA)


### Name: MiSpecimenSample
### Title: Select values from factor vector
### Aliases: MiSpecimenSample

### ** Examples

#get gene expression and specimen data
data("IMexpression");data("IMspecimen")
dim(IMexpression) # 100 columns (genes/transcripts) - 89 specimens
colnames(IMexpression)[1:10] # look at first 10 columns of matrix - specimens IDs
IMspecimen[1:10,] # specimens IDs and group factor - diagnoses in attendant vector
# note that specimens in matrix columns are in the same order as specimens in description data
# select specimens with only EBV and NORM diagnoses (and sample the description data as well)
SampleMatrix<-MiDataSample(IMexpression, IMspecimen$diagnosis, "ebv", "norm")
SampleSamples<-MiSpecimenSample(IMspecimen$diagnosis, "ebv", "norm")
dim(SampleMatrix)# only 68 specimens with EBV and NORM diagnoses left
colnames(SampleMatrix)[1:10]
SampleSamples[1:10] # corresponding diagnoses




