library(vcfR)


### Name: freq_peak
### Title: freq_peak
### Aliases: freq_peak

### ** Examples

data(vcfR_example)
gt <- extract.gt(vcf)
hets <- is_het(gt)
# Censor non-heterozygous positions.
is.na(vcf@gt[,-1][!hets]) <- TRUE
# Extract allele depths.
ad <- extract.gt(vcf, element = "AD")
ad1 <- masplit(ad, record = 1)
ad2 <- masplit(ad, record = 2)
freq1 <- ad1/(ad1+ad2)
freq2 <- ad2/(ad1+ad2)
myPeaks1 <- freq_peak(freq1, getPOS(vcf))
is.na(myPeaks1$peaks[myPeaks1$counts < 20]) <- TRUE
myPeaks2 <- freq_peak(freq2, getPOS(vcf), lhs = FALSE)
is.na(myPeaks2$peaks[myPeaks2$counts < 20]) <- TRUE
myPeaks1

# Visualize
mySample <- "P17777us22"
myWin <- 2
hist(freq1[myPeaks1$wins[myWin,'START_row']:myPeaks1$wins[myWin,'END_row'], mySample], 
     breaks=seq(0,1,by=0.02), col="#A6CEE3", main="", xlab="", xaxt="n")
hist(freq2[myPeaks2$wins[myWin,'START_row']:myPeaks2$wins[myWin,'END_row'], mySample], 
     breaks=seq(0,1,by=0.02), col="#1F78B4", main="", xlab="", xaxt="n", add = TRUE)
axis(side=1, at=c(0,0.25,0.333,0.5,0.666,0.75,1), 
     labels=c(0,'1/4','1/3','1/2','2/3','3/4',1), las=3)
abline(v=myPeaks1$peaks[myWin,mySample], col=2, lwd=2)
abline(v=myPeaks2$peaks[myWin,mySample], col=2, lwd=2)

# Visualize #2
mySample <- "P17777us22"
plot(getPOS(vcf), freq1[,mySample], ylim=c(0,1), type="n", yaxt='n', 
     main = mySample, xlab = "POS", ylab = "Allele balance")
axis(side=2, at=c(0,0.25,0.333,0.5,0.666,0.75,1), 
     labels=c(0,'1/4','1/3','1/2','2/3','3/4',1), las=1)
abline(h=c(0.25,0.333,0.5,0.666,0.75), col=8)
points(getPOS(vcf), freq1[,mySample], pch = 20, col= "#A6CEE3")
points(getPOS(vcf), freq2[,mySample], pch = 20, col= "#1F78B4")
segments(x0=myPeaks1$wins[,'START_pos'], y0=myPeaks1$peaks[,mySample],
         x1=myPeaks1$wins[,'END_pos'], lwd=3)
segments(x0=myPeaks1$wins[,'START_pos'], y0=myPeaks2$peaks[,mySample],
         x1=myPeaks1$wins[,'END_pos'], lwd=3)






