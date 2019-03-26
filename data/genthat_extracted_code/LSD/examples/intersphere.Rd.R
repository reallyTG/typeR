library(LSD)


### Name: intersphere
### Title: Intersphere: a fancy Venn diagram
### Aliases: LSD.intersphere intersphere
### Keywords: Venn intersphere,

### ** Examples

data = list(
	"A" = sample(1:200,100),
	"B" = sample(1:200,150),
	"C" = sample(1:200,50))

intersphere(data,colors = c("orange","skyblue","green"))

data = list(
	"A" = sample(1:200,100),
	"B" = sample(1:200,150),
	"C" = sample(1:200,50),
	"D" = sample(1:200,75))

colors = c("orange","skyblue","green","purple")
intersphere(data,colors,expand.circles = 0.5,expand.lims = 0.5)



