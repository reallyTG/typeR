library(votesys)


### Name: cdc_kemenyyoung
### Title: Kemeny-Young Method
### Aliases: cdc_kemenyyoung

### ** Examples

m <- matrix(c(0, 58, 58, 58, 42, 0, 32, 32, 42, 68, 0, 17, 42, 68, 83, 0), nr = 4)
colnames(m) <- c('m', 'n', 'c', 'k')
rownames(m) <- c('m', 'n', 'c', 'k')
y <- cdc_kemenyyoung(m, keep_all_link = TRUE) # winner is n



