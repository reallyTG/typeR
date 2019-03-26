library(forensic)


### Name: Pevid.ind
### Title: Probability of DNA Evidence (Independent Alleles Within and
###   Between Ethnic Groups)
### Aliases: Pevid.ind
### Keywords: misc

### ** Examples

## Simpson case (Fung and Hu (2001))
## From the crime scene: mixed profile a,b,c at the locus D2S44 
m = c("a", "b", "c")
## profile of the defendant: a,b
## profile of the victim: a,c
## the number of contributors to the mixed sample is taken 2
## Prosecution proposition: Contributors were the victim and the suspect.
## (The defendant was an African-American and the victim was a Caucasian,
## but we do not need this information for the calculation of LR)
## Defence proposition: Contributors were 2 unknown people.
## allele frequencies (African - American, Caucasian)
p_aa <- c(0.0316, 0.0842, 0.0926)
p_c <- c(0.0859, 0.0827, 0.1073)
##
## Likelihood ratios for DNA evidence for different alternatives:
## two unknown contributors were African-American
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(2, 0), u = m)
1/Pevid.ind(alleles = m, prob = p_aa, x = 2, u = m)
## one unknown contributor was African-American and one was Caucasian 
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(1, 1), u = m)
## two unknown contributors were Caucasian
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(0, 2), u = m)
1/Pevid.ind(alleles = m, prob = p_c, x = 2, u = m)

## Rape case in Hong Kong (Fung and Hu (2000), Fung and Hu (2002))
## the mixed stain at D3S1358
m = c(14, 15, 17, 18)
## suspect's genotype (14, 17)
## If the mixed stain did not originate from the victim, 
## we may consider the propositions:
## Prosecution: The contributors were the suspect and an unknown
## Defence: The contributors were two unknowns
## Arrested suspect was a Caucasian
## Possible ethnic groups of the unknowns:
## Caucasian, Chinese
p_ca = c(0.187, 0.213, 0.223, 0.127)
p_ch = c(0.033, 0.331, 0.239, 0.056)
## the both unknowns are Caucasian
Pevid.ind(alleles = m, prob = p_ca, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = p_ca, x = 2, u = m)
## first unknown is Caucasian, the second one Chinese
Pevid.ind(alleles = m, prob = p_ca, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## first unknown is Chinese, the second one Caucasian
Pevid.ind(alleles = m, prob = p_ch, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## the both unknowns are Chinese
Pevid.ind(alleles = m, prob = p_ch, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = p_ch, x = 2, u = m)
##
## Suppose the second suspect (Caucasian, (15, 18)) was arrested 
## Prosecution: The contributors were the two suspects 
## Defence: The contributors were two unknowns
## the both unknowns are Caucasian
1/Pevid.ind(alleles = m, prob = p_ca, x = 2, u = m)
## first unknown is Caucasian, the second one Chinese
1/Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## first unknown is Chinese, the second one Caucasian
1/Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## the both unknowns are Chinese
1/Pevid.ind(alleles = m, prob = p_ch, x = 2, u = m)




