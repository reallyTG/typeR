## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- echo = FALSE, warning=FALSE, message = FALSE-----------------------
library(ggplot2)

## ---- eval = FALSE-------------------------------------------------------
#  # one block X
#  # Design matrix C
#  # Shrinkage parameters tau = c(tau1, tau2)
#  
#  pca.with.rgcca = rgcca(A = list(X, X),
#                         C = matrix(c(0, 1, 1, 0), 2, 2),
#                         tau = c(1, 1))

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1 and X2 = Block2
#  # Design matrix C
#  # Shrinkage parameters tau = c(tau1, tau2)
#  
#  cca.with.rgcca = rgcca(A= list(X1, X2),
#                         C = matrix(c(0, 1, 1, 0), 2, 2),
#                         tau = c(0, 0))

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1 and X2 = Block2
#  # Design matrix C
#  # Shrinkage parameters tau = c(tau1, tau2)
#  
#  pls.with.rgcca = rgcca(A= list(X1, X2),
#                         C = matrix(c(0, 1, 1, 0), 2, 2),
#                         tau = c(1, 1))

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1 and X2 = Block2
#  # Design matrix C
#  # Shrinkage parameters tau = c(tau1, tau2)
#  
#  ra.with.rgcca = rgcca(A= list(X1, X2),
#                         C = matrix(c(0, 1, 1, 0), 2, 2),
#                         tau = c(1, 0))

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1 and X2 = Block2
#  # Design matrix C
#  # Shrinkage parameters tau = c(tau1, tau2)
#  
#  rcca.with.rgcca = rgcca(A= list(X1, X2),
#                         C = matrix(c(0, 1, 1, 0), 2, 2),
#                         tau = c(0<tau1<1, 0<tau2<1))

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  
#  sumcov.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = matrix(1, J, J),
#                         tau = rep(1, J),
#                         scheme = "horst")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  
#  ssqcov.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = matrix(1, J, J),
#                         tau = rep(1, J),
#                         scheme = "factorial")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  
#  sabscov.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = matrix(1, J, J),
#                         tau = rep(1, J),
#                         scheme = "centroid")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  
#  sumcor.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = matrix(1, J, J),
#                         tau = rep(0, J),
#                         scheme = "horst")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau1, ...,  tauJ
#  
#  ssqcor.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = matrix(1, J, J),
#                         tau = rep(0, J),
#                         scheme = "factorial")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  
#  sabscor.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                        C = matrix(1, J, J),
#                         tau = rep(0, J),
#                         scheme = "centroid")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  C = matrix(1, J, J) ; diag(C) = 0
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  maxbet.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = C,
#                         tau = rep(1, J),
#                         scheme = "horst")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ
#  # J*J Design matrix C
#  C = matrix(1, J, J) ; diag(C) = 0
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ)
#  maxbetb.with.rgcca = rgcca(A= list(X1, ..., XJ),
#                         C = C,
#                         tau = rep(1, J),
#                         scheme = "factorial")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ, X_{J+1} = [X1, ..., XJ]
#  # (J+1)*(J+1) Design matrix C
#  C = matrix(c(0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#                    ...
#               1, 1, 1, ..., 1, 0), J+1, J+1)
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ, tau_{J+1})
#  gcca.with.rgcca = rgcca(A= list(X1, ..., XJ, cbind(X1, ..., XJ)),
#                         C = C,
#                         tau = rep(0, J+1),
#                         scheme = "factorial")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ, X_{J+1} = [X1, ..., XJ]
#  # (J+1)*(J+1) Design matrix C
#  C = matrix(c(0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#                     ...
#               1, 1, 1, ..., 1, 0), J+1, J+1)
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ, tau_{J+1})
#  mcoa.with.rgcca = rgcca(A= list(X1, ..., XJ, cbind(X1, ..., XJ)),
#                         C = C,
#                         tau = c(rep(1, J), 0),
#                         scheme = "factorial")

