library(EvoRAG)


### Name: MScorrection
### Title: Correct for finite sample size in Euclidean distances given
###   known variances in each sample
### Aliases: MScorrection

### ** Examples


     data(bird.pitch)
     attach(bird.pitch)
     DIST_cor <- MScorrection(nA=bird.pitch$number_individuals_Species1,
        nB=bird.pitch$number_individuals_Species2, 
        VarA=bird.pitch$Variance_PC1and2_Species1, 
        VarB=bird.pitch$Variance_PC1and2_Species2, MSwithin = NA,		
        DIST_actual=bird.pitch$Uncorrected_Euclidean_Distance)
     



