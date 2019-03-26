library(GFE)


### Name: createBase
### Title: Create a database for gross flows.
### Aliases: createBase

### ** Examples

candidates_t0 <- c("Candidate1","Candidate2","Candidate3","Candidate4",
	"Candidate5","WhiteVote", "NoVote")
candidates_t1 <- c("Candidate3","Candidate5","WhiteVote", "NoVote")

N 	   <- 100000
nCanT0  <- length(candidates_t0)
nCanT1  <- length(candidates_t1)

eta <- matrix(c(0.10, 0.10, 0.20, 0.17, 0.28, 0.1, 0.05),
			   byrow = TRUE, nrow = nCanT0)
P <- matrix(c(0.10, 0.60, 0.15, 0.15,
			  0.30, 0.10, 0.25,	0.35,
			  0.34, 0.25, 0.16, 0.25,
			  0.25,	0.05, 0.35,	0.35,
			  0.10, 0.25, 0.45,	0.20,
			  0.12, 0.36, 0.22, 0.30,
			  0.10,	0.15, 0.30,	0.45),
	 byrow = TRUE, nrow = nCanT0)

citaModel <- matrix(, ncol = nCanT1, nrow = nCanT0)
row.names(citaModel) <- candidates_t0
colnames(citaModel) <- candidates_t1

for(ii in 1:nCanT0){ 
 citaModel[ii,] <- c(rmultinom(1, size = N * eta[ii,], prob = P[ii,]))
}

# # Model I
psiI   <- 0.9
rhoRRI <- 0.9
rhoMMI <- 0.5

citaModI <- matrix(nrow = nCanT0 + 1, ncol = nCanT1 + 1)
rownames(citaModI) <- c(candidates_t0, "Non_Resp")
colnames(citaModI) <- c(candidates_t1, "Non_Resp")

citaModI[1:nCanT0, 1:nCanT1] 		 <- P * c(eta) * rhoRRI * psiI  
citaModI[(nCanT0 + 1), (nCanT1 + 1)]  <- rhoMMI * (1-psiI) 
citaModI[1:nCanT0, (nCanT1 + 1)]  	 <-  (1-rhoRRI) * psiI * rowSums(P * c(eta))
citaModI[(nCanT0 + 1), 1:nCanT1 ] 	 <-  (1-rhoMMI) * (1-psiI) * colSums(P * c(eta))
citaModI   <- round_preserve_sum(citaModI * N)
DBmodCitaI <- createBase(citaModI)
DBmodCitaI



