library(SeedCalc)


### Name: mean_raiz
### Title: Root Length
### Aliases: mean_raiz

### ** Examples

Seedling <- data.frame(
LOTE = c(1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2),
REP = c(1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2),
SH = c(0.00, 2.77, 1.18, 1.07, 0.80, 2.65, 3.51, 0.64, 2.77, 1.18, 1.07, 0.80, 2.65, 3.51, 1.98),
ROOT = c(4.86, 6.71, 7.88, 3.68, 9.68, 8.88, 9.85, 4.86, 6.71, 7.88, 3.68, 9.68, 8.88, 9.85, 8.75)
)
print(Seedling)
RL <- mean_raiz(Seedling)
RL



