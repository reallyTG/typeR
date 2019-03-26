library(forensic)


### Name: LR.ind
### Title: Likelihood Ratio for DNA Evidence (Independent Alleles Within
###   and Between Ethnic Groups)
### Aliases: LR.ind
### Keywords: misc

### ** Examples

## Simpson case (Fung and Hu (2001))
## From the crime scene: mixed profile a,b,c at a locus D2S44 
m = c("a", "b", "c")
## profile of the defendant: a,b
## profile of the victim: a,c
## allele frequencies (African - American, Caucasian)
p_aa <- c(0.0316, 0.0842, 0.0926)
p_c <- c(0.0859, 0.0827, 0.1073)
## the number of contributors to the mixed sample is taken 2
## Prosecution proposition: Contributors were the victim and the suspect 
## Defence proposition: Contributors were 2 unknown people
##
## Likelihood ratios for DNA evidence for different alternatives:
## two unknown people are African-American
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(2, 0), u2 = m)
LR.ind(alleles = m, prob = p_aa, x1 = 0, x2 = 2, u2 = m)
## one unknown person is African-American and one is Caucasian 
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(1, 1), u2 = m)
## two unknown people are Caucasian
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(0, 2), u2 = m)
LR.ind(alleles = m, prob = p_c, x1 = 0, x2 = 2, u2 = m)




