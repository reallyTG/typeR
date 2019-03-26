library(IHSEP)


### Name: simHawkes1
### Title: Simulate a Hawkes process, or Self-exciting point process
### Aliases: simHawkes1
### Keywords: datagen point process self-exciting

### ** Examples

  asepp <- simHawkes1(nu=function(x)200*(2+cos(2*pi*x)),nuM=600,
                      g=function(x)8*exp(-16*x),gM=8)



