library(strataG)


### Name: freq2GenData
### Title: Convert Haplotype Frequency Matrices
### Aliases: freq2GenData

### ** Examples

hap.freqs <- data.frame(
  haps = c("hap1", "hap2", "hap3"),
  pop1 = rmultinom(1, 50, prob = c(0.1, 0.2, 0.7)),
  pop2 = rmultinom(1, 25, prob = c(0.5, 0.4, 0.1))
)

gen.data <- freq2GenData(hap.freqs, hap.col = 1, freq.col = 2)

x <- df2gtypes(gen.data, ploidy = 1)
summary(x)




