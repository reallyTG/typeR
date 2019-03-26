library(tempR)


### Name: similarity.tcata.repeatability
### Title: Quantify TCATA assessor repeatability
### Aliases: similarity.tcata.repeatability

### ** Examples

  # Toy data from one TCATA assessor on a product over three sessions: rep1, rep2, rep3
  rep1 <- rbind(rep(0, 7),
                rep(0, 7),
                c(0, 0, 0, 1, 1, 1, 1),
                c(0, 0, 0, 1, 1, 1, 1),
                c(0, 0, 0, 1, 1, 1, 0))
  rep2 <- rbind(c(0, 0, 0, 1, 1, 1, 0),
                rep(0, 7),
                c(0, 1, 1, 1, 1, 1, 0),
                rep(1, 7),
                c(0, 0, 0, 1, 1, 1, 1))
  rep3 <- rbind(rep(0, 7),
                rep(0, 7),
                rep(1, 7),
                rep(1, 7),
                rep(1, 7))
  rep.data <- list(rep1, rep2, rep3)

  # Quantify similarity of assessor a1 to the other assessors
  similarity.tcata.repeatability(rep.data)



