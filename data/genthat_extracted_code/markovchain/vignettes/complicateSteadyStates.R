## ---- message=FALSE------------------------------------------------------
library(markovchain)
M<-matrix(c(0,0.5,0.50,0.0,0,0.00,0,0.0,0.99,0.0,0,0.01,0,0.8,0.00,
                0.2,0,0.00,0,0.0,0.00,0.0,1,0.00,
0,0.0,0.00,1.0,0,0.00,0,0.0,0.00,0.0,0,1.00), nrow=6, byrow=TRUE)
colnames(M) <- rownames(M) <- paste0("s",1:6)
chain1 <- as(M,"markovchain")
plot(chain1)

## ------------------------------------------------------------------------
mu <- c(0, 0, 0, 1/4, 1/4, 1/2)
mu %*% M 
mu <- c(0, 0, 0, 0, 0, 1)
mu %*% M 
mu <- c(0, 0, 0, 1/2, 1/2, 0)
mu %*% M 
steadyStates(chain1)

## ------------------------------------------------------------------------
communicatingClasses(chain1)
recurrentClasses(chain1)
absorbingStates(chain1)
transientStates(chain1)

## ------------------------------------------------------------------------
library(expm)
M %^% 1000
M %^% 1001

## ------------------------------------------------------------------------
c(1, -1, 0, .99*.8, -.99*.8)
eigen(t(M))

## ------------------------------------------------------------------------
eigen(t(M))$vectors[,eigen(t(M))$values >= 1]

## ------------------------------------------------------------------------
Msub <- M[rownames(M) %in% unlist(recurrentClasses(chain1)), colnames(M) %in% unlist(recurrentClasses(chain1))]
eigen(Msub)$vectors[,eigen(Msub)$values >= 1]
t(eigen(Msub)$vectors[,eigen(Msub)$values >= 1]) / colSums(eigen(Msub)$vectors[,eigen(Msub)$values >= 1])

