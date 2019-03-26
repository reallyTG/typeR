library(ChainLadder)


### Name: print.ata
### Title: Print Age-to-Age factors
### Aliases: print.ata
### Keywords: print

### ** Examples

x <- ata(GenIns)

## Print ata factors rounded to 3 decimal places, the summary.ata default
print(x) 

## Round to 4 decimal places and print cells corresponding 
## to future observations as blanks.
print(summary(x, digits=4), na.print="") 




