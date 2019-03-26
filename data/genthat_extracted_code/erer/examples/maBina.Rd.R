library(erer)


### Name: maBina
### Title: Marginal Effect for Binary Probit and Logit Model
### Aliases: maBina print.maBina
### Keywords: regression

### ** Examples

data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
    
ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE)
eb <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE, 
  subset.name = "psi", subset.value = 0) 
ec <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE,
  subset.name = "psi", subset.value = 1)
ea; eb; ec
eb$x; ec$x



