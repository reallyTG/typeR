library(huxtable)


### Name: print_latex
### Title: Create LaTeX representing a huxtable
### Aliases: print_latex to_latex to_latex.huxtable

### ** Examples

ht <- huxtable(
        a = 1:3,
        b = letters[1:3]
      )
print_latex(ht)



