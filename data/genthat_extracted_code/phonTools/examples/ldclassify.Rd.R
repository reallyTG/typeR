library(phonTools)


### Name: ldclassify
### Title: Linear Discriminant Classification
### Aliases: ldclassify

### ** Examples

## load Peterson & Barney vowel data
data (pb52)

## normalize vowel formant frequencies
normdvowels = normalize (pb52[,7:9], pb52$speaker, pb52$vowel)
formants = normdvowels[,1:3]
vowels = pb52$vowel

## make a vowel template based on these frequencies
template = createtemplate (formants, vowels) 

## classify vowels
answers = ldclassify (formants, template$means, template$covariance)
## compare to known categories
table (answers, vowels)



