library(Anthropometry)


### Name: plotTrimmOutl
### Title: Trimmed or outlier observations representation
### Aliases: plotTrimmOutl
### Keywords: dplot

### ** Examples

#TRIMOWA ALGORITHM:
dataTrimowa <- sampleSpanishSurvey
numVar <- dim(dataTrimowa)[2]
bust <- dataTrimowa$bust
bustSizes <- bustSizesStandard(seq(74, 102, 4), seq(107, 131, 6))

orness <- 0.7
weightsTrimowa <- weightsMixtureUB(orness, numVar)

numClust <- 3 ; alpha <- 0.01 ; niter <- 10 ; algSteps <- 7
ah <- c(23, 28, 20, 25, 25)

set.seed(2014)
numSizes <- 2
res_trimowa <- computSizesTrimowa(dataTrimowa, bust, bustSizes$bustCirc, numSizes,
                                  weightsTrimowa, numClust, alpha, niter, algSteps, 
                                  ah, FALSE)

prototypes <- anthrCases(res_trimowa, numSizes)
trimmed <- trimmOutl(res_trimowa, numSizes)

bustVariable <- "bust"
xlim <- c(72, 132)
color <- c("black", "red", "green", "blue", "cyan", "brown", "gray",
           "deeppink3", "orange", "springgreen4", "khaki3", "steelblue1")

variable <- "chest"
range(dataTrimowa[,variable])
#[1] 76.7755 135.8580
ylim <- c(70,140)
main <- "Trimmed women \n bust vs chest"

plotTrimmOutl(dataTrimowa, trimmed, numSizes, bustVariable, variable, color, 
              xlim, ylim, main)

#For other plots and an example for the hipam algorithm, 
#see www.uv.es/vivigui/softw/more_examples.R 



