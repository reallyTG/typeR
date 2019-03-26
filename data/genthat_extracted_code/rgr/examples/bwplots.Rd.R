library(rgr)


### Name: bwplots
### Title: Plot Vertical Box-and-Whisker Plots
### Aliases: bwplots
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## Display a simple box-and-whisker plot
bwplots(Cu, by = COUNTRY)
bwplots(split(Cu,COUNTRY))

## Display a more appropriately labelled and scaled box-and-whisker plot
bwplots(Cu, by = COUNTRY, log = TRUE, xlab = "Country", 
	ylab = "Cu (mg/kg) in <2 mm C-horizon soil")

## Display a west-to-east re-ordered plot using the full country names
bwplots(split(Cu, COUNTRY), log = TRUE,
	ylab = "Cu (mg/kg) in <2 mm C-horizon soil", 
	label = c("Finland", "Norway", "Russia"), 
	plot.order = c(2, 1, 3))

## Detach test data
detach(kola.c)

## Make test data kola.o available, setting a -9999, indicating a
## missing pH measurement, to NA
data(kola.o)
kola.o.fixed <- ltdl.fix.df(kola.o, coded = -9999)
attach(kola.o.fixed)

## Display relationship between pH in one pH unit intervals and Cu in 
## O-horizon (humus) soil, extending the whiskers to the 2nd and 98th
## percentiles
bwplots(split(Cu,trunc(pH+0.5)), log = TRUE, wend = 0.02, 
	xlab = "O-horizon soil pH to the nearest pH unit",
	ylab = "Cu (mg/kg) in <2 mm Kola O-horizon soil")

## As above, but demonstrating the use of variable box widths and the
## suppression of 95% confidence interval notches.  The box widths are
## computed as (Log10(n)+0.1)/5, the 0.1 is added as one subset has a
## population of 1.  Note: paste is used in constructing xlab, below,
## as the label is long and overflows the text line length
table(trunc(pH+0.5))
bwplots(split(Cu,trunc(pH+0.5)), log=TRUE, wend = 0.02, notch = FALSE,
	xlab = paste("O-horizon soil pH to the nearest pH unit,",
	"\nbox widths proportional to Log(subset_size)"),
	ylab = "Cu (mg/kg) in <2 mm Kola O-horizon soil",
	width = c(0.26, 0.58, 0.24, 0.02))


## Detach test data
detach(kola.o.fixed)



