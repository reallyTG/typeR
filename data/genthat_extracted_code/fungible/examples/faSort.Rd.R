library(fungible)


### Name: faSort
### Title: Sort a factor loadings matrix
### Aliases: faSort
### Keywords: Statstics

### ** Examples

set.seed(123)
F <- matrix( c( .5,  0, 
                .6,  0,
                 0, .6,
                .6,  0,
                 0, .5,
                .7,  0,
                 0, .7,
                 0, .6), nrow = 8, ncol = 2, byrow=TRUE)

Rex1 <- F %*% t(F); diag(Rex1) <- 1

Items <- c("1. I am often tense.\n",
           "2. I feel anxious much of the time.\n",
           "3. I am a naturally curious individual.\n",
           "4. I have many fears.\n",
           "5. I read many books each year.\n",
           "6. My hands perspire easily.\n",
           "7. I have many interests.\n",
           "8. I enjoy learning new words.\n")

exampleOut <- fals(R = Rex1, nfactors = 2)

# Varimax rotation
Fload <- varimax(exampleOut$loadings)$loadings[]

# Add some row labels
rownames(Fload) <- paste0("V", 1:nrow(Fload))

cat("\nUnsorted fator loadings\n")
print(round( Fload, 2) )

# Sort items and reflect factors
out1 <- faSort(fmat = Fload, 
               salient = .25, 
               reflect = TRUE)
               
FloadSorted <- out1$loadings

cat("\nSorted fator loadings\n")
print(round( FloadSorted, 2) )

# Print sorted items
cat("\n Items sorted by Factor\n")
cat("\n",Items[out1$sortOrder])



