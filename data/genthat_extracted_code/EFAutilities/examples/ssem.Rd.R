library(EFAutilities)


### Name: ssem
### Title: Saturated Stuctural Equation Models
### Aliases: ssem
### Keywords: saturated stuctural equation model

### ** Examples
 
#cormat <- matrix(c(1, .865, .733, .511, .412, .647, -.462, -.533, -.544,
#                   .865, 1, .741, .485, .366, .595, -.406, -.474, -.505,                 
#                   .733, .741, 1, .316, .268, .497, -.303, -.372, -.44,                  
#                   .511, .485, .316, 1, .721, .731, -.521, -.531, -.621,                   
#                   .412, .366, .268, .721, 1, .599, -.455, -.425, -.455,                  
#                   .647, .595, .497, .731, .599, 1, -.417, -.47, -.521,                  
#                  -.462, -.406, -.303, -.521, -.455, -.417, 1, .747, .727,                  
#                   -.533, -.474, -.372, -.531, -.425, -.47, .747, 1, .772,
#                   -.544, -.505, -.44, -.621, -.455, -.521, .727, .772, 1),
#                 ncol = 9)


#p <- 9      # a number of manifest variables

#m <- 3      # a total number of factors

#m1 <- 2     # a number of endogenous variables
#N <- 138    # a sample size

#mvnames <- c("H1_likelihood", "H2_certainty", "H3_amount", "S1_sympathy",
#             "S2_pity", "S3_concern", "C1_controllable", "C2_responsible", "C3_fault")

#fnames <- c('H', 'S', 'C')
# Step 2: Preparing target and weight matrices =========================
# a 9 x 3 matrix for lambda; p = 9, m = 3

#MT <- matrix(0, p, m, dimnames = list(mvnames, fnames))

#MT[c(1:3,6),1] <- 9

#MT[4:6,2] <- 9

#MT[7:9,3] <- 9

#MW <- matrix(0, p, m, dimnames = list(mvnames, fnames))

#MW[MT == 0] <- 1

# a 2 x 3 matrix for [B|G]; m1 = 2, m = 3

# m1 = 2
#BGT <- matrix(0, m1, m, dimnames = list(fnames[1:m1], fnames))

#BGT[1,2] <- 9

#BGT[2,3] <- 9

#BGT[1,3] <- 9

#BGW <- matrix(0, m1, m, dimnames = list(fnames[1:m1], fnames))

#BGW[BGT == 0] <- 1

#BGW[,1] <- 0

#BGW[2,2] <- 0 
# a 1 x 1 matrix for Phi.xi; m - m1 = 1 (only one exogenous factor)

#PhiT <- matrix(9, m - m1, m - m1)

#PhiW <- matrix(0, m - m1, m - m1)
#SSEMres <- ssem(covmat = cormat, factors = m, exfactors = m - m1,
#                dist = 'normal', n.obs = N, fm = 'ml', rotation = 'semtarget',
#                maxit = 10000, 
#                MTarget = MT, MWeight = MW, BGTarget = BGT, BGWeight = BGW, 
#                PhiTarget = PhiT, PhiWeight = PhiW,  useorder = TRUE, se = 'information',
#                mnames = mvnames, fnames = fnames)
#


