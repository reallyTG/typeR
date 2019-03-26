library(mri)


### Name: MW1
### Title: Modified Adjusted Wallace Index 1
### Aliases: MW1 MAW1

### ** Examples

# Examples from Cugmas and Ferligoj (2018) paper:
data(examples)
# EXAMPLES: A, B, C, D
par(mfrow = c(4, 4))
for (i in 1:4){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  cat("MAWI1", MAW1(U = U, V = V), "\n")
}

# EXAMPLES: E, F, G, H
for (i in 13:16){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  U[which(max(as.numeric(as.character(U))) == as.numeric(as.character(U)))] <- NA
  V[which(max(as.numeric(as.character(V))) == as.numeric(as.character(V)))] <- NA

  cat("MAWI1", MAW1(U = U, V = V), "\n")
}

# EXAMPLES: I, J, K, L
for (i in 5:8){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  V[which(max(as.numeric(as.character(V))) == as.numeric(as.character(V)))] <- NA

  cat("MAWI1", MAW1(U = U, V = V), "\n")
}

# EXAMPLES: M, N, O, P
for (i in 9:12){
  U <- fromTableToVectors(examples[[i]])[,1]
  V <- fromTableToVectors(examples[[i]])[,2]

  U[which(max(as.numeric(as.character(U))) == as.numeric(as.character(U)))] <- NA

  cat("MAWI1", MAW1(U = U, V = V), "\n")
}



