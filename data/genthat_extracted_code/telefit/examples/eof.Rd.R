library(telefit)


### Name: eof
### Title: Performs an EOF decomposition of the data
### Aliases: eof

### ** Examples

data("coprecip")
attach(coprecip)

# compute ocean surface temperature eofs
eofs = eof(Z)

# view first EOF, which corresponds to the El-Nino pattern
coords.r.mod = coords.r
coords.r.mod[,1][coords.r.mod[,1]>0] =
  coords.r.mod[,1][coords.r.mod[,1]>0] - 360
fields::quilt.plot(coords.r.mod, eofs$patterns[,1])

# alternatively, the plot.stData function can directly compute and plot EOFs
plot(coprecip, type='eof', pattern=1)




