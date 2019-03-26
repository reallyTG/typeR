library(clinPK)


### Name: add_ruv
### Title: Add residual variability to data
### Aliases: add_ruv

### ** Examples

y <- pk_1cmt_inf()$y
y + add_ruv(y, list(prop = 0.1, add = 0.05))



