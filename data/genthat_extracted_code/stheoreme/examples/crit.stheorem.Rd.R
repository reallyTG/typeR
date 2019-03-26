library(stheoreme)


### Name: crit.stheorem
### Title: Klimontovich's S-Theorem Convergence Criterion
### Aliases: crit.stheorem

### ** Examples


#completely different bin counts by their (thermodynamic) nature
h0 <- c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1)
h1 <- c(1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0)
crit.stheorem(distribution0=h0, distribution1=h1)

#quazi-gaussian probability vectors with equal means & different variances
f0 <- c(0.0,0.1,0.4,0.4,0.1,0.0)
f1 <- c(0.1,0.15,0.25,0.25,0.15,0.1)
crit.stheorem(f0, f1)

#multimodal bin counts
h0 <- c(1,6,1,6,5,1,2)
h1 <- c(1,6,1,1,9,1,2)
crit.stheorem(h0, h1)

#quazi-gaussian bin counts with a shift between means
h0 <- c(2,2,17,6,1,1,1,0)
h1 <- c(2,3,5,7,7,4,1,0)
crit.stheorem(h0, h1)

#example of 2-step analysis with Klimontovich's S-theorem for 2 
# arrays of outcomes {s0,s1}:
s0<-rep(c(1:11,2),256)
s1<-rep(c(2,3,3,4,5,5,5),55)
# step a. Create probability vectors
b<-d1nat(s0,s1,brks=12); b
# step b. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)




