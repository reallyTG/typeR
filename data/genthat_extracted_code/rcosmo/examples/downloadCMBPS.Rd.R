library(rcosmo)


### Name: downloadCMBPS
### Title: Download CMB Power Spectra from Planck Legacy Archive.
### Aliases: downloadCMBPS

### ** Examples

## Download the Low-ell Planck BB power spectra (2 <= ell <= 29) and
## save it to C:/PW.txt
# downloadCMBPS(link=6, destfile="C:/PW.txt")

## Download the Best-fit LCDM CMB power spectra
## and plot it
# CMBPS <- downloadCMBPS(link=1, save = FALSE)
# plot(CMBPS$L,CMBPS$TT, type="o",col="red",cex=0.3,
#      main="CMB Angular Power Spectra",xlab=expression(l),
#      ylab=expression(paste(D[l],"(",mu,K^2,")")))





