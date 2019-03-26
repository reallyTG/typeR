library(maxstat)


### Name: pLausen92
### Title: Approximating Maximally Selected Statistics
### Aliases: pLausen92 qLausen92
### Keywords: distribution

### ** Examples


# Compute quantiles. Should be equal to Table 2 in Lausen and Schumacher

load(file.path(system.file(package = "maxstat"), "results", "LausenTab2.rda"))

a <- rev(c(0.01, 0.025, 0.05, 0.1))
prop <- rbind(c(0.25, 0.75), c(0.4, 0.6), c(0.1, 0.9), c(0.4, 0.9))
Quant <- matrix(rep(0, length(a)*nrow(prop)), nrow=length(a)) 

for (i in 1:length(a)) {                                            
  for (j in 1:nrow(prop)) {                            
    Quant[i,j] <- qLausen92(a[i], minprop=prop[j,1], maxprop=prop[j,2]) 
  }
}

Quant <- round(Quant, 3)
rownames(Quant) <- a
colnames(Quant) <- c("A2575", "A46", "A19", "A49")
Quant <- as.data.frame(Quant)
rownames(LausenTab2) <- a

Quant

LausenTab2

if(!all.equal(LausenTab2, Quant)) stop("error checking pLausen92")




