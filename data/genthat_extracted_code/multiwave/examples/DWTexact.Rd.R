library(multiwave)


### Name: DWTexact
### Title: Exact discrete wavelet decomposition
### Aliases: DWTexact
### Keywords: ts nonparametric

### ** Examples

res_filter <- scaling_filter('Daubechies',8);
filter <- res_filter$h
u <- rnorm(2^10,0,1)
x <- vfracdiff(u,d=0.2)

	resw <- DWTexact(x,filter)
		xwav <- resw$dwt
		index <- resw$indmaxband
		Jmax <- resw$Jmax

## Wavelet scale 1
ws_1 <- xwav[1:index[1]]
## Wavelet scale 2
ws_2 <- xwav[(index[1]+1):index[2]]
## Wavelet scale 3
ws_3 <- xwav[(index[2]+1):index[3]]
### upto Jmax






