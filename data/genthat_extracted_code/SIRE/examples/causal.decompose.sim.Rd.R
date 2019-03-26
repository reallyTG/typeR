library(SIRE)


### Name: causal.decompose.sim
### Title: Decomposition of simultaneous equation model
### Aliases: causal.decompose.sim

### ** Examples

eq.system = list(
            eq1 = y1 ~ y5 + y7,
            eq2 = y2 ~ z,
            eq3 = y3 ~ y11,
            eq4 = y4 ~ y3,
            eq5 = y5 ~ y10,
            eq6 = y6 ~ y5 + y9,
            eq7 = y7 ~ y6,
            eq8 = y8 ~ y12,
            eq9 = y9 ~ y7,
            eq10 = y10 ~ y5,
            eq11 = y11 ~ y12,
            eq12 = y12 ~ y4 + y11,
            eq13 = y13 ~ y2 + y6)

 # indexes of non-null elements of Sigma
 sigma.idx = cbind(c(2,1),
                   c(1,5),
                   c(13,2),
                   c(2,13),
                   c(5,1),
                   c(1,2))

 #fictitious Sigma matrix
 Sigma = as.matrix(
         Matrix::sparseMatrix(i = sigma.idx[1,] , j = sigma.idx[2,], x = 0.1)) +
         diag(length(eq.system))

 causal.decompose.sim(eq.system , Sigma)



