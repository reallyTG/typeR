library(forensic)


### Name: Pevid.rel
### Title: Probability of DNA Evidence With the Presence of Relatives
### Aliases: Pevid.rel
### Keywords: misc

### ** Examples

## Rape case in Hong Kong (Fung and Hu (2000))
## mixture (loci: D3S1358, vWA, FGA)
m1 <- c(14, 15, 17, 18)
m2 <- c(16, 18)
m3 <- c(20, 24, 25)
## genotype of the victim (loci: D3S1358, vWA, FGA): 
victim_1 = "15/18"
victim_2 = "18/18"
victim_3 = "20/24"
## genotype of the suspect (loci: D3S1358, vWA, FGA):
suspect_1 = "14/17"
suspect_2 = "16/16"
suspect_3 = "25/25"
## allele proportions 
p1 <- c(0.033, 0.331, 0.239, 0.056)
p2 <- c(0.155, 0.158)
p3 <- c(0.042, 0.166, 0.106)
##
## Likelihood ratio for DNA evidence:
## Prosecution proposition: 
## Contributors were the victim and the suspect.
## Defence proposition 1: 
## Contributors were the victim and one relative of the suspect (sibling).
print(LR11 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_1, u = c(14, 17)))
print(LR12 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_2, u = 16))
print(LR13 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_3, u = 25))
##
## Defence proposition 2: 
## Contributors were one relative of the suspect (sibling) and one unknown. 
print(LR21 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 2, 
  k = c(1/4, 1/2, 1/4), S = suspect_1, u = m1))
print(LR22 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 2, 
k = c(1/4, 1/2, 1/4), S = suspect_2, u = m2))
print(LR23 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 2, 
k = c(1/4, 1/2, 1/4), S = suspect_3, u = m3))
##
## Defence proposition 3: 
## Contributors were two related people (siblings).
print(LR31 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 2, 
k = c(1/4, 1/2, 1/4), u = m1))
print(LR32 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 2, 
k = c(1/4, 1/2, 1/4), u = m2))
print(LR33 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 2, 
k = c(1/4, 1/2, 1/4), u = m3))
##
## Likelihood ratios overall:
## for defence proposition 1
LR11*LR12*LR13
## for defence proposition 2
LR21*LR22*LR23
## for defence proposition 3
LR31*LR32*LR33



