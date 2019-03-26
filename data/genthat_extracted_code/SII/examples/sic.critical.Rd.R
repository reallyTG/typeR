library(SII)


### Name: sic.critical
### Title: Alternative ANSI S3.5-1997 SII Transfer Function Weights
### Aliases: sic.critical sic.onethird sic.octave
### Keywords: datasets

### ** Examples

## Load the alternative weights for the critical band method
data(sic.critical)

## display the weights
round(sic.critical,3)

## draw a comparison plot
ngroup <- ncol(sic.critical)
matplot(x=sic.critical[,1], y=sic.critical[,-1],
        type="o",
        xlab="Frequency, Hz",
        ylab="Weight",
        log="x",
        lty=1:ngroup,
        col=rainbow(ngroup)
)
legend(
       "topright",
       legend=names(sic.critical)[-1],
       pch=as.character(1:ngroup),
       lty=1:ngroup,
       col=rainbow(ngroup)
       )

data(threeoctave)
data(octave)



