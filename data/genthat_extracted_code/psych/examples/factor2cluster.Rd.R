library(psych)


### Name: factor2cluster
### Title: Extract cluster definitions from factor loadings
### Aliases: factor2cluster
### Keywords: multivariate models

### ** Examples


## Not run: 
##D f  <- factanal(x,4,covmat=Harman74.cor$cov)
##D factor2cluster(f) 
## End(Not run)
#                       Factor1 Factor2 Factor3 Factor4
#VisualPerception             0       1       0       0
#Cubes                        0       1       0       0
#PaperFormBoard               0       1       0       0
#Flags                        0       1       0       0
#GeneralInformation           1       0       0       0
#PargraphComprehension        1       0       0       0
#SentenceCompletion           1       0       0       0
#WordClassification           1       0       0       0
#WordMeaning                  1       0       0       0
#Addition                     0       0       1       0
#Code                         0       0       1       0
#CountingDots                 0       0       1       0
#StraightCurvedCapitals       0       0       1       0
#WordRecognition              0       0       0       1
#NumberRecognition            0       0       0       1
#FigureRecognition            0       0       0       1
#ObjectNumber                 0       0       0       1
#NumberFigure                 0       0       0       1
#FigureWord                   0       0       0       1
#Deduction                    0       1       0       0
#NumericalPuzzles             0       0       1       0
#ProblemReasoning             0       1       0       0
#SeriesCompletion             0       1       0       0
#ArithmeticProblems           0       0       1       0








