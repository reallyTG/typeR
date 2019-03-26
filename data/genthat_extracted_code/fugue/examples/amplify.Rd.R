library(fugue)


### Name: amplify
### Title: Amplification of sensitivity analysis in observational studies.
### Aliases: amplify

### ** Examples

attach(nh1and3)
sen(homocysteine,z,mset,gamma=1.9)
amplify(1.9,c(3,3.5,4))
detach(nh1and3)



