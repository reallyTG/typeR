library(biogram)


### Name: calc_si
### Title: Compute similarity index
### Aliases: calc_si

### ** Examples

# example from Stephenson & Freeland, 2013 (Fig. 6)
enc1 <- list(`1` = "A",
             `2` = c("F", "E"),
             `3` = c("C", "D", "G"))

enc2 <- list(`1` = c("A", "G"),
             `2` = c("C", "D", "E", "F"))

enc3 <- list(`1` = c("D", "G"),
             `2` = c("E", "F"),
             `3` = c("A", "C"))
             
calc_si(enc1, enc2)
calc_si(enc2, enc3)
calc_si(enc1, enc3)



