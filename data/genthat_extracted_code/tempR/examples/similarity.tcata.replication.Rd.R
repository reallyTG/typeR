library(tempR)


### Name: similarity.tcata.replication
### Title: Quantify TCATA assessor replication
### Aliases: similarity.tcata.replication

### ** Examples

  # Toy TCATA data for three assessors: a1, a2, a3
  a1 <- rbind(rep(0, 7),
              rep(0, 7),
              c(0, 0, 0, 1, 1, 1, 1),
              c(0, 0, 0, 1, 1, 1, 1),
              c(0, 0, 0, 1, 1, 1, 0))
  a2 <- rbind(c(0, 0, 0, 1, 1, 1, 0),
              rep(0, 7),
              c(0, 1, 1, 1, 1, 1, 0),
              rep(1, 7),
              c(0, 0, 0, 1, 1, 1, 1))
  a3 <- rbind(rep(0, 7),
              rep(0, 7),
              rep(1, 7),
              rep(1, 7),
              rep(1, 7))

  # Quantify similarity of assessor a1 to the other assessors
  similarity.tcata.replication(a1, rbind(a2, a3))



