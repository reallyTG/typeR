library(lvm4net)


### Name: boxroc
### Title: Boxplot and ROC Curves
### Aliases: boxroc

### ** Examples


N <- 20
Y <- network(N, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
bp <- boxroc(Y, 
EZ = modLSM$lsmEZ,
xiT = modLSM$xiT, 
Lroc = 150, 
ROC = TRUE, 
BOXPLOT = TRUE)

print(bp)



