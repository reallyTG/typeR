## ------------------------------------------------------------------------
library(imaginator)
pois5 <- PoissonHelper(5)
pois10 <- PoissonHelper(10)
class(pois10)

## ------------------------------------------------------------------------
library(ggplot2)
set.seed(1234)

dfClaims <- rbind(data.frame(Group = "A", Claims = pois5(500))
                  , data.frame(Group = "B", Claims = pois10(500)))

plt <- ggplot(dfClaims, aes(Claims, fill = Group))
plt <- plt + geom_histogram(binwidth = 1, color = "black", alpha = 0.8, position = "identity")
plt

