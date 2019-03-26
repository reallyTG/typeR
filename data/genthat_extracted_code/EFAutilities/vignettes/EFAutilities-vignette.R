## ----echo=FALSE----------------------------------------------------------
options(digits=3)

## ----echo=TRUE-----------------------------------------------------------
library(EFAutilities)
data("CPAI537")


## ----echo=FALSE----------------------------------------------------------
options(digits=3)

## ----echo=TRUE-----------------------------------------------------------
mnames=c("Nov", "Div", "Dit","LEA","L_A", "AES", "E_I", "ENT", "RES", "EMO", "I_S",
         "PRA", "O_P", "MET", "FAC", "I_E", "FAM", "DEF", "G_M", "INT", "S_S", 
         "V_S", "T_M", "REN", "SOC", "DIS", "HAR", "T_E")
fnames=c("Social Potency", "Dependability","Accommodation","Relatedness")
res1 <- efa(x=CPAI537,factors=4, fm='ml', mnames=mnames, fnames=fnames)
res1

## ----echo=FALSE----------------------------------------------------------
options(digits=3)

## ------------------------------------------------------------------------
res1$rotatedlow      # lower bound for 95 percent confidence intervals for factor loadings
res1$rotatedupper    # upper bound for 95 percent confidence intervals for factor loadings
res1$Philow         # lower bound for 95 percent confidence intervals for factor correlations
res1$Phiupper       # upper bound for 95 percent confidence intervals for factor correlations

## ------------------------------------------------------------------------
res1$ModelF

## ------------------------------------------------------------------------
data("BFI228")
reduced2 <- BFI228[,1:17]

## ------------------------------------------------------------------------
mnames=c("talkative", "reserved_R", "fullenergy", "enthusiastic", "quiet_R","assertive", 
         "shy_R", "outgoing", "findfault_R", "helpful", "quarrels_R", "forgiving", 
         "trusting", "cold_R", "considerate", "rude_R", "cooperative")
fnames=c("extraversion","agreeableness")
res2 <-efa(x=reduced2, factors=2, dist="ordinal", rotation="geomin", merror="YES",
           mnames=mnames, fnames=fnames)
res2

## ------------------------------------------------------------------------
cormat <- matrix(c(1, .865, .733, .511, .412, .647, -.462, -.533, -.544,
                  .865, 1, .741, .485, .366, .595, -.406, -.474, -.505,
                  .733, .741, 1, .316, .268, .497, -.303, -.372, -.44,
                  .511, .485, .316, 1, .721, .731, -.521, -.531, -.621,
                  .412, .366, .268, .721, 1, .599, -.455, -.425, -.455,
                  .647, .595, .497, .731, .599, 1, -.417, -.47, -.521,
                 -.462, -.406, -.303, -.521, -.455, -.417, 1, .747, .727,
                 -.533, -.474, -.372, -.531, -.425, -.47, .747, 1, .772,
                 -.544, -.505, -.44, -.621, -.455, -.521, .727, .772, 1),
                 ncol = 9)

p <- 9
m <- 3
m1 <- 2
N <- 138
mvnames <- c("H1_likelihood", "H2_certainty", "H3_amount", "S1_sympathy",
"S2_pity", "S3_concern", "C1_controllable", "C2_responsible", "C3_fault")
fnames <- c("H", "S", "C")

## ------------------------------------------------------------------------
# a 9 x 3 matrix for lambda; p = 9, m = 3
MT <- matrix(0, p, m, dimnames = list(mvnames, fnames))
MT[c(1:3,6),1] <- 9
MT[4:6,2] <- 9
MT[7:9,3] <- 9
MW <- matrix(0, p, m, dimnames = list(mvnames, fnames))
MW[MT == 0] <- 1
# a 2 x 3 matrix for [B|G]; m1 = 2, m = 3
BGT <- matrix(0, m1, m, dimnames = list(fnames[1:m1], fnames))
BGT[1,2] <- 9
BGT[2,3] <- 9
BGT[1,3] <- 9
BGW <- matrix(0, m1, m, dimnames = list(fnames[1:m1], fnames))
BGW[BGT == 0] <- 1
BGW[,1] <- 0
BGW[2,2] <- 0
# a 1 x 1 matrix for Phi.xi; m - m1 = 1 (only one exogenous factor)
PhiT <- matrix(9, m - m1, m - m1)
PhiW <- matrix(0, m - m1, m - m1)


## ------------------------------------------------------------------------
#SSEMres <- ssem(covmat = cormat, factors = m, exfactors = m - m1,
#dist = "normal", n.obs = N, fm = "ml", rotation = "semtarget",
#maxit = 10000, MTarget = MT, MWeight = MW, BGTarget = BGT, BGWeight = BGW,
#PhiTarget = PhiT, PhiWeight = PhiW,  useorder = TRUE, se = "information",
#mnames = mvnames, fnames = fnames)

#SSEMres


## ------------------------------------------------------------------------
efaMRres <-efaMR(CPAI537, factors = 5, fm ='ml', rtype ='oblique', rotation ='geomin',
             geomin.delta = .01, nstart = 100)
#res3$MultipleSolutions for more details
efaMRres$MultipleSolutions$FrequenciesSolutions
efaMRres$MultipleSolutions$Solutions[[1]]
efaMRres$MultipleSolutions$Solutions[[2]]

## ------------------------------------------------------------------------
#Order Matrix
A <- matrix(c(0.8,0.6,0,0,0,0,0.8,0.7),nrow=4,ncol=2)
#Input.Matrix
B <-matrix(c(0,0,-0.8,-0.7,1,-0.2,0.8,0.7,0,0,-0.2,1),nrow=6,ncol=2)
Align.Matrix(Order.Matrix=A, Input.Matrix=B)


