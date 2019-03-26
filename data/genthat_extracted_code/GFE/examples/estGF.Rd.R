library(GFE)


### Name: estGF
### Title: Gross Flows estimation
### Aliases: estGF

### ** Examples

library(TeachingSampling)
library(data.table)
# Colombia's electoral candidates in 2014
candidates_t0 <- c("Clara","Enrique","Santos","Martha","Zuluaga","WhiteVote", "NoVote")
candidates_t1 <- c("Santos","Zuluaga","WhiteVote", "NoVote")

N <- 100000
nCanT0 <- length(candidates_t0)
nCanT1 <- length(candidates_t1)
# Initial probabilities
eta <- matrix(c(0.10, 0.10, 0.20, 0.17, 0.28, 0.1, 0.05),
				byrow = TRUE, nrow = nCanT0)
# Transition probabilities
P <- matrix(c(0.10, 0.60, 0.15, 0.15,
				 0.30, 0.10, 0.25,0.35,
				 0.34, 0.25, 0.16, 0.25,
				 0.25,0.05, 0.35,0.35,
				 0.10, 0.25, 0.45,0.20,
				 0.12, 0.36, 0.22, 0.30,
				 0.10,0.15, 0.30,0.45),
		byrow = TRUE, nrow = nCanT0)
citaMod <- matrix(, ncol = nCanT1, nrow = nCanT0)
row.names(citaMod) <- candidates_t0
colnames(citaMod) <- candidates_t1

for(ii in 1:nCanT0){
		citaMod[ii,] <- c(rmultinom(1, size = N * eta[ii,], prob = P[ii,]))
}

# # Model I
psiI   <- 0.9
rhoRRI <- 0.9
rhoMMI <- 0.5

citaModI <- matrix(nrow = nCanT0 + 1, ncol = nCanT1 + 1)
rownames(citaModI) <- c(candidates_t0, "Non_Resp")
colnames(citaModI) <- c(candidates_t1, "Non_Resp")
citaModI[1:nCanT0, 1:nCanT1] <- P * c(eta) * rhoRRI * psiI
citaModI[(nCanT0 + 1), (nCanT1 + 1)] <- rhoMMI * (1-psiI)
citaModI[1:nCanT0, (nCanT1 + 1)] <- (1-rhoRRI) * psiI * rowSums(P * c(eta))
citaModI[(nCanT0 + 1), 1:nCanT1 ] <- (1-rhoMMI) * (1-psiI) * colSums(P * c(eta))
citaModI <- round_preserve_sum(citaModI * N)
DBcitaModI <- createBase(citaModI)

# Creating auxiliary information
DBcitaModI[,AuxVar := rnorm(nrow(DBcitaModI), mean = 45, sd = 10)]

# Selects a sample with unequal probabilities
res <- S.piPS(n = 3200, as.data.frame(DBcitaModI)[,"AuxVar"])
sam <- res[,1]
pik <- res[,2]
DBcitaModISam <- copy(DBcitaModI[sam,])
DBcitaModISam[,Pik := pik]

# Gross Flows estimation
estima <- estGF(sampleBase = DBcitaModISam, niter = 500, model = "I", colWeights = "Pik")
estima



