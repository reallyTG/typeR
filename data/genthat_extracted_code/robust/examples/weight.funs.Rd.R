library(robust)


### Name: weight.funs
### Title: Weight Functions Psi, Rho, Chi
### Aliases: psi.weight rho.weight psp.weight chi.weight
### Keywords: robust

### ** Examples

x <- seq(-4,4, length=401)
f.x <- cbind(psi = psi.weight(x), psp = psp.weight(x),
             chi = chi.weight(x), rho = rho.weight(x))
es <- expression(psi(x), {psi*minute}(x), chi(x), rho(x))
leg <- as.expression(lapply(seq_along(es), function(i)
          substitute(C == E, list(C=colnames(f.x)[i], E=es[[i]]))))
matplot(x, f.x, type = "l", lwd = 1.5,
        main = "psi.weight(.) etc -- 'optimal'")
abline(h = 0, v = 0, lwd = 2, col = "#D3D3D380") # opaque gray
legend("bottom", leg, inset = .01,
       lty = 1:4, col = 1:4, lwd = 1.5, bg = "#FFFFFFC0")



