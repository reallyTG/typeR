library(LncMod)


### Name: tri.basic
### Title: Overview of Triplets' Expression
### Aliases: tri.basic
### Keywords: tri.basic

### ** Examples

#One triplet
tri.basic(tri=datatests[["tri_bs"]],M.exp=datatests[["M_exp"]],
          E.exp=datatests[["E_exp"]],T.exp=datatests[["T_exp"]])
#Two triplets (or more)
tri.basic(tri=datatests[["tri_bs"]],M.exp=datatests[["M_exp"]],
          E.exp=datatests[["E_exp"]],T.exp=datatests[["T_exp"]],
		  index=c(1,2))



