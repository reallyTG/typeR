library(s20x)


### Name: rowdistr
### Title: Row distributions from a cross-tabulation of two variables
### Aliases: rowdistr
### Keywords: htest

### ** Examples


data(body.df)
z = crosstabs(~ ethnicity + married, data = body.df)
rowdistr(z)
rowdistr(z, comp='between')
rowdistr(z, comp='within')


##from matrix of counts
z = matrix(c(4,3,2,6,47,20,40,62,11,8,7,22,3,0,1,10), 4, 4)
rowdistr(z)



