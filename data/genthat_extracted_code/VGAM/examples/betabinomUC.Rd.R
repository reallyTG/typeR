library(VGAM)


### Name: Betabinom
### Title: The Beta-Binomial Distribution
### Aliases: Betabinom dbetabinom pbetabinom rbetabinom dbetabinom.ab
###   pbetabinom.ab rbetabinom.ab dzoibetabinom pzoibetabinom rzoibetabinom
###   dzoibetabinom.ab pzoibetabinom.ab rzoibetabinom.ab
### Keywords: distribution

### ** Examples

set.seed(1); rbetabinom(10, 100, prob = 0.5)
set.seed(1);     rbinom(10, 100, prob = 0.5)  # The same since rho = 0

## Not run: 
##D  N <- 9; xx <- 0:N; s1 <- 2; s2 <- 3
##D dy <- dbetabinom.ab(xx, size = N, shape1 = s1, shape2 = s2)
##D barplot(rbind(dy, dbinom(xx, size = N, prob = s1 / (s1+s2))),
##D         beside = TRUE, col = c("blue","green"), las = 1,
##D         main = paste("Beta-binomial (size=",N,", shape1=", s1,
##D                    ", shape2=", s2, ") (blue) vs\n",
##D         " Binomial(size=", N, ", prob=", s1/(s1+s2), ") (green)",
##D                      sep = ""),
##D         names.arg = as.character(xx), cex.main = 0.8)
##D sum(dy * xx)  # Check expected values are equal
##D sum(dbinom(xx, size = N, prob = s1 / (s1+s2)) * xx)
##D # Should be all 0:
##D cumsum(dy) - pbetabinom.ab(xx, N, shape1 = s1, shape2 = s2)
##D 
##D y <- rbetabinom.ab(n = 1e4, size = N, shape1 = s1, shape2 = s2)
##D ty <- table(y)
##D barplot(rbind(dy, ty / sum(ty)),
##D         beside = TRUE, col = c("blue", "orange"), las = 1,
##D         main = paste("Beta-binomial (size=", N, ", shape1=", s1,
##D                      ", shape2=", s2, ") (blue) vs\n",
##D         " Random generated beta-binomial(size=", N, ", prob=",
##D         s1/(s1+s2), ") (orange)", sep = ""), cex.main = 0.8,
##D         names.arg = as.character(xx))
##D 
##D N <- 1e5; size <- 20; pstr0 <- 0.2; pstrsize <- 0.2
##D kk <- rzoibetabinom.ab(N, size, s1, s2, pstr0, pstrsize)
##D hist(kk, probability = TRUE, border = "blue", ylim = c(0, 0.25),
##D      main = "Blue/green = inflated; orange = ordinary beta-binomial",
##D      breaks = -0.5 : (size + 0.5))
##D sum(kk == 0) / N  # Proportion of 0
##D sum(kk == size) / N  # Proportion of size
##D lines(0 : size,
##D       dbetabinom.ab(0 : size, size, s1, s2), col = "orange")
##D lines(0 : size, col = "green", type = "b",
##D       dzoibetabinom.ab(0 : size, size, s1, s2, pstr0, pstrsize))
## End(Not run)



