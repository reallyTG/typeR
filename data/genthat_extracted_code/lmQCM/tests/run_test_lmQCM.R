library(lmQCM)
library(Biobase)
data(sample.ExpressionSet)
data = assayData(sample.ExpressionSet)$exprs
lmQCM(data)