## ---- eval = FALSE-------------------------------------------------------
#  # X1 = Block1, ..., XJ = BlockJ, X_{J+1} = [X1, ..., XJ]
#  # (J+1)*(J+1) Design matrix C
#  C = matrix(c(0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#                    ...
#               1, 1, 1, ..., 1, 0), J+1, J+1)
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ, tau_{J+1})
#  hpca.with.rgcca = rgcca(A= list(X1, ..., XJ, cbind(X1, ..., XJ)),
#                         C = C,
#                         tau = c(rep(1, J), 0),
#                         #flexible design of the scheme function
#                         scheme = function(x) x^4)

## ---- eval = FALSE-------------------------------------------------------
#  # one block X = [x1, ..., xJ] with J variables x1, ..., xJ
#  # (J+1)*(J+1) Design matrix C
#  C = matrix(c(0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#               0, 0, 0, ..., 0, 1,
#                    ...
#               1, 1, 1, ..., 1, 0), J+1, J+1)
#  # Shrinkage parameters tau = c(tau1, ...,  tauJ, tau_{J+1})
#  pca.with.rgcca = rgcca(list(x1, ..., xJ, X),
#                         C = C,
#                         tau = c(rep(0, J+1), 0),
#                         #flexible design of the scheme function
#                         scheme = function(x) x^2)

## ------------------------------------------------------------------------
library(RGCCA)
data(Russett)
head(Russett)

## ------------------------------------------------------------------------
X_agric = as.matrix(Russett[,c("gini","farm","rent")])
X_ind = as.matrix(Russett[,c("gnpr","labo")])
X_polit = as.matrix(Russett[ , c("inst", "ecks",  "death",
                                 "demostab", "dictator")])
A = list(X_agric, X_ind, X_polit)
sapply(A, head)

## ------------------------------------------------------------------------
A = lapply(A, function(x) scale2(x, bias = TRUE))

## ------------------------------------------------------------------------
#Define the design matrix C.
C = matrix(c(0, 0, 1,
0, 0, 1,
1, 1, 0), 3, 3)

C

## ------------------------------------------------------------------------
rgcca_B_factorial = rgcca(A, C, tau = rep(0, 3), scheme = "factorial",
scale = FALSE, verbose = TRUE)

## ------------------------------------------------------------------------
rgcca_B_factorial$a # weight vectors

## ------------------------------------------------------------------------
Y = rgcca_B_factorial$Y
lapply(Y, head)

## ------------------------------------------------------------------------
rgcca_B_factorial$AVE

## ------------------------------------------------------------------------
rgcca_optimal_factorial = rgcca(A, C, tau = "optimal", scheme = "factorial",
scale = FALSE, verbose = FALSE)

## ------------------------------------------------------------------------
rgcca_optimal_factorial$tau

## ---- eval=TRUE, fig.align='center', fig.cap = 'graphical display of the countries obtained by crossing y1 and y2 and labeled according to their political regime'----
df = data.frame(political_regime =
factor(apply(Russett[, 9:11], 1, which.max),
labels = c("demostab", "demoinst", "dictator")),
comp1 = rgcca_B_factorial$Y[[1]][, 1],
comp2 = rgcca_B_factorial$Y[[2]][, 1])

p <- ggplot(df, aes(comp1, comp2)) +
geom_vline(xintercept = 0) +
geom_hline(yintercept = 0) +
ggtitle("Factor plot (Russett data)") +
geom_text(aes(colour = political_regime, label= rownames(df)),
vjust=0,nudge_y = 0.03,size = 3 )+
theme(legend.position="bottom", legend.box = "horizontal",
legend.title = element_blank())

p

## ------------------------------------------------------------------------

X_agric =as.matrix(Russett[,c("gini","farm","rent")])
X_ind = as.matrix(Russett[,c("gnpr","labo")])
X_polit = as.matrix(Russett[ , c("inst", "ecks",  "death",
"demostab", "demoinst", "dictator")])
A = list(X_agric = X_agric, X_ind = X_ind, X_polit = X_polit,
Superblock = cbind(X_agric, X_ind, X_polit)
)
#Define the design matrix (output = C)
C = matrix(c(0, 0, 0, 1,
0, 0, 0, 1,
0, 0, 0, 1,
1, 1, 1, 0), 4, 4)

