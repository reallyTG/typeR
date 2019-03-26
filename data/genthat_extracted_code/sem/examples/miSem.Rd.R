library(sem)


### Name: miSem
### Title: Estimate a Structural Equation Model By Multiple Imputation
### Aliases: miSem miSem.semmod miSem.semmodList print.miSem summary.miSem
### Keywords: models

### ** Examples

    ## No test: 
mod.cfa.tests <- cfa(raw=TRUE, text="
verbal: x1, x2, x3
math: y1, y2, y3
")
imps <- miSem(mod.cfa.tests, data=Tests, fixed.x="Intercept", 
              raw=TRUE, seed=12345)
summary(imps, digits=3) 

library(MBESS) # for data
data(HS.data)

# introduce some missing data:
HS <- HS.data[, c(2,7:10,11:15,20:25,26:30)]
set.seed(12345)
r <- sample(301, 100, replace=TRUE)
c <- sample(2:21, 100, replace=TRUE)
for (i in 1:100) HS[r[i], c[i]] <- NA

mod.hs <- cfa(text="
spatial: visual, cubes, paper, flags
verbal: general, paragrap, sentence, wordc, wordm
memory: wordr, numberr, figurer, object, numberf, figurew
math: deduct, numeric, problemr, series, arithmet
")

mod.mg <- multigroupModel(mod.hs, groups=c("Female", "Male")) 
system.time( # relatively time-consuming!
  imps.mg <- miSem(mod.mg, data=HS, group="Gender", seed=12345)
)
summary(imps.mg, digits=3)
    
## End(No test)



