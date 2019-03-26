library(ArArRedux)


### Name: concat
### Title: Merge a list of logratio data
### Aliases: concat

### ** Examples

samplefile <-  system.file("Samples.csv",package="ArArRedux")
kfile <- system.file("K-glass.csv",package="ArArRedux")
cafile <- system.file("Ca-salt.csv",package="ArArRedux")
dfile <- system.file("Calibration.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
blanklabel <- "EXB#"
Jpos <- c(3,15)
dlabels <- c("H1","AX","L1","L2")
 
m <- loaddata(samplefile,masses) # samples and J-standards
mk <- loaddata(kfile,masses) # K-interference data
mca <- loaddata(cafile,masses) # Ca interference data
md <- loaddata(dfile,dlabels,PH=TRUE) # detector intercalibrations
 
# form and fit logratios
l <- fitlogratios(blankcorr(m,blanklabel),"Ar40")
lk <- fitlogratios(blankcorr(mk,blanklabel,"K:"),"Ar40")
k <- getmasses(lk,"Ar39","Ar40") # subset on the relevant isotopes
lca <- fitlogratios(blankcorr(mca,blanklabel,"Ca:"),"Ar37")
ca <- getmasses(lca,c("Ar36","Ar39"),c("Ar37","Ar37")) # subset
ld <- fitlogratios(blankcorr(md))
d <- averagebyday(ld,"DCAL")

# merge all data (except air shots) into one big logratio structure
X <- newredux(concat(list(l,k,ca,d)),Jpos)
data(Melbourne)
if (isTRUE(all.equal(Melbourne$X,X))) {
   print("We just reconstructed the built-in dataset Melbourne$X")}



