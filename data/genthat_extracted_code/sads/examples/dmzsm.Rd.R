library(sads)


### Name: dmzsm
### Title: Metacommunity zero-sum multinomial distribution
### Aliases: dmzsm pmzsm qmzsm rmzsm

### ** Examples

## Alonso & McKanne (2004) figure 2
data(moths) #Fisher's moths data
m.tab <- hist(moths, breaks = 2^(0:12), plot = FALSE)
plot(m.tab$density~m.tab$mids, log="xy",
     xlab = "Abundance", ylab = "Probability density",
     ylim=c(1e-7,1))
X <- 1:max(moths)
Y <- dmzsm(X, J = sum(moths), theta = 39.8)
lines(Y ~ X)



