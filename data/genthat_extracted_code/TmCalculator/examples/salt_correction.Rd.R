library(TmCalculator)


### Name: salt_correction
### Title: Calculate the corrected melting temperature with salt ions
### Aliases: salt_correction

### ** Examples

ntseq <- c("acgtTGCAATGCCGTAWSDBSYXX")
salt_correction(Na=390, K=20, Tris=0, Mg=10, dNTPs=25, method=7, ntseq)
mySeq <- c("A", "C", "G", "T", "T", "G", "C", "A", "A", "T", "G", 
"C", "C", "G", "T", "A", "W", "S", "D", "B","S", "Y", "X", "X")
salt_correction(Na=390, K=20, Tris=0, Mg=10, dNTPs=25, method=7, mySeq)



