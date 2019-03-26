library(cmm)


### Name: NKPS
### Title: Attitudes on sex roles and marriage, measurements clustered in
###   families
### Aliases: NKPS NKPS2 nkps1
### Keywords: datasets

### ** Examples


data(NKPS)
attach(NKPS)

#######################################################################################
# Chapter 2

# Table 2.8
Table.2.8 <- array(NA,c(4,4,4)); k <- 0
for (i in levels(P)) for (j in levels(C)){
  k <- k+1
  Table.2.8[,,k] <- addmargins(t(table(NKPS[,c(3,4)] [C==j & P==i,])))
}
dimnames(Table.2.8) <- list(c(levels(PS),"Total"),c(levels(CS),"Total"),
                       c("Father-Son","Father-Daughter","Mother-Son","Mother-Daughter"))
Table.2.8

# Table 2.9
Table.2.9 <- cbind(table(PS),table(CS),table(c(CS[C=="Son"],PS[P=="Father"])),
                   table(c(CS[C=="Daughter"],PS[P=="Mother"])))
dimnames(Table.2.9)[[2]] <- c("Parent","Child","Men","Women")
addmargins(Table.2.9)[,-5]

# Table 2.10

# Table 2.11


########################################################
# Data
recAB = NKPS[,c(3,4)]
recPCAB = NKPS[,c(1,2,3,4)]
recA1A2B1B2 = NKPS[,c(3,4,5,6)]

# list of frequencies in table AB
nAB = c(t(ftable(recAB)))


########################################################
# table AB and GT
# at produces marginal distributions of A and B, or the 2x3 table GT; 
# G = generation and T = attititude
at <- MarginalMatrix(c("A", "B"), list(c("A"), c("B")), c(3, 3));
bt <- ConstraintMatrix(c("G", "T"), list(c("G"), c("T")), c(2, 3));

model1 <- list(bt, "log", at);

nkps1 <- MarginalModelFit(dat = recAB, model = model1, ShowParameters = TRUE, 
 Labels = list(list("G", c("men", "women")), "T"), 
 CoefficientDimensions = c(2, 3), ShowProgress = 10)




