library(apa)


### Name: cor_apa
### Title: Report Correlation in APA style
### Aliases: cor_apa

### ** Examples

# Example data from ?cor.test
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

cor_apa(cor.test(x, y))

# Spearman's rho
cor_apa(cor.test(x, y, method = "spearman"))

# Kendall's tau
cor_apa(cor.test(x, y, method = "kendall"))




