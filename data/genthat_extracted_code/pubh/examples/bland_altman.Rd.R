library(pubh)


### Name: bland_altman
### Title: Bland-Altman agreement plots.
### Aliases: bland_altman

### ** Examples

data(wright, package = "ISwR")
bland_altman(mini.wright ~ std.wright, data = wright, pch = 16)
bland_altman(mini.wright ~ std.wright, data = wright, pch = 16,
             ylab = "Large-mini expiratory flow rate (l/min)",
             xlab = "Mean expiratory flow rate (l/min)")



