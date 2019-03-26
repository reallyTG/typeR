library(covatest)


### Name: couples-class
### Title: Class "couples"
### Aliases: couples-class couples show,couples-method [,couples-method
###   summary,couples-method

### ** Examples

sel.staz.sym <- c("DERP016", "DENW065", "DEHE051", "DETH026", "DENW063", "DENI019",
"DENW068", "DEHE046", "DEUB029", "DEBY047", "DETH061", "DESN049")

sp.couples.in.sym <- matrix(data = c("DERP016", "DENW065", "DEHE051", "DETH026",
"DENW063", "DENI019", "DENW068", "DEHE046", "DEUB029", "DEBY047", "DETH061", "DESN049"),
ncol = 2, byrow = TRUE)

t.couples.in.sym <- c(1, 2)

couples.sym <- couples(sel.staz = sel.staz.sym, sp.couples.in = sp.couples.in.sym,
t.couples.in = t.couples.in.sym, typetest = "sym", typecode = character())

### methods for couples
#1. show
couples.sym

#2. [ extract
couples.sym[3, by.row = FALSE]
couples.sym[3, by.row = TRUE]

#3. summary
summary(couples.sym)




