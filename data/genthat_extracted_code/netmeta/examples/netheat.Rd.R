library(netmeta)


### Name: netheat
### Title: Net heat plot
### Aliases: netheat
### Keywords: Network meta-analysis Inconsistency

### ** Examples

data(Senn2013)

#
# Generation of an object of class 'netmeta' with
# reference treatment 'plac', i.e. placebo 
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD", reference="plac")
        
#
# Generate a net heat plot based on a fixed effects model
#
netheat(net1) 

#                                                                              
# Generate a net heat plot based on a random effects model                     
#                                                                              
netheat(net1, random=TRUE)                                                      



