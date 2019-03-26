library(vcfR)


### Name: freq_peak_plot
### Title: Plot freq_peak object
### Aliases: freq_peak_plot

### ** Examples


# An empty plot.
freq_peak_plot(pos=1:40)

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
freq_peak_plot(pos = getPOS(vcf), ab1 = freq1, ab2 = freq2, fp1 = myPeaks1, fp2=myPeaks2)