rgcca.hpca = rgcca(A, C, tau = c(1, 1, 1, 0), verbose = FALSE,
ncomp = rep(2, 4),
#flexible design of the scheme function
scheme = function(x) x^4,
scale = TRUE)

## ---- fig.align='center', fig.cap = 'graphical display of the countries obtained by crossing the two first compoent of the superblock and labeled according to their political regime'----

df1 = data.frame(political_regime =
factor(apply(Russett[, 9:11], 1, which.max),
labels = c("demostab", "demoinst", "dictator")),
rgcca.hpca$Y[[4]]
)

p1 <- ggplot(df1, aes(comp1, comp2)) +
geom_vline(xintercept = 0) +
geom_hline(yintercept = 0) +
ggtitle("Factor plot (Russett data) - Common Space") +
geom_text(aes(colour = political_regime, label= rownames(df1)),
vjust=0,nudge_y = 0.03,size = 3)+
theme(legend.position="bottom", legend.box = "horizontal",
legend.title = element_blank())

p1

## ---- eval=TRUE, fig.align='center', fig.pos="!!h", TRUE, fig.cap = 'correlation circle plot - two first components of the superblock. Variables are colored according to their block membership'----
df2 = data.frame(comp1 = cor(Russett, rgcca.hpca$Y[[4]])[, 1],
comp2 = cor(Russett, rgcca.hpca$Y[[4]])[, 2],
BLOCK = rep(c("X1", "X2", "X3"), sapply(A[1:3], NCOL)))

# Circle
circleFun <- function(center = c(-1,1),diameter = 1, npoints = 100){
r = diameter / 2
tt <- seq(0,2*pi,length.out = npoints)
xx <- center[1] + r * cos(tt)
yy <- center[2] + r * sin(tt)
return(data.frame(x = xx, y = yy))
}

circle <- circleFun(c(0,0),2,npoints = 100)

p2 <-ggplot(df2, aes(comp1, comp2), colour = BLOCK) +
geom_path(aes(x,y), data=circle) +
geom_vline(xintercept = 0) +
geom_hline(yintercept = 0) +
ggtitle("Correlation Circle (Russett data) - Common Space") +
geom_text(aes(colour = BLOCK, label= rownames(df2)),
vjust=0,nudge_y = 0.03,size = 3)+
theme(legend.position="bottom", legend.box = "horizontal",
legend.title = element_blank())

p2

## ---- eval = FALSE-------------------------------------------------------
#  # Download the dataset's package at http://biodev.cea.fr/sgcca/.
#  # --> gliomaData_0.4.tar.gz
#  
#  require(gliomaData)
#  data(ge_cgh_locIGR)
#  
#  A <- ge_cgh_locIGR$multiblocks
#  Loc <- factor(ge_cgh_locIGR$y)
#  levels(Loc) <- colnames(ge_cgh_locIGR$multiblocks$y)
#  A[[3]] = A[[3]][, -3]
#  
#  # check dimensions of the blocks
#  sapply(A, dim)

## ------------------------------------------------------------------------
C <-  matrix(c(0, 0, 1, 0, 0, 1, 1, 1, 0), 3, 3)
C

## ---- eval = FALSE-------------------------------------------------------
#  rgcca.glioma = rgcca(A, C, tau = c(1, 1, 0), ncomp = c(1, 1, 1),
#                       scale = TRUE, scheme = "horst", verbose = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  rgcca.glioma$primal_dual

## ---- eval = FALSE-------------------------------------------------------
#  system.time(rgcca(A, C, tau = c(1, 1, 0), ncomp = c(1, 1, 1),
#                    scheme = "horst", verbose = FALSE)
#  )

## ---- eval=FALSE, fig.align='center'-------------------------------------
#  df1 = data.frame(Loc = Loc,
#                   GE1 = rgcca.glioma$Y[[1]][, 1],
#                   CGH1 = rgcca.glioma$Y[[2]][, 1])
#  
#  p1 <- ggplot(df1, aes(GE1, CGH1)) +
#    geom_vline(xintercept = 0) +
#    geom_hline(yintercept = 0) +
#    ggtitle("Factor plot (Glioma data) - GE block") +
#    geom_text(aes(colour = Loc, label= rownames(df1)),
#              vjust=0,nudge_y = 0.03,size = 3 )+
#    theme(legend.position="bottom", legend.box = "horizontal",
#          legend.title = element_blank())
#  
#  p1

