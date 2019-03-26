library(randomizr)


### Name: conduct_ra
### Title: Conduct a random assignment
### Aliases: conduct_ra

### ** Examples

declaration <- declare_ra(N = 100, m_each = c(30, 30, 40))
Z <- conduct_ra(declaration = declaration)
table(Z)

# equivalent to

Z <- conduct_ra(N = 100, m_each = c(30, 30, 40))
table(Z)




