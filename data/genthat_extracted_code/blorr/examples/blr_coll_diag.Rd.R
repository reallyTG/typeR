library(blorr)


### Name: blr_coll_diag
### Title: Collinearity diagnostics
### Aliases: blr_coll_diag blr_vif_tol blr_eigen_cindex

### ** Examples

# model
model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

# vif and tolerance
blr_vif_tol(model)

# eigenvalues and condition indices
blr_eigen_cindex(model)

# collinearity diagnostics
blr_coll_diag(model)




