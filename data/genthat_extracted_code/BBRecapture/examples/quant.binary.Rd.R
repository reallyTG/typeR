library(BBRecapture)


### Name: quant.binary
### Title: Quantification of binary capture histories
### Aliases: quant.binary quant.binary.markov quant.binary.integer
###   quant.binary.counts quant.binary.counts.integer
### Keywords: Partial capture history quantification

### ** Examples

## Example of quantification with character input

capt.hist="0110"

quant.binary(capt.hist)
quant.binary.markov(capt.hist,markov.ord=2)
quant.binary.integer(capt.hist)
quant.binary.counts(capt.hist)
quant.binary.counts.integer(capt.hist)

## Example of quantification with numeric input

ch=c(0,1,1,0)

quant.binary(ch)
quant.binary.markov(ch,markov.ord=2)
quant.binary.integer(ch)
quant.binary.counts(ch)
quant.binary.counts.integer(ch)



