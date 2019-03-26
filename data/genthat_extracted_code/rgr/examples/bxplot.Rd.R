library(rgr)


### Name: bxplot
### Title: Plot a Horizontal Boxplot or Box-and-Whisker Plot
### Aliases: bxplot
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Display a simple boxplot
bxplot(Cu)

## Display a more appropriately labelled and scaled boxplot
bxplot(Cu, xlab = "Cu (mg/kg) in <2 mm Kola O-horizon soil", log = TRUE)

## Display a box-and-whisker plot with whiskers ending at the 2nd and
## 98th percentiles
bxplot(Cu, xlab = "Cu (mg/kg) in <2 mm Kola O-horizon soil", ifbw = TRUE, 
	wend = 0.02, log = TRUE)

## Detach test data
detach(kola.o)



