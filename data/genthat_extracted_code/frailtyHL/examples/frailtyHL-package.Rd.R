library(frailtyHL)


### Name: frailtyHL-package
### Title: H-likelihood Approach for Frailty Models
### Aliases: frailtyHL-package

### ** Examples

data(kidney)
kidney_g12<-frailtyHL(Surv(time,status)~sex+age+(1|id),kidney)



