library(blendedLink)


### Name: blendedLink
### Title: Link object where the link function equals a specified link
###   function for values of the mean up to a specified cutoff, and a
###   smooth linear-rescaling of a different link function when the mean is
###   above the cutoff
### Aliases: blendedLink

### ** Examples

example.binary.regression <- glm(y~x1+x2 , data=loglogit.example,
    family = binomial(link=blendedLink("log","logit",0.8)))
summary(example.binary.regression)



