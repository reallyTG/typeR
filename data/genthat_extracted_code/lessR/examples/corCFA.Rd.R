library(lessR)


### Name: corCFA
### Title: Confirmatory Factor Analysis of a Multiple Indicator Measurement
###   Model
### Aliases: corCFA cfa scales
### Keywords: correlation factor analysis

### ** Examples

# perfect input correlation matrix for two-factor model
# Population Factor Pattern of the 3 items for each respective
#   Factor: 0.8, 0.6, 0.4
# Population Factor-Factor correlation: 0.3
mycor <- matrix(nrow=6, ncol=6, byrow=TRUE,
c(1.000,0.480,0.320,0.192,0.144,0.096,
  0.480,1.000,0.240,0.144,0.108,0.072,
  0.320,0.240,1.000,0.096,0.072,0.048,
  0.192,0.144,0.096,1.000,0.480,0.320,
  0.144,0.108,0.072,0.480,1.000,0.240,
  0.096,0.072,0.048,0.320,0.240,1.000))
colnames(mycor) <- c("X1", "X2", "X3", "X4", "X5", "X6")
rownames(mycor) <- colnames(mycor)

# the confirmatory factor analysis
# first three variables with first factor, last three with second
# default correlation matrix is mycor
MeasModel <- 
" 
   First =~ X1 + X2 + X3 
   Second =~ X4 + X5 + X6
"
c <- cfa(MeasModel)

# access the solution directly by saving to an object called fit
cfa(MeasModel)
fit <- cfa(MeasModel)
fit
# get the pattern coefficients from the communalities
lambda <- sqrt(fit$diag.cor)
lambda

# alternative specification described in Gerbing(2014),
#   retained to be consistent with that description
# can specify the items with a colon and with commas
# abbreviated form of function name: cfa
cfa(F1=c(X4,X5,X6), F2=X1:X3)

# component analysis, show observed scale correlations
scales(F1=X1:X3, F2=X4:X6)

# produce a gray scale heat map of the item correlations
#   with communalities in the diagonal
# all subsequent graphics are in gray scale until changed
style("gray")
corCFA(F1=X1:X3, F2=X4:X6)

# access the lessR data set called datMach4, with variable labels
d <- Read("Mach4", in.lessR=TRUE, quiet=TRUE)
# calculate the correlations and store in mycor
mycor <- cr(m01:m20)
# specify measurement model in Lavaan notation
MeasModel <- 
" 
   Deceit =~ m07 + m06 + m10 + m09 
   Trust =~ m12 + m05 + m13 + m01 
   Cynicism =~ m11 + m16 + m04 
   Flattery =~ m15 + m02 
"
# confirmatory factor analysis of 4-factor solution of Mach IV scale
# Hunter, Gerbing and Boster (1982)
# generate R Markdown instructions with the option: Rmd
# Output file will be m4.Rmd, a simple text file that can
#   be edited with any text editor including RStudio, from which it
#   can be knit to generate dynamic output such as to a Word document
c <- cfa(MeasModel, Rmd="m4")
# view all the output
c
# view just the scale reliabilities
c$out_reliability

# analysis of item content only
cfa(MeasModel, data=d, labels="only")


# bad fitting model to illustrate indicator diagnostics
mycor <- corReflect(vars=c(m20))
MeasModel <- 
" 
   F1 =~ m06 + m09 + m19
   F2 =~ m07
   F3 =~ m04 + m11 + m16 
   F4 =~ m15 + m12 + m20 + m18 
"
cfa(MeasModel)



