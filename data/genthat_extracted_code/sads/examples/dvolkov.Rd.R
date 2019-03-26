library(sads)


### Name: dvolkov
### Title: Neutral Biodiversity Theory distribution by Volkov _et al._
### Aliases: dvolkov pvolkov qvolkov rvolkov Svolkov

### ** Examples

## Volkov et al 2003 fig 1
## But without Preston correction to binning method
## and only the line of expected values by Volkov's model
data( bci )
bci.oct <- octav( bci, preston = FALSE )
plot( bci.oct )
CDF <- pvolkov( bci.oct$upper, theta = 47.226, m = 0.1, J = sum(bci) )
bci.exp <- diff( c(0,CDF) ) * length(bci)
midpoints <- as.numeric( as.character( bci.oct$octave ) ) - 0.5
lines( midpoints, bci.exp, type="b" )

## the same with Preston binning using octavpred
plot(octav( bci, preston = TRUE ))
bci.exp2 <- octavpred( bci, sad = "volkov",
                      coef = list(theta = 47.226, m = 0.1, J=sum(bci)), preston=TRUE)
lines( bci.exp2 )




