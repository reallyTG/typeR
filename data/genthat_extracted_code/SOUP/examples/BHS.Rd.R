library(SOUP)


### Name: BHS
### Title: Multiplicity adjustment by Bonferroni-Holm-Shaffer's rule
### Aliases: BHS

### ** Examples

set.seed(123)
p.raw <- runif(10, max = 0.2)
rbind(p.raw, p.adj = SOUP::BHS(p.raw))



