library(sensR)


### Name: dodControl
### Title: Control settings for the dod function
### Aliases: dodControl
### Keywords: models

### ** Examples


## DOD example data:
same.pairs <- c(25, 22, 33, 20)
diff.pairs <- c(18, 22, 30, 30)

## Fit Thurstonian dod-model and perform difference test:
dod(same=same.pairs, diff=diff.pairs)

## Display the fitting process using the trace argument to nlminb:
ctrl <- dodControl(optCtrl=list(trace=TRUE))
dod(same=same.pairs, diff=diff.pairs, control=ctrl)

## Don't show: 

## End(Don't show)



