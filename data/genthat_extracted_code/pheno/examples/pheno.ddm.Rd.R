library(pheno)


### Name: pheno.ddm
### Title: Dense design matrix for phenological data
### Aliases: pheno.ddm
### Keywords: robust design models

### ** Examples

	data(DWD)
	ddm1 <- pheno.ddm(DWD)
	attach(DWD)
	y <- factor(DWD[[2]])
	s <- factor(DWD[[3]])
	ddm2 <- as.matrix.csr(model.matrix(~ y + s -1, contrasts=list(s=("contr.sum"))))
	identical(ddm1$ddm,ddm2)



