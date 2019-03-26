library(ArArRedux)


### Name: fitlogratios
### Title: Extrapolation to 'time zero'
### Aliases: fitlogratios fitlogratios.default fitlogratios.timeresolved
###   fitlogratios.PHdata

### ** Examples

samplefile <- system.file("Samples.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
m <- loaddata(samplefile,masses) # samples and J-standards
blanklabel <- "EXB#"
l <- fitlogratios(blankcorr(m,blanklabel),"Ar40")
plotcorr(l)



