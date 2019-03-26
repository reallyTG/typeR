## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE)
library(iprior)

## ------------------------------------------------------------------------
indxFn <- function(k) {
  # Indexer helper function used to create indices for H2l. Note: intr, ind1 and
  # ind2 are created in kernL().
  ind.int1 <- intr[1, ] == k; ind.int2 <- intr[2, ] == k  # locating var/kernel matrix
  ind.int <- which(ind.int1 | ind.int2)                   # of interactions (out of 1:no.int)
  k.int <- ind.int + p  # which kernel matrix has interactions involving k
  k.int.lam <- c(intr[1, ][ind.int2], intr[2, ][ind.int1])  # which has 
                                                            # interaction with k?
  nok <- (1:p)[-k]  # all variables excluding k
  k.noint <- which(!(ind.int1 | ind.int2)) + p  # the opposite of k.int

  # P.mat %*% R.mat + R.mat %*% P.mat indices ----------------------------------
  za <- which((ind1 %in% k & ind2 %in% nok) | (ind2 %in% k & ind1 %in% nok))
  grid.PR <- expand.grid(k.int, nok)
  zb <- which((ind1 %in% grid.PR[,1] & ind2 %in% grid.PR[,2]) |
              (ind2 %in% grid.PR[,1] & ind1 %in% grid.PR[,2]))
  grid.PR.lam <- expand.grid(k.int.lam, nok)

  # P.mat %*% U.mat + U.mat %*% P.mat indices ----------------------------------
  grid.PU1 <- expand.grid(k, k.noint)
  zc <- which((ind1 %in% grid.PU1[,1] & ind2 %in% grid.PU1[,2]) |
              (ind2 %in% grid.PU1[,1] & ind1 %in% grid.PU1[,2]))
  grid.PU2 <- expand.grid(k.int, k.noint)
  zd <- apply(grid.PU2, 1, findH2, ind1 = ind1, ind2 = ind2)
  grid.PU.lam <- expand.grid(k.int.lam, k.noint)

  # P.mat %*% P.mat indices ----------------------------------------------------
  grid.Psq <- t(combn(c(k, k.int), 2))
  ze <- apply(grid.Psq, 1, findH2, ind1 = ind1, ind2 = ind2 )
  grid.Psq.lam <- NULL
  if (length(k.int.lam) > 0) grid.Psq.lam <- t(combn(c(0, k.int.lam), 2))

  list(
    k.int     = k.int,
    k.int.lam = k.int.lam,
    PRU       = c(za,zc,zb,zd),
    PRU.lam1  = c(rep(0, length(nok) + length(k.noint)),
                  grid.PR.lam[,1], grid.PU.lam[,1]),
    PRU.lam2  = c(nok, k.noint, grid.PR.lam[,2], grid.PU.lam[,2]),
    Psq       = c(k, k.int),
    Psq.lam   = k.int.lam,
    P2        = ze,
    P2.lam1   = grid.Psq.lam[,1],
    P2.lam2   = grid.Psq.lam[,2]
	)
}

findH2 <- function(z, ind1, ind2){
  # This function finds position of H2 (cross-product terms of H). Used in
  # indxFn()
  x <- z[1]; y <- z[2]
  which((ind1 == x & ind2 == y) | (ind2 == x & ind1 == y))
}


## ------------------------------------------------------------------------
(mod <- kernL(stack.loss ~ . ^ 2, data = stackloss))
p <- 3

## ------------------------------------------------------------------------
intr <- mod$intr
colnames(intr) <- NULL
intr

## ------------------------------------------------------------------------
h <- length(mod$Hl)
z <- 1:h
(ind1 <- rep(z, times = (length(z) - 1):0))
(ind2 <- unlist(lapply(2:length(z), function(x) c(NA, z)[-(0:x)])))

## ------------------------------------------------------------------------
k <- 1
ind.int1 <- intr[1, ] == k; ind.int2 <- intr[2, ] == k
(ind.int <- which(ind.int1 | ind.int2))

## ------------------------------------------------------------------------
(k.int <- ind.int + p)

## ------------------------------------------------------------------------
(k.int.lam <- c(intr[1, ][ind.int2], intr[2, ][ind.int1]))

## ------------------------------------------------------------------------
(nok <- (1:p)[-k])

## ------------------------------------------------------------------------
(k.noint <- which(!(ind.int1 | ind.int2)) + p)

