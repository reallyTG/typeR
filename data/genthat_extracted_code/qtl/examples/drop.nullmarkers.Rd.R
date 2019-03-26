library(qtl)


### Name: drop.nullmarkers
### Title: Drop markers without any genotype data
### Aliases: drop.nullmarkers
### Keywords: manip

### ** Examples

# removes one marker from hyper
data(hyper)
hyper <- drop.nullmarkers(hyper)

# shouldn't do anything to listeria
data(listeria)
listeria <- drop.nullmarkers(listeria)



