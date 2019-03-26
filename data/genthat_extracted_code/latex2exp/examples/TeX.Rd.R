library(latex2exp)


### Name: TeX
### Title: Converts a LaTeX string to a 'plotmath' expression.
### Aliases: TeX

### ** Examples

TeX("$\\alpha$")
TeX("The ratio of 1 and 2 is $\\frac{1}{2}$")

a <- 1:100
plot(a, a^2, xlab=TeX("$\\alpha$"), ylab=TeX("$\\alpha^2$"))



