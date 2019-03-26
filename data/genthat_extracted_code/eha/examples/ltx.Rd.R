library(eha)


### Name: ltx
### Title: LaTeX printing of coxreg results.
### Aliases: ltx
### Keywords: printing

### ** Examples


data(oldmort)
fit <- coxreg(Surv(enter, exit, event) ~ civ + sex, data = oldmort)
dr <- drop1(fit, test = "Chisq")
ltx(fit, dr = dr, caption = "A test example.", label = "tab:test1") 