## ------------------------------------------------------------------------
ind <- paste(ind1, ind2, sep = "x")
names(ind) <- as.character(1:length(ind))
ind

## ---- echo = 9-----------------------------------------------------------
ind.tmp <- c(ind1, ind2)
ind.tmp[ind.tmp == 4] <- "1:2"
ind.tmp[ind.tmp == 5] <- "1:3"
ind.tmp[ind.tmp == 6] <- "2:3"
ind1.tmp <- ind.tmp[1:length(ind1)]
ind2.tmp <- ind.tmp[(length(ind1) + 1):length(ind.tmp)]
ind.tmp <- paste(ind1.tmp, ind2.tmp, sep = "x")
names(ind.tmp) <- as.character(1:length(ind))
ind.tmp

## ------------------------------------------------------------------------
(za <- which((ind1 %in% k & ind2 %in% nok) | (ind2 %in% k & ind1 %in% nok)))

# Check
ind[za]

## ------------------------------------------------------------------------
(grid.PR <- expand.grid(k.int, nok))
(zb <- which((ind1 %in% grid.PR[,1] & ind2 %in% grid.PR[,2]) |
            (ind2 %in% grid.PR[,1] & ind1 %in% grid.PR[,2])
))

## ------------------------------------------------------------------------
(nok)
(grid.PR.lam <- expand.grid(k.int.lam, nok))

## ---- eval = FALSE-------------------------------------------------------
#  sum(lambda[PR.lam index] * H2l[PR index])

## ------------------------------------------------------------------------
(grid.PU1 <- expand.grid(k, k.noint))
(zc <- which((ind1 %in% grid.PU1[,1] & ind2 %in% grid.PU1[,2]) |
             (ind2 %in% grid.PU1[,1] & ind1 %in% grid.PU1[,2])))

# Check
ind[zc]
ind.tmp[zc]

## ------------------------------------------------------------------------
(grid.PU2 <- expand.grid(k.int, k.noint))
(zd <- which((ind1 %in% grid.PU2[,1] & ind2 %in% grid.PU2[,2]) |
             (ind2 %in% grid.PU2[,1] & ind1 %in% grid.PU2[,2])))

# Check
ind[zd]
ind.tmp[zd]

## ------------------------------------------------------------------------
(k.noint)
(grid.PU.lam <- expand.grid(k.int.lam, k.noint))

## ------------------------------------------------------------------------
indB <- indxFn(1)
indB$PRU  # = c(za, zc, zb, zd) i.e. index of Hl to sum together
rbind(indB$PRU.lam1, indB$PRU.lam2)  # index of the lambdas to cross-product with Hl

## ---- eval = FALSE-------------------------------------------------------
#  lambda.PRU <- c(rep(1, sum(indB$PRU.lam1 == 0)), lambda[indB$PRU.lam1])
#  lambda.PRU <- lambda.PRU * lambda[indB$PRU.lam2]
#  S <- Reduce("+", mapply("*", H2l[indB$PRU], lambda.PRU, SIMPLIFY = FALSE))

## ------------------------------------------------------------------------
(Psq <- c(k, k.int))
(Psq.lam <- k.int.lam)

## ------------------------------------------------------------------------
(grid.Psq <- t(combn(c(k, k.int), 2)))
(ze <- which((ind1 %in% grid.Psq[,1] & ind2 %in% grid.Psq[,2]) |
             (ind2 %in% grid.Psq[,1] & ind1 %in% grid.Psq[,2])))

# Check
ind[ze]
ind.tmp[ze]

grid.Psq.lam <- NULL
if (length(k.int.lam) > 0) grid.Psq.lam <- t(combn(c(0, k.int.lam), 2))
grid.Psq.lam

## ---- eval = FALSE-------------------------------------------------------
#  # First part of sum
#  Psql[[k]] <<- Reduce("+", mapply("*", Hsql[indB$Psq],
#                                   c(1, lambda[indB$Psq.lam] ^ 2),
#                                   SIMPLIFY = FALSE))
#  
#  # Second part of sum
#  lambda.P2 <- c(rep(1, sum(indB$P2.lam1 == 0)), lambda[indB$P2.lam1])
#  lambda.P2 <- lambda.P2 * lambda[indB$P2.lam2]
#  Psql[[k]] <<- Psql[[k]] + Reduce("+", mapply("*", H2l[indB$P2],
#                                               lambda.P2,
#                                               SIMPLIFY = FALSE))

