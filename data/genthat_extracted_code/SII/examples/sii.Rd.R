library(SII)


### Name: sii
### Title: Compute ANSI S3.5-1997 Speech Intelligibility Index (SII)
### Aliases: sii print.SII plot.SII summary.SII
### Keywords: math

### ** Examples


## Example C.1 from ANSI S3.5-1997 Annex C
sii.C1 <- sii(
              speech   = c(50.0, 40.0, 40.0, 30.0, 20.0,  0.0),
              noise    = c(70.0, 65.0, 45.0, 25.0,  1.0,-15.0),
              threshold= c( 0.0,  0.0,  0.0,  0.0,  0.0,  0.0),
              method="octave"
	      )
sii.C1                        # rounded to 2 digits by default
print(sii.C1$sii, digits=20)  # full precision
summary(sii.C1)               # full details
plot(sii.C1)                  # plot
## The value given in the Standard is $0.504$.


	      
## Same calculation, but manually specify the frequencies
## and importance function, and use default for threshold

sii.C1 <- sii(
              speech   = c(50.0, 40.0, 40.0, 30.0, 20.0,  0.0),
              noise    = c(70.0, 65.0, 45.0, 25.0,  1.0,-15.0),
              method="octave",
              freq=c(250, 500, 1000, 2000, 4000, 8000),
	      importance=c(0.0617, 0.1671, 0.2373, 0.2648, 0.2142, 0.0549)
	      )
sii.C1	     

## Now perform the calculation using frequency weights for the Connected
## Speech Test (CST)
sii.CST <- sii(
               speech   = c(50.0, 40.0, 40.0, 30.0, 20.0,  0.0),
               noise    = c(70.0, 65.0, 45.0, 25.0,  1.0,-15.0),
               method="octave",
	       importance="CST"
	      )
round(sii.CST$table[,-c(5:7,13)],2)
sii.CST$sii

## Example C.2 from ANSI S3.5-1997 Annex C

sii.C2 <- sii(
              speech   = rep(54.0, 18),
              noise    = c(40.0, 30.0, 20.0, rep(0, 18-3) ),
              threshold= rep(0.0,  18),
              method="one-third"
              )
sii.C2$table[1:3,1:8]
sii.C2

## Interpolation example, for 8 frequencies using NU6 importance
## weight, default values for noise.
sii.left <- sii(
                speech="raised",
                threshold=c(25,25,30,35,45,45,55,60),
                freq=c(250, 500, 1000, 2000, 3000, 4000, 6000, 8000),
                method="critical",
                importance="NU6",
                interpolate=TRUE
                )
sii.left





