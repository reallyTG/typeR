library(phonTools)


### Name: PSTM
### Title: Probabilistic Sliding Template Model
### Aliases: PSTM mscohere iplot outlier.plot

### ** Examples

## load Peterson & Barney vowel data
data (pb52)

## normalize vowel formant frequencies
normdvowels = normalize (pb52[,7:9], pb52$speaker, pb52$vowel)
formants = normdvowels[,1:3]
vowels = pb52$vowel

## make a vowel template based on these frequencies
template = createtemplate (formants, vowels) 

## first classify only the first three vowels
ffs = pb52[1:3,c(7:9)] 
f0 = pb52[1:3,6]

## outputting only the winners, and then the full posterior probabilities
PSTM (ffs, f0, template)
PSTM (ffs, f0, template, winner = FALSE)

## now classify all vowels
## uncomment to run
#ffs = pb52[,c(7:9)] 
#f0 = pb52[,6]  
#winner = PSTM (ffs, f0, template)
## with a good degree of accuracy
#table (winner$vowel, pb52$vowel)



