library(covatest)


### Name: setzero
### Title: setzero
### Aliases: setzero setzero,couples-method setzero,ANY,ANY-method

### ** Examples

sel.staz.sym <- c("DERP016", "DENW065", "DEHE051", "DETH026", "DENW063", "DENI019",
"DENW068", "DEHE046", "DEUB029", "DEBY047", "DETH061", "DESN049")

sp.couples.in.sym <- matrix(data = c("DERP016", "DENW065", "DEHE051", "DETH026",
"DENW063", "DENI019", "DENW068", "DEHE046", "DEUB029", "DEBY047", "DETH061", "DESN049"),
ncol = 2, byrow = TRUE)

t.couples.in.sym <- c(1, 2)

couples.sym <- couples(sel.staz = sel.staz.sym, sp.couples.in = sp.couples.in.sym,
t.couples.in = t.couples.in.sym, typetest = "sym", typecode = character())

zero.index <- matrix(data=c(1,3,1,4,2,5,2,6), ncol=2, byrow = TRUE)

setzero(couples.sym, zero = FALSE, index = zero.index, value = 0)




