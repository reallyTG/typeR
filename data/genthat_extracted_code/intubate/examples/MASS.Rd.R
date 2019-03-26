library(intubate)


### Name: MASS
### Title: Interfaces for MASS package for data science pipelines.
### Aliases: ntbt_corresp ntbt_glm.nb ntbt_lda ntbt_lm.gls ntbt_lm.ridge
###   ntbt_loglm ntbt_logtrans ntbt_polr ntbt_qda ntbt_rlm
### Keywords: intubate magrittr MASS corresp glm.nb lda lm.ridge loglm polr
###   qda rlm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(MASS)
##D 
##D ## corresp
##D ## Original function to interface
##D corresp(~ Age + Eth, data = quine)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_corresp(data = quine, ~ Age + Eth)
##D 
##D ## so it can be used easily in a pipeline.
##D quine %>%
##D   ntbt_corresp(~ Age + Eth)
##D   
##D ## glm.nb
##D ## Original function to interface
##D glm.nb(Days ~ Sex/(Age + Eth*Lrn), data = quine)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_glm.nb(data = quine, Days ~ Sex/(Age + Eth*Lrn))
##D 
##D ## so it can be used easily in a pipeline.
##D quine %>%
##D   ntbt_glm.nb(Days ~ Sex/(Age + Eth*Lrn))
##D 
##D ## lda
##D Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
##D                    Sp = rep(c("s","c","v"), rep(50,3)))
##D 
##D ## Original function to interface
##D lda(Sp ~ ., Iris)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lda(Iris, Sp ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D Iris %>%
##D   ntbt_lda(Sp ~ .)
##D 
##D stackloss %>%
##D   ntbt_lda(stack.loss ~ .) %>%
##D   summary()
##D 
##D ## lm.gls
##D ## Original function to interface
##D lm.gls(conc ~ uptake, CO2, W = diag(nrow(CO2)))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lm.gls(CO2, conc ~ uptake, W = diag(nrow(CO2)))
##D 
##D ## so it can be used easily in a pipeline.
##D CO2 %>%
##D   ntbt_lm.gls(conc ~ uptake, W = diag(nrow(CO2)))
##D 
##D ## lm.ridge
##D ## Original function to interface
##D lm.ridge(GNP.deflator ~ ., longley)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lm.ridge(longley, GNP.deflator ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D longley %>%
##D   ntbt_lm.ridge(GNP.deflator ~ .)
##D 
##D ## loglm
##D ## Original function to interface
##D xtCars93 <- xtabs(~ Type + Origin, Cars93)
##D loglm(~ Type + Origin, xtCars93)
##D 
##D ## The interface reverses the order of data and formula
##D xtCars93 <- ntbt_xtabs(Cars93, ~ Type + Origin)
##D ntbt_loglm(xtCars93, ~ Type + Origin)
##D 
##D ## so it can be used easily in a pipeline.
##D Cars93 %>%
##D   ntbt_xtabs(~ Type + Origin) %>%
##D   ntbt_loglm(~ Type + Origin)
##D 
##D ## logtrans
##D ## Original function to interface
##D logtrans(Days ~ Age*Sex*Eth*Lrn, data = quine,
##D          alpha = seq(0.75, 6.5, len=20))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_logtrans(data = quine, Days ~ Age*Sex*Eth*Lrn,
##D               alpha = seq(0.75, 6.5, len=20))
##D 
##D ## so it can be used easily in a pipeline.
##D quine %>%
##D   ntbt_logtrans(Days ~ Age*Sex*Eth*Lrn,
##D                 alpha = seq(0.75, 6.5, len=20))
##D 
##D ## polr
##D op <- options(contrasts = c("contr.treatment", "contr.poly"))
##D 
##D ## Original function to interface
##D polr(Sat ~ Infl + Type + Cont, housing)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_polr(housing, Sat ~ Infl + Type + Cont)
##D 
##D ## so it can be used easily in a pipeline.
##D housing %>%
##D   ntbt_polr(Sat ~ Infl + Type + Cont)
##D 
##D options(op)
##D 
##D ## qda
##D set.seed(123) ## make reproducible
##D tr <- sample(1:50, 25)
##D 
##D iris3df <- data.frame(cl = factor(c(rep("s",25), rep("c",25), rep("v",25))),
##D                       train = rbind(iris3[tr,,1], iris3[tr,,2], iris3[tr,,3]))
##D 
##D ## Original function to interface
##D qda(cl ~ ., iris3df)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_qda(iris3df, cl ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris3df %>%
##D   ntbt_qda(cl ~ .)
##D 
##D ## rlm
##D ## Original function to interface
##D rlm(stack.loss ~ ., stackloss)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_rlm(stackloss, stack.loss ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D stackloss %>%
##D   ntbt_rlm(stack.loss ~ .) %>%
##D   summary()
##D   
##D stackloss %>%
##D   ntbt_rlm(stack.loss ~ ., psi = psi.hampel, init = "lts") %>%
##D   summary()
##D 
##D stackloss %>%
##D   ntbt_rlm(stack.loss ~ ., psi = psi.bisquare) %>%
##D   summary()
## End(Not run)



