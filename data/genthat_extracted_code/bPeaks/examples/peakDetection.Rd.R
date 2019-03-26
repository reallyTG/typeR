library(bPeaks)


### Name: peakDetection
### Title: Peak calling method, i. e. identification of genomic regions
###   with a high density of sequences (reads)
### Aliases: peakDetection
### Keywords: peak calling ChIP-seq protein binding sites protein-DNA
###   interactions deep sequencing

### ** Examples

# get library
library(bPeaks)

# get PDR1 data
data(dataPDR1)

# combine IP and control data
allData = cbind(dataPDR1$IPdata, dataPDR1$controlData)
colnames(allData) = c("chr", "pos", "IPsignal", "chr", "pos", "controlSignal")

print("**********************************************")
# calculate baseline IP and control values
lineIP    = baseLineCalc(allData$IPsignal)
print(paste("Baseline coverage value in IP sample : ", round(lineIP, 3)))
lineControl = baseLineCalc(allData$controlSignal)
print(paste("Baseline coverage value in control sample : ", round(lineControl, 3)))
print("**********************************************")
print("")

# get list of chromosomes
chromNames = unique(allData[,1])

# start peak detection on the first chromosome
print("**********************************************")
print(paste("Starting analysis of chromosome ", chromNames[1]))

# information for one chromosome
subData = allData[allData[,1] == chromNames[1],]

# only 10 kb are analyzed here (as an illustration)
vecIP      = subData[40000:50000,3]
vecControl = subData[40000:50000,6]

# smooth of the data
smoothedIP    = dataSmoothing(vecData = vecIP, widthValue = 20) 
smoothedControl = dataSmoothing(vecData = vecControl, widthValue = 20) 

# peak detection
detectedPeaks = peakDetection(IPdata = smoothedIP, controlData = smoothedControl, 
                chrName = as.character(chromNames[1]), 
                windowSize = 150, windowOverlap = 50,
                outputName = paste("bPeaks_example_", chromNames[1], sep = ""), 
                baseLineIP = lineIP, baseLineControl = lineControl,
                IPthreshold = 4, controlThreshold = 2,
                ratioThreshold = 1, averageThreshold = 0.5,
                peakDrawing = TRUE)

# print detected genomic positions
print(detectedPeaks)



