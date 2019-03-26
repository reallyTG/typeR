library(protViz)


### Name: aa2mass
### Title: determine the weight if a fiven amino acid sequence
### Aliases: aa2mass

### ** Examples


    peptides<-c('HTLNQIDSVK', 'ALGGEDVR', 'TPIVGQPSIPGGPVR')

    C_term <- 17.002740
    N_term <- 1.007825
    H_ <- 1.008

    unlist(lapply(aa2mass(peptides), sum)) + C_term + N_term + H_ - parentIonMass(peptides)

    # determine the fragment ions
    lapply(aa2mass(peptides), function(x){fragmentIon(x)[[1]]})

    # an example with [STY] AA modification

    peptide<-'HTLNQIDSVK'
    mod <- rep(0.0, nchar(peptide)); mod[8] <- 79.998;
    
    aa2mass(peptide)[[1]] + mod




