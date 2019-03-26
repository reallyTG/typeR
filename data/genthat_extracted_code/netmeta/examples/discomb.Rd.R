library(netmeta)


### Name: discomb
### Title: Additive network meta-analysis for combinations of treatments
###   (disconnected networks)
### Aliases: discomb
### Keywords: Network meta-analysis Additive network meta-analysis

### ** Examples

# Artificial dataset
#
t1 <- c("A + B", "A + C", "A"    , "A"    , "D", "D", "E")
t2 <- c("C"    , "B"    , "B + C", "A + D", "E", "F", "F")
#
mean    <- c(4.1, 2.05, 0, 0, 0.1, 0.1, 0.05)
se.mean <- rep(0.1, 7)
##
study <- paste("study", c(1:4, 5, 5, 5))
#
dat <- data.frame(mean, se.mean, t1, t2, study,
                  stringsAsFactors = FALSE)
#
trts <- c("A", "A + B", "A + C", "A + D",
          "B", "B + C", "C", "D", "E", "F")
#
comps <- LETTERS[1:6]


# Use netconnection() to display network information
#
netconnection(t1, t2, study)


dc1 <- discomb(mean, se.mean, t1, t2, study, seq = trts)
dc1

forest(dc1, ref = "F")


# Define C matrix manually (which will produce the same results)
#
C <- rbind(c(1, 0, 0, 0, 0, 0),  # A
           c(1, 1, 0, 0, 0, 0),  # A + B
           c(1, 0, 1, 0, 0, 0),  # A + C
           c(1, 0, 0, 1, 0, 0),  # A + D
           c(0, 1, 0, 0, 0, 0),  # B
           c(0, 1, 1, 0, 0, 0),  # B + C
           c(0, 0, 1, 0, 0, 0),  # C
           c(0, 0, 0, 1, 0, 0),  # D
           c(0, 0, 0, 0, 1, 0),  # E
           c(0, 0, 0, 0, 0, 1))  # F
#                  
colnames(C) <- comps
rownames(C) <- trts
#
dc2 <- discomb(mean, se.mean, t1, t2, study, seq = trts,
               C.matrix = C)
#
# Compare C matrices
#
all.equal(dc1$C.matrix, dc2$C.matrix)



