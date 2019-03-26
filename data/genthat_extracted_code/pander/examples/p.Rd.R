library(pander)


### Name: p
### Title: Inline Printing
### Aliases: p

### ** Examples

p(c('fee', 'fi', 'foo', 'fam'))
# [1] '_fee_, _fi_, _foo_ and _fam_'
p(1:3, wrap = '')
# [1] '1, 2 and 3'
p(LETTERS[1:5], copula = 'and the letter')
# [1] '_A_, _B_, _C_, _D_ and the letter _E_'
p(c('Thelma', 'Louise'), wrap = '', copula = '&')
# [1] 'Thelma & Louise'



