library(extracat)


### Name: BCI
### Title: The Bertin Classification Index
### Aliases: BCI

### ** Examples

#for an unoptimized matrix we take the minimum of BCI(M) and BCI(M[,12:1])
M <-arsim(1000, c(12,12), 3)
min(BCI(M), BCI(M[,12:1]))

#an strongly related alternative (for two-way data)
kendalls(M)

M2 <- optile(M, iter = 100)
BCI(M2)
kendalls(M2)

M3 <-arsim(100000, c(12,13,15), 4,noise=0.2,shuffle=FALSE)
BCI(M3)




