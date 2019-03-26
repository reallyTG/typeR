library(ndtv)


### Name: export.pajek.net
### Title: Export a network file as a Pajek .net formatted text file.
### Aliases: export.pajek.net
### Keywords: IO

### ** Examples

data('toy_epi_sim')
toy_epi_sim%v%'color'<-'blue'
export.pajek.net(toy_epi_sim,filename='toy_epi_sim.net')



