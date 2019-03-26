library(RZooRoH)


### Name: zoorun
### Title: Run the ZooRoH model
### Aliases: zoorun

### ** Examples


# Start with a small data set with six individuals and external frequencies.
freqfile <- (system.file("exdata","typsfrq.txt",package="RZooRoH"))
typfile <- (system.file("exdata","typs.txt",package="RZooRoH"))
frq <- read.table(freqfile,header=FALSE)
typ <- zoodata(typfile,supcol=4,chrcol=1,poscol=2,allelefreq=frq$V1)
# Define a model with two HBD classes with rates equal to 10 and 100.
Mod3R <- zoomodel(K=3,base_rate=10)
# Run the model on all individuals.
typ.res <- zoorun(Mod3R, typ)
# Observe some results: likelihood, realized autozygosity in different
# HBD classes and identified HBD segments.
typ.res@modlik
typ.res@realized
typ.res@hbdseg
# Define a model with one HBD and one non-HBD class and run it.
Mod1R <- zoomodel(K=2,predefined=FALSE)
typ2.res <- zoorun(Mod1R, typ)
# Print the estimated rates and mixing coefficients.
typ2.res@krates
typ2.res@mixc
# Get the name and location of a second example file and load the data:
myfile <- (system.file("exdata","genoex.txt",package="RZooRoH"))
ex2 <- zoodata(myfile)
# Run RZooRoH to estimate parameters on your data with the 1 HBD and 1 non-HBD
# class (parameter estimation with optim).
my.mod1R <- zoomodel(predefined=FALSE,K=2,krates=c(10,10))
## No test: 
my.res <- zoorun(my.mod1R, ex2, fb = FALSE, vit = FALSE)
## End(No test)
# The estimated rates and mixing coefficients:
## No test: 
my.res@mixc
## End(No test)
## No test: 
my.res@krates
## End(No test)
# Run the same model and run the Forward-Backward alogrithm to estimate
# realized autozygosity and the Viterbi algorithm to identify HBD segments:
## No test: 
my.res2 <- zoorun(my.mod1R, ex2)
## End(No test)
# The table with estimated realized autozygosity:
## No test: 
my.res2@realized
## End(No test)
# Run a model with 4 classes (3 HBD classes) and estimate the rates of HBD
# classes with one thread:
my.mod4R <- zoomodel(predefined=FALSE,K=4,krates=c(16,64,256,256))
## No test: 
my.res3 <- zoorun(my.mod4R, ex2, fb = FALSE, vit = FALSE, nT =1)
## End(No test)
# The estimated rates for the 4 classes and the 20 individuals:
## No test: 
my.res3@krates
## End(No test)
# Run a model with 5 classes (4 HBD classes) and predefined rates.
# The model is run only for a subset of four selected individuals.
# The parameters are estimated with the EM-algorithm, the Forward-Backward
# alogrithm is ued to estimate realized autozygosity and the Viterbi algorithm to
# identify HBD segments. One thread is used.
mix5R <- zoomodel(K=5,base=10)
## No test: 
my.res4 <- zoorun(mix5R,ex2,ids=c(7,12,16,18), method = "estem", nT = 1)
## End(No test)
# The table with all identified HBD segments:
## No test: 
my.res4@hbdseg
## End(No test)




