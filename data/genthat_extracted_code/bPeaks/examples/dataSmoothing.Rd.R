library(bPeaks)


### Name: dataSmoothing
### Title: Function to smooth sequencing coverage along a chromosome
### Aliases: dataSmoothing
### Keywords: moving average signal smoothing

### ** Examples

# get data
data(dataPDR1)

# inital IP signal
iniIPsignal = dataPDR1$IPdata[,3]

par(mfrow = c(2,2))

# plot initial IP signal
plot(iniIPsignal[416900:417400], type = "h", 
    xlab = "genomic position", ylab = "sequencing coverage",
    main = "IP sample (PDR1 data)\nno smoothing", 
    col = "red")

# calculate and plot smoothed signal (widthValue = 5)
smoothedIPsignal = dataSmoothing(vecData = iniIPsignal, widthValue = 5)
plot(smoothedIPsignal[416900:417400], type = "h", 
    xlab = "genomic position", ylab = "sequencing coverage",
    main = "IP sample (PDR1 data)\nsmoothing (widthValue = 5)", 
    col = "pink")

# calculate and plot smoothed signal (widthValue = 10)
smoothedIPsignal = dataSmoothing(vecData = iniIPsignal, widthValue = 10)
plot(smoothedIPsignal[416900:417400], type = "h", 
    xlab = "genomic position", ylab = "sequencing coverage",
    main = "IP sample (PDR1 data)\nsmoothing (widthValue = 10)", 
    col = "pink")

# calculate and plot smoothed signal (widthValue = 20)
smoothedIPsignal = dataSmoothing(vecData = iniIPsignal, widthValue = 20)
plot(smoothedIPsignal[416900:417400], type = "h", 
    xlab = "genomic position", ylab = "sequencing coverage",
    main = "IP sample (PDR1 data)\nsmoothing (widthValue = 20)", 
    col = "pink")



