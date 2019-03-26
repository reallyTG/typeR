library(fishkirkko2015)


### Name: fishnames
### Title: Names of fish species from Kirkkojarvi lake in four languages
### Aliases: fishnames
### Keywords: data

### ** Examples

# What is "Kuha" in English and its binomial name?
data(fishnames)
fishnames[which(fishnames[["Finnish"]]=='Kuha'),c('English','binomial.name')]



