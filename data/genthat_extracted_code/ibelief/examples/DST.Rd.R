library(ibelief)


### Name: DST
### Title: Combination rules
### Aliases: DST

### ** Examples

m1=c(0,0.4, 0.1, 0.2, 0.2, 0, 0, 0.1);
m2=c(0,0.2, 0.3, 0.1, 0.1, 0, 0.2, 0.1);
m3=c(0.1,0.2, 0, 0.1, 0.1, 0.1, 0, 0.3);

m3d=discounting(m3,0.95);

M_comb_Smets=DST(cbind(m1,m2,m3d),1);
M_comb_Smets
M_comb_PCR6=DST(cbind(m1,m2),8);
M_comb_PCR6
M_comb_LNS = DST(cbind(m1,m2),13);
M_comb_LNS
M_comb_LNSa = DST(cbind(m1,m2),131);
M_comb_LNSa

n1 = 5
ThetaSize = 3
mass_mat = matrix(0, 2^ThetaSize, n1 + 1);
mass_mat[2, 1 : n1] = c(0.12, 0.16, 0.15, 0.11, 0.14)
mass_mat[3, n1 + 1] = 0.95;
mass_mat[8, ] = 1 - colSums(mass_mat)
mass_ssf_mat = mass_mat[c(2^(1:ThetaSize-1)+1, 8), ]
# the following three functions could produce the same results
DST(mass_mat, 13)
DST(mass_mat, 13, TypeSSF = 2)
DST(mass_ssf_mat, 13, TypeSSF = 1)



