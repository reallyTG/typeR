library(phonTools)


### Name: createtemplate
### Title: Create an LDA Template
### Aliases: createtemplate print.template plot.template territorialmap

### ** Examples

data (pb52)            ## load the Peterson and Barney vowels.
## normalize them.
normdvowels = normalize (pb52[,7:9], pb52$speaker, pb52$vowel)  
formants = normdvowels[,1:3]
vowels = pb52$vowel

## create a vowel template with the normalized formant frequencies
## and information about the vowel category.
template = createtemplate (formants, vowels)

## and inspect with plot()
plot (template, xsampa = TRUE)