## ---- eval = FALSE-------------------------------------------------------
#  # sgcca algorithm
#  sgcca.glioma = sgcca(A, C, c1 = c(.071,.2, 1),
#                       ncomp = c(1, 1, 1),
#                       scheme = "centroid",
#                       scale = TRUE,
#                       verbose = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  nb_zero_GE = sum(sgcca.glioma$a[[1]] != 0)

## ---- eval = FALSE-------------------------------------------------------
#  nb_zero_CGH = sum(sgcca.glioma$a[[2]] != 0)

## ---- eval=FALSE, fig.align='center', fig.cap = 'graphical display of the tumors obtained by crossing GE1 and CGH1 land abeled according to their location.'----
#  df1 = data.frame(Loc = Loc,
#                   GE1 = sgcca.glioma$Y[[1]][, 1],
#                   CGH1 = sgcca.glioma$Y[[2]][, 1])
#  
#  p1 <- ggplot(df1, aes(GE1, CGH1)) +
#      geom_vline(xintercept = 0) +
#      geom_hline(yintercept = 0) +
#      ggtitle("Factor plot (Glioma data)") +
#      geom_text(aes(colour = Loc, label= rownames(df1)),
#                vjust=0,nudge_y = 0.03,size = 3 )+
#      theme(legend.position="bottom", legend.box = "horizontal",
#            legend.title = element_blank())
#  
#  p1

## ---- eval = FALSE-------------------------------------------------------
#  A <- ge_cgh_locIGR$multiblocks
#  Loc <- factor(ge_cgh_locIGR$y)
#  levels(Loc) <- colnames(ge_cgh_locIGR$multiblocks$y)
#  A[[3]] = A[[3]][, -3]
#  B = A
#  B[[3]] = Reduce("cbind", A[1:(length(A)-1)]) # superblock
#  B[[4]] = A[[3]]
#  sapply(B, dim) # check dimension

## ---- eval = TRUE--------------------------------------------------------
nb_block = 4 #length(B)
C = matrix(0, nb_block, nb_block)
C[, nb_block-1] = 1 ; C[nb_block-1, ] = 1 ; diag(C) = 0
C

## ---- eval = FALSE-------------------------------------------------------
#  sgcca.glioma = sgcca(B, C,
#                       c1 = c(.071,.2, 1/sqrt(NCOL(B[[3]]))+.2, 1),
#                       ncomp = c(rep(2, (length(B)-1)),1),
#                       scheme = "factorial", scale = TRUE,
#                       verbose = FALSE
#  )

## ---- eval = FALSE, fig.align = 'center', fig.cap = 'factor plot - two first components of the superblock. individuals are colored according to their group membership'----
#  
#  df1 = data.frame(Loc = Loc, sgcca.glioma$Y[[3]])
#  
#  p1 <- ggplot(df1, aes(comp1, comp2)) +
#      geom_vline(xintercept = 0) +
#      geom_hline(yintercept = 0) +
#      ggtitle("Factor plot (Glioma data) - super block") +
#      geom_text(aes(colour = Loc, label= rownames(df1)),
#                vjust=0,nudge_y = 0.03,size = 3)+
#      theme(legend.position="bottom", legend.box = "horizontal",
#            legend.title = element_blank())
#  p1

