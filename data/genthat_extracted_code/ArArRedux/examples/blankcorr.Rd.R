library(ArArRedux)


### Name: blankcorr
### Title: Apply a blank correction
### Aliases: blankcorr blankcorr.default blankcorr.timeresolved
###   blankcorr.PHdata

### ** Examples

samplefile <- system.file("Samples.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
m <- loaddata(samplefile,masses) # samples and J-standards
blanklabel <- "EXB#"
l <- fitlogratios(blankcorr(m,blanklabel),"Ar40")
plotcorr(l)



