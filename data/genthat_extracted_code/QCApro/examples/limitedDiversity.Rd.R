library(QCApro)


### Name: limitedDiversity
### Title: Analyze QCA Solution Behaviour under Limited Empirical Diversity
### Aliases: limitedDiversity
### Keywords: functions

### ** Examples

## Not run: 
##D # number (n) of minterms (mt) and levels (lv) for each factor (exogenous 
##D # and endogenous)
##D n.mt <- 2^5 
##D n.lv <- rep(2, 5) 
##D 
##D # expand to unevaluated truth table and assign case/factor labels
##D tt.unev <- data.frame(mintermMatrix(n.lv))
##D dimnames(tt.unev) <- list(1:n.mt, c(LETTERS[1:4], "Z"))
##D 
##D # cull rows from tt.unev that are compatible with aB + Bc + D <=> Z 
##D # to produce evaluated truth table tt.ev
##D tt.ev <- tt.unev[pmax(tt.unev$D, pmin(1 - tt.unev$A, tt.unev$B),
##D                  pmin(tt.unev$B, 1 - tt.unev$C)) == tt.unev$Z, ]
##D 
##D # conservative solutions for all 1-tuples (16)
##D limitedDiversity(tt.ev, outcome = "Z", sol.type = "cs")$model.shares
##D 
##D # using a truth table object of class 'tt' created by eQMC function
##D #------------------------------------------------------------------
##D data(d.represent)
##D tt <- truthTable(d.represent, outcome = "WNP")
##D 
##D # with objects of class 'tt', exogenous factors and the outcome need not be 
##D # specified again
##D limitedDiversity(tt)
##D 
##D # proof that the conservative/complex solution type of QCA is incorrect, 
##D # (see Baumgartner and Thiem (2017) for more details)
##D #-----------------------------------------------------------------------
##D 
##D # 1. build truth table on the basis of reference model aB + Bc + D
##D tt <- data.frame(mintermMatrix(rep(2, 5)))
##D dimnames(tt) <- list(as.character(1:32), c(LETTERS[1:4], "OUT"))
##D tt <- tt[pmax(pmin(1 - tt$A, tt$B), pmin(tt$B, 1 - tt$C), tt$D) == tt$OUT, ]
##D 
##D # 2. generate all conservative/complex solutions for all 16 + 120 scenarios 
##D # of one/two dropped minterm/s
##D sollist.cs <- vector("list", 2)
##D sollist.cs <- lapply(1:2, function (x) {
##D   limitedDiversity(tt, outcome = "OUT", sol.type = "cs", n.drop = x)
##D   }
##D )
##D 
##D # 3. compute in how many scenarios a correctness-preserving submodel of 
##D # the reference model was part of the solution (43.75% for one dropped 
##D # minterm and  16.67% for two dropped minterms)
##D cs.correct <- numeric(2)
##D cs.correct <- sapply(1:2, function (x) {round((sum(unlist(lapply(
##D   sollist.cs[[x]][[2]], function (y) {any(
##D     submodels("aB + Bc + D")$submodels %in% y)}
##D   ))) / choose(16, x))*100, 2)}
##D )
##D cs.correct
## End(Not run)



