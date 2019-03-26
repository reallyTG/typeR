library(waveslim)


### Name: dwpt
### Title: (Inverse) Discrete Wavelet Packet Transforms
### Aliases: dwpt idwpt modwpt
### Keywords: ts

### ** Examples

data(mexm)
J <- 4
mexm.mra <- mra(log(mexm), "mb8", J, "modwt", "reflection")
mexm.nomean <- ts(
  apply(matrix(unlist(mexm.mra), ncol=J+1, byrow=FALSE)[,-(J+1)], 1, sum), 
  start=1957, freq=12)
mexm.dwpt <- dwpt(mexm.nomean[-c(1:4)], "mb8", 7, "reflection")



