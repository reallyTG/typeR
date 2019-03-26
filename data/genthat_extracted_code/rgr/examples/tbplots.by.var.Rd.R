library(rgr)


### Name: tbplots.by.var
### Title: Plot Vertical Tukey Boxplots for Variables
### Aliases: tbplots.by.var
### Keywords: hplot

### ** Examples

## Make test data kola.c available
data(kola.c)
attach(kola.c)

## Display a simple Tukey boxplot for measured variables
tbplots.by.var(cbind(Co,Cu,Ni))

## Display a more appropriately labelled and scaled Tukey boxplot
tbplots.by.var(cbind(Co,Cu,Ni), log = TRUE, logx = TRUE,
	ylab = "Contentrations (mg/kg) in <2 mm Kola C-horizon soil")

## Detach test data kola.c
detach(kola.c)

## Make test data ms.data1 available
data(ms.data1)

## Display variables in a data frame, remembering to omit the
## sample IDs
tbplots.by.var(ms.data1[, -1], log=TRUE, logx = TRUE)



