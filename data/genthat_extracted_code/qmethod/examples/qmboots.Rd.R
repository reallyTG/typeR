library(qmethod)


### Name: qmboots
### Title: Q Methodology: Bootstrap
### Aliases: qmboots
### Keywords: multivariate Q methodology bootstrapping PCA

### ** Examples

data(lipset)
boots <- qmboots(lipset[[1]], nfactors = 3, nsteps = 10, load = "auto",
           rotation = "varimax", indet = "qindtest",
           fsi = TRUE)
boots
boxplot(t(boots[[2]][[1]][[2]]), horizontal = TRUE, 
main = "Statement z-score boxplot for the first factor", las = 1)

#See the table summaries:
qms <- qmb.summary(boots)
round(qms$statements, digits=2) # statements
round(qms$qsorts, digits=2)     # Q-sorts

# A more synthetic visualisation:
# z-scores:
qmb.plot(qms, nfactors=3, type="zsc", sort="difference")
# factor loadings:
qmb.plot(qms, nfactors=3, type="loa", sort="difference")





