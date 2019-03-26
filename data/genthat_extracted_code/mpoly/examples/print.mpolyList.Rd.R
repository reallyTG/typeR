library(mpoly)


### Name: print.mpolyList
### Title: Pretty printing of a list of multivariate polynomials.
### Aliases: print.mpolyList

### ** Examples


mL <- mp(c('x + 1', 'y - 1', 'x y^2 z  +  x^2 z^2  +  z^2  +  x^3'))
mL

ps <- print(mL, silent = TRUE)
ps

print(mL, order = 'lex')
print(mL, order = 'glex')
print(mL, order = 'grlex')
print(mL, order = 'glex', varorder = c('z','y','x'))
print(mL, order = 'grlex', varorder = c('z','y','x'))
print(mL, varorder = c('z','y','x'))
s <- print(mL, varorder = c('z','y','x'))
str(s)




