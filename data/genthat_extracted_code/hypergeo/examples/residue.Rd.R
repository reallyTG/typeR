library(hypergeo)


### Name: residue
### Title: Evaluation of the hypergeometric function using the residue
###   theorem
### Aliases: hypergeo_residue hypergeo_residue_general
###   hypergeo_residue_close_to_crit_single
###   hypergeo_residue_close_to_crit_multiple
### Keywords: math

### ** Examples

c1 <- 1/2-sqrt(3)/2i
c2 <- 1/2+sqrt(3)/2i

a1_R <- hypergeo(1/2,1/3,pi,c1)
a1_M <- 1.0154051314906669 + 0.0544835896509068i

x <- y <- seq(from=-0.1,to=0.1,len=100)
elliptic::view(x,y,hypergeo(1/2,1,1/3,outer(x,1i*y,"+")))




