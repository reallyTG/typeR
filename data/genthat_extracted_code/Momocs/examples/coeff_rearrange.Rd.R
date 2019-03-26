library(Momocs)


### Name: coeff_rearrange
### Title: Rearrange a matrix of (typically Fourier) coefficients
### Aliases: coeff_rearrange

### ** Examples

m_name <- m_rank <- matrix(1:32, 2, 16)
# this one is ordered by name
colnames(m_name) <- paste0(rep(letters[1:4], each=4), 1:4)
# this one is ordered by rank
colnames(m_rank) <- paste0(letters[1:4], rep(1:4, each=4))

m_rank
m_rank %>% coeff_rearrange(by="name")
m_rank %>% coeff_rearrange(by="rank") #no change

m_name
m_name %>% coeff_rearrange(by="name") # no change
m_name %>% coeff_rearrange(by="rank")