## ---- eval = FALSE, fig.align = 'center', fig.cap = 'correlation circle plot - two first components of the superblock. Variables are colored according to their block membership'----
#  ind.select = unlist(lapply(sgcca.glioma$a[1:(length(B)-2)],
#                             function(x) x[, 1]!=0 | x[, 2]!=0))
#  VAR.SELECT = B[[(length(B)-1)]][, ind.select]
#  BLOCK = rep("CGH", NCOL(VAR.SELECT))
#  BLOCK[grep("A", colnames(VAR.SELECT))] = "GE"
#  
#  df = data.frame(comp1 = cor(VAR.SELECT, sgcca.glioma$Y[[(length(B)-1)]][, 1]),
#                  comp2 = cor(VAR.SELECT, sgcca.glioma$Y[[(length(B)-1)]][, 2]),
#                  BLOCK)
#  
#  # Circle
#  circleFun <- function(center = c(-1,1),diameter = 1, npoints = 100){
#      r = diameter / 2
#      tt <- seq(0,2*pi,length.out = npoints)
#      xx <- center[1] + r * cos(tt)
#      yy <- center[2] + r * sin(tt)
#      return(data.frame(x = xx, y = yy))
#  }
#  
#  circle <- circleFun(c(0,0),2,npoints = 100)
#  
#  p <-ggplot(df, aes(comp1, comp2), colour = BLOCK) +
#      geom_path(aes(x,y), data=circle) +
#      geom_vline(xintercept = 0) +
#      geom_hline(yintercept = 0) +
#      ggtitle("Correlation Circle") +
#      geom_text(aes(colour = BLOCK, label= rownames(df)),
#                vjust=0,nudge_y = 0.03,size = 2)+
#      theme(legend.position="bottom", legend.box = "horizontal",
#            legend.title = element_blank())
#  
#  p

## ---- eval = FALSE-------------------------------------------------------
#  nb_boot = 500 # number of bootstrap samples
#  J = length(B)-2
#  STAB = list()
#  for (j in 1:J)
#    STAB[[j]] = matrix(0, nb_boot, NCOL(B[[j]]))
#  
#  c1 = c(.071,.2, 1/sqrt(NCOL(B[[3]]))+.2, 1)
#  
#  B = lapply(B, cbind)
#  for (i in 1:nb_boot){
#    ind = sample(NROW(B[[1]]), replace = TRUE)
#    Bscr = lapply(B, function(x) x[ind, ])
#    res = sgcca(Bscr, C, c1 = c1, ncomp = c(rep(1, length(B))),
#                scheme = "factorial", scale = TRUE)
#    for (j in 1:J) STAB[[j]][i, ] = res$a[[j]]
#  }
#  
#  for (j in 1:J) colnames(STAB[[j]]) = colnames(B[[j]])
#  
#  top = 30
#  count = lapply(STAB, function(x) apply(x, 2, function(y) sum(y!=0)))
#  count_sort = lapply(count, function(x) sort(x, decreasing = TRUE))

## ---- eval = FALSE-------------------------------------------------------
#  stabGE = data.frame(GE_symbol = names(count_sort[[1]])[1:top],
#                      Count = count_sort[[1]][1:top]/nb_boot)
#  
#  g1 <- ggplot(stabGE, aes(x = reorder(GE_symbol, Count), y = Count)) +
#        coord_flip() + geom_bar(stat = "identity")
#  g1

## ---- eval = FALSE-------------------------------------------------------
#  stabCGH = data.frame(CGH_symbol = names(count_sort[[2]])[1:top],
#                       Count = count_sort[[2]][1:top]/nb_boot)
#  
#  g2 <- ggplot(stabCGH, aes(x = reorder(CGH_symbol, Count), y = Count)) +
#        coord_flip() + geom_bar(stat = "identity")
#  g2

## ---- eval = FALSE-------------------------------------------------------
#  rI = function(A){
#      J = length(A)
#      res = rgcca(A, scale = TRUE, verbose = FALSE)
#      Y = Reduce("cbind", res$Y)
#      rI = 1/(J-1)*(cov2(rowSums(Y))/sum(apply(Y, 2, cov2))-1)
#  }
#  
#  
#  X1 = B[[1]][, unique(which(sgcca.glioma$a[[1]]!=0, arr.ind = TRUE)[, 1])]
#  X2 = B[[2]][, unique(which(sgcca.glioma$a[[2]]!=0, arr.ind = TRUE)[, 1])]
#  X3 = B[[4]]
#  A = list(GE = X1, CGH = X2, LOC = X3)
#  
#  J = length(A)
#  M = matrix(0, J, J)
#  colnames(M) = rownames(M) = names(A)
#  for (i in 1:J){
#    for (j in i:J){
#      M[i, j] = rI(A[c(i, j)])
#      M[j, i] = M[i, j]
#    }
#  }
#  
#  M

