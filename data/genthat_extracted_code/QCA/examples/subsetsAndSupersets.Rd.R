library(QCA)


### Name: superSubset, findSubsets, findSupersets
### Title: Functions to find subsets or supersets
### Aliases: superSubset findSubsets findSupersets
### Keywords: functions

### ** Examples

    
# Lipset binary crisp sets
data(LC)
ssLC <- superSubset(LC, "SURV")

require(venn)
x = list("SURV" = which(LC$SURV == 1),
         "STB" = which(ssLC$coms[, 1] == 1),
         "LIT" = which(ssLC$coms[, 2] == 1))
venn(x, cexil = 0.7)

# Lipset multi-value sets
data(LM)
superSubset(LM, "SURV")

# Cebotari & Vink (2013) fuzzy data
data(CVF)

# all necessary combinations with at least 0.9 inclusion and 0.6 coverage cut-offs
ssCVF <- superSubset(CVF, outcome = "PROTEST", incl.cut = 0.90, cov.cut = 0.6)
ssCVF

# the membership scores for the first minimal combination (GEOCON)
ssCVF$coms$GEOCON

# same restrictions, for the negation of the outcome
superSubset(CVF, outcome = "~PROTEST", incl.cut = 0.90, cov.cut = 0.6)

# to find supersets or supersets, a hypothetical example using
# three binary causal conditions, having two levels each: 0 and 1
noflevels <- c(2, 2, 2)

# second row of the implicant matrix: 0 0 1
# which in the "normal" base is:      - - 0
# the prime implicant being: ~C
(sub <- findSubsets(input = 2, noflevels + 1))
#  5  8 11 14 17 20 23 26 


getRow(sub, noflevels + 1)

# implicant matrix   normal values
#      A  B  C    |       A  B  C       
#   5  0  1  1    |    5  -  0  0      bc    
#   8  0  2  1    |    8  -  1  0      Bc
#  11  1  0  1    |   11  0  -  0      ac
#  14  1  1  1    |   14  0  0  0      abc
#  17  1  2  1    |   17  0  1  0      aBc
#  20  2  0  1    |   20  1  -  0      Ac
#  23  2  1  1    |   23  1  0  0      Abc               
#  26  2  2  1    |   26  1  1  0      ABc 


# stopping at maximum row number 20
findSubsets(input = 2, noflevels + 1, stop = 20)
#  5  8 11 14 17 20


# -----
# for supersets
findSupersets(input = 14, noflevels + 1)
#  2  4  5 10 11 13 14

findSupersets(input = 17, noflevels + 1)
#  2  7  8 10 11 16 17

# input as a matrix
(im <- getRow(c(14, 17), noflevels + 1))

# implicant matrix   normal values
#  14  1  1  1    |   14  0  0  0       abc
#  17  1  2  1    |   17  0  1  0       aBc


sup <- findSupersets(input = im, noflevels + 1)
sup
#  2  4  5  7  8 10 11 13 14 16 17


getRow(sup, noflevels + 1)

# implicant matrix   normal values
#      A  B  C    |       A  B  C       
#   2  0  0  1    |    2  -  -  0       c      
#   4  0  1  0    |    4  -  0  -       b
#   5  0  1  1    |    5  -  0  0       bc
#   7  0  2  0    |    7  -  1  -       B
#   8  0  2  1    |    8  -  1  0       Bc
#  10  1  0  0    |   10  0  -  -       a  
#  11  1  0  1    |   11  0  -  0       ac                 
#  13  1  1  0    |   13  0  0  -       ab   
#  14  1  1  1    |   14  0  0  0       abc
#  16  1  2  0    |   16  0  1  -       aB
#  17  1  2  1    |   17  0  1  0       aBc
                             



