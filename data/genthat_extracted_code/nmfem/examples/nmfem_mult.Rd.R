library(nmfem)


### Name: nmfem_mult
### Title: NMF-EM algorithm for mixture of multinomials
### Aliases: nmfem_mult

### ** Examples


# Example on a data sample
x <- dplyr::sample_n(travelers[,-1],900)
out <- nmfem_mult(x, H = 4, K = 7)
# Display first cluster profile
display_profile(t((out$Theta %*% out$Lambda)[ ,1]))
# Display first word profile
display_profile(t(out$Theta[ ,1]), color = "Greens")

# Example on the complete data - it needs a few minutes to run
## Not run: 
##D nmfem_travelers <- nmfem_mult(travelers[ ,-1], H = 5, K = 10)
##D Theta <- nmfem_travelers$Theta
##D Lambda <- nmfem_travelers$Lambda
##D 
##D # Display first cluster profile
##D display_profile(t((Theta %*% Lambda)[ ,1]))
##D 
##D # Display first word profile
##D display_profile(t(Theta[ ,1]), color = "Greens")
## End(Not run)




