library(LncMod)


### Name: tri.surv
### Title: Survival Analysis of Triplets
### Aliases: tri.surv
### Keywords: tri.surv

### ** Examples

#a triplet
tri.surv(tri=datatests[["tri_bs"]],exp.sur=datatests[["exp_sur"]],
         train=datatests[["train"]],test=datatests[["test"]])
#two triplets(or more)
tri.surv(tri=datatests[["tri_bs"]],exp.sur=datatests[["exp_sur"]],
         train=datatests[["train"]],test=datatests[["test"]],
		 index=c(1,2))



