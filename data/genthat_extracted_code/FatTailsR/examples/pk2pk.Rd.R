library(FatTailsR)


### Name: pk2pk
### Title: Global Conversion Function Between Kiener Distribution
###   Parameters
### Aliases: pk2pk

### ** Examples


## Example 1
c2 <- c(1, 2, 3, 5)
pk2pk(c2, model = "K2", to = "K1") # loose the asymmetry.
pk2pk(c2, model = "K2", to = "K2")
pk2pk(c2, model = "K2", to = "K3")
pk2pk(c2, model = "K2", to = "K4")
pk2pk(c2, model = "K2", to = "K4")
(c7 <- pk2pk(c2, model = "K2", to = "K7", dgts = 3))
pk2pk(c7, model = "K7", to = "K2")

## Example 2 ("K2" to "K7")
(mat4 <- matrix( c(rep(0,9), rep(1,9), seq(0.5,4.5,0.5), seq(1,5,0.5)), 
         nrow = 4, byrow = TRUE, dimnames = list(c("m","g","a","w"), paste0("b",1:9))))
(mat7 <- round(apply(mat4, 2, pk2pk), 3))





