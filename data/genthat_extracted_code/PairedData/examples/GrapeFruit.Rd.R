library(PairedData)


### Name: GrapeFruit
### Title: Grape Fruit data from Preece (1982, Table 6)
### Aliases: GrapeFruit
### Keywords: datasets

### ** Examples

data(GrapeFruit)

# Visualizing a very strange paired distribution
with(GrapeFruit,plot(paired(Shaded,Exposed)))
with(GrapeFruit,plot(paired(Shaded,Exposed),type="BA"))
with(GrapeFruit,plot(paired(Shaded,Exposed),type="McNeil"))
with(GrapeFruit,plot(paired(Shaded,Exposed),type="profile"))

# As underlined by Preece (1982), have a look to
# the distribution of the final digits
show(GrapeFruit)
table(round((GrapeFruit$Shaded*10-floor(GrapeFruit$Shaded*10))*10))
table(round((GrapeFruit$Exposed*10-floor(GrapeFruit$Exposed*10))*10))




