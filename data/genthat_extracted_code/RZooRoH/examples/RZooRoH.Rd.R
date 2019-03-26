library(RZooRoH)


### Name: RZooRoH
### Title: RZooRoH: A package for estimating global and local individual
###   autozygosity.
### Aliases: RZooRoH RZooRoH-package

### ** Examples


# Start with a small data set with six individuals and external frequencies.
freqfile <- (system.file("exdata","typsfrq.txt",package="RZooRoH"))
typfile <- (system.file("exdata","typs.txt",package="RZooRoH"))
frq <- read.table(freqfile,header=FALSE)
typdata <- zoodata(typfile,supcol=4,chrcol=1,poscol=2,allelefreq=frq$V1)
# Define a model with two HBD classes with rates equal to 10 and 100.
Mod3R <- zoomodel(K=3,base_rate=10)
# Run the model on all individuals.
typ.res <- zoorun(Mod3R,typdata)
# Observe some results: likelihood, realized autozygosity in different
# HBD classes and identified HBD segments.
typ.res@modlik
typ.res@realized
typ.res@hbdseg
# Define a model with one HBD and one non-HBD class and run it.
Mod1R <- zoomodel(K=2,predefined=FALSE)
typ2.res <- zoorun(Mod1R,typdata)
# Print the estimated rates and mixing coefficients.
typ2.res@krates
typ2.res@mixc

# Get the name and location of a second example file.
myfile <- (system.file("exdata","genoex.txt",package="RZooRoH"))
# Load your data with default format:
example2 <- zoodata(myfile)
# Define the default model:
my.model <- zoomodel()
# Run RZooRoH on your data with the model (parameter estimation with optim). This can
# take a few minutes because it is a large model for 20 individuals:
## No test: 
my.res <- zoorun(my.model,example2)
## End(No test)
# To estimate the parameters with the EM-algorithm, run the Forward-Backward
# algorithm to estimate realized autozygosity and the Viterbi algorithm to
# identify HBD segments (a few mintues too, see above).
## No test: 
my.res2 <- zoorun(my.model, example2, fb=TRUE, vit=TRUE, method = "estem")
## End(No test)
# To run the model on a subset of individuals with 1 thread:
## No test: 
my.res3 <- zoorun(my.model, example2, ids=c(7,12,16,18), nT = 1)
## End(No test)
# Define a smaller model and run it on two individuals.
my.mod2 <- zoomodel(K=4,base_rate=10)
## No test: 
my.res4 <- zoorun(my.mod2, example2, ids=c(9,18))
## End(No test)




