library(semPlot)


### Name: semSyntax
### Title: Produce model syntax for various SEM software
### Aliases: semSyntax

### ** Examples

# MIMIC model, example 5.8 from mplus user guide:
Data <- read.table("http://www.statmodel.com/usersguide/chap5/ex5.8.dat")
names(Data) <- c(paste("y", 1:6, sep=""),
                 paste("x", 1:3, sep=""))

# Data <- Data[,c(7:9,1:6)]

# Model:
model.Lavaan <- 'f1 =~ y1 + y2 + y3
f2 =~ y4 + y5 + y6
f1 + f2 ~ x1 + x2 + x3 '

# Run Lavaan:
library("lavaan")
fit.Lavaan <- lavaan:::cfa(model.Lavaan, data=Data, std.lv=TRUE)

# Obtain Lavaan syntax:
model.Lavaan2 <- semSyntax(fit.Lavaan, "lavaan")

# Run Lavaan again:
fit.Lavaan2 <- lavaan:::lavaan(model.Lavaan2, data=Data)

# Compare models:
layout(t(1:2))
semPaths(fit.Lavaan,"std",title=FALSE)
title("Lavaan model 1",line=3)
semPaths(fit.Lavaan2, "std",title=FALSE)
title("Lavaan model 2",line=3)

# Convert to sem model:
model.sem <- semSyntax(fit.Lavaan, "sem")

# Run sem:
library("sem")
fit.sem <- sem:::sem(model.sem, data = Data)

# Compare models:
layout(t(1:2))
semPaths(fit.Lavaan,"std",title=FALSE)
title("Lavaan",line=3)
semPaths(fit.sem, "std",title=FALSE)
title("sem",line=3)



