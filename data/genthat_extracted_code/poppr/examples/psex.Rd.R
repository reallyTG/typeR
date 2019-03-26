library(poppr)


### Name: psex
### Title: Probability of encountering a genotype more than once by chance
### Aliases: psex

### ** Examples

data(Pram)

# With multiple encounters
Pram_psex <- psex(Pram, by_pop = FALSE, method = "multiple")
plot(Pram_psex, log = "y", col = ifelse(Pram_psex > 0.05, "red", "blue"))
abline(h = 0.05, lty = 2)
title("Probability of multiple encounters")
## Not run: 
##D 
##D # For a single encounter (default)
##D Pram_psex <- psex(Pram, by_pop = FALSE)
##D plot(Pram_psex, log = "y", col = ifelse(Pram_psex > 0.05, "red", "blue"))
##D abline(h = 0.05, lty = 2)
##D title("Probability of second encounter")
##D 
##D # This can be also done assuming populations structure
##D Pram_psex <- psex(Pram, by_pop = TRUE, method = "multiple")
##D plot(Pram_psex, log = "y", col = ifelse(Pram_psex > 0.05, "red", "blue"))
##D abline(h = 0.05, lty = 2)
##D title("Probability of multiple encounters\nwith pop structure")
##D 
##D # The above, but correcting zero-value alleles by 1/(2*rrmlg) with no 
##D # population structure assumed
##D # Type ?rare_allele_correction for details.
##D Pram_psex2 <- psex(Pram, by_pop = FALSE, d = "rrmlg", mul = 1/2, method = "multiple")
##D plot(Pram_psex2, log = "y", col = ifelse(Pram_psex2 > 0.05, "red", "blue"))
##D abline(h = 0.05, lty = 2)
##D title("Probability of multiple encounters\nwith pop structure (1/(2*rrmlg))")
##D 
##D # We can also set G to the total population size
##D (G <- nInd(Pram))
##D Pram_psex <- psex(Pram, by_pop = TRUE, method = "multiple", G = G)
##D plot(Pram_psex, log = "y", col = ifelse(Pram_psex > 0.05, "red", "blue"))
##D abline(h = 0.05, lty = 2)
##D title("Probability of multiple encounters\nwith pop structure G = 729")
##D 
##D # Or we can set G to the number of unique MLGs
##D (G <- rowSums(mlg.table(Pram, plot = FALSE) > 0))
##D Pram_psex <- psex(Pram, by_pop = TRUE, method = "multiple", G = G)
##D plot(Pram_psex, log = "y", col = ifelse(Pram_psex > 0.05, "red", "blue"))
##D abline(h = 0.05, lty = 2)
##D title("Probability of multiple encounters\nwith pop structure G = nmll")
##D 
##D ## An example of supplying previously calculated frequencies and G
##D # From Parks and Werth, 1993, using the first three genotypes.
##D 
##D # The row names indicate the number of samples found with that genotype
##D x <- "
##D  Hk Lap Mdh2 Pgm1 Pgm2 X6Pgd2
##D 54 12 12 12 23 22 11
##D 36 22 22 11 22 33 11
##D 10 23 22 11 33 13 13"
##D 
##D # Since we aren't representing the whole data set here, we are defining the
##D # allele frequencies before the analysis.
##D afreq <- c(Hk.1 = 0.167, Hk.2 = 0.795, Hk.3 = 0.038, 
##D            Lap.1 = 0.190, Lap.2 = 0.798, Lap.3 = 0.012,
##D            Mdh2.0 = 0.011, Mdh2.1 = 0.967, Mdh2.2 = 0.022,
##D            Pgm1.2 = 0.279, Pgm1.3 = 0.529, Pgm1.4 = 0.162, Pgm1.5 = 0.029,
##D            Pgm2.1 = 0.128, Pgm2.2 = 0.385, Pgm2.3 = 0.487,
##D            X6Pgd2.1 = 0.526, X6Pgd2.2 = 0.051, X6Pgd2.3 = 0.423)
##D 
##D xtab <- read.table(text = x, header = TRUE, row.names = 1)
##D 
##D # Here we are expanding the number of samples to their observed values.
##D # Since we have already defined the allele frequencies, this step is actually
##D # not necessary. 
##D all_samples <- rep(rownames(xtab), as.integer(rownames(xtab)))
##D xgid        <- df2genind(xtab[all_samples, ], ncode = 1)
##D 
##D freqs <- afreq[colnames(tab(xgid))] # only used alleles in the sample
##D pSex  <- psex(xgid, by_pop = FALSE, freq = freqs, G = 45)
##D 
##D # Note, pgen returns log values for each locus, here we take the sum across
##D # all loci and take the exponent to give us the value of pgen for each sample
##D pGen <- exp(rowSums(pgen(xgid, by_pop = FALSE, freq = freqs)))
##D 
##D res  <- matrix(c(unique(pGen), unique(pSex)), ncol = 2)
##D colnames(res) <- c("Pgen", "Psex")
##D res <- cbind(xtab, nRamet = rownames(xtab), round(res, 5))
##D rownames(res) <- 1:3
##D res # Compare to the first three rows of Table 2 in Parks & Werth, 1993
## End(Not run)



