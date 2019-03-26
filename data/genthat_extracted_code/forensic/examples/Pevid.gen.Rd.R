library(forensic)


### Name: Pevid.gen
### Title: Probability of DNA Evidence (Allowing for Population
###   Substructure and Dependence)
### Aliases: Pevid.gen
### Keywords: misc

### ** Examples

   ## Rape case 
   ## The evidence profile: 
   m <- c(13, 14, 15) 
   ##  the victim's genotype:
   victim <- "13/14"
   ## the suspect's genotype 
   suspect <- "15/15"
   ## frequencies of alleles {13, 14, 15}:
   p <- c(0.042, 0.166, 0.106) 
   ## consensual partner of the victim
   partner <- "15/16"
   ## Prosecution proposition: 
   ## Contributors were the victim and the suspect.
   Pevid.gen( alleles = m, prob = p, T = c(victim, suspect), 
     V = partner, x = 0, theta = 0.03)
   ## Defence proposition: 
   ## Contributors were the victim and one unknown person.
   ## 
   ## Likelihood ratio for DNA evidence:
   ## structured population
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner), x = 1, theta = 0.03)
   ## Note: a person carrying both alleles different from the alleles 
   ## in the crime sample (e.g., with genotype "16/16") has no effect 
   ## on the value of LR: 
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner, "16/16"), x = 1, theta = 0.03)
   ## But the consensual partner of the victim having genotype "15/16" 
   ## influences the value of LR, compare:
   1/Pevid.gen( alleles = m, prob = p, T = victim, V = suspect, 
     x = 1, theta = 0.03)
   ## 
   ## population in Hardy - Weinberg equilibrium      
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner), x = 1)
   1/Pevid.gen( alleles = m, prob = p, T = victim, x = 1)
   ## compare
   1/Pevid.ind( alleles = m, prob = p, u = 15, x = 1)



