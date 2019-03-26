library(mldr)


### Name: [.mldr
### Title: Filter rows in a'mldr' returning a new 'mldr'
### Aliases: [.mldr

### ** Examples


library(mldr)

highlycoupled <- genbase[.SCUMBLE > 0.05] # Select instances with highly imbalanced coupled labels
summary(highlycoupled)   # Compare the selected instances
summary(genbase)         # with the traits of the original MLD




