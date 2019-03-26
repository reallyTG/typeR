library(MetaCycle)


### Name: meta3d
### Title: Detect rhythmic signals from time-series datasets with
###   individual information
### Aliases: meta3d

### ** Examples

# write 'cycHumanBloodData' and 'cycHumanBloodDesign' into two 'csv' files
write.csv(cycHumanBloodData, file="cycHumanBloodData.csv",
  row.names=FALSE)
write.csv(cycHumanBloodDesign, file="cycHumanBloodDesign.csv",
  row.names=FALSE)

# detect circadian transcripts with JTK in studied individuals
meta3d(datafile="cycHumanBloodData.csv", cycMethodOne="JTK",
  designfile="cycHumanBloodDesign.csv", outdir="example",
  filestyle="csv", design_libColm=1, design_subjectColm=2,
  design_hrColm=4, design_groupColm=3)



