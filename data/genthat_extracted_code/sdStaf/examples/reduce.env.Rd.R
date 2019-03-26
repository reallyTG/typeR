library(sdStaf)


### Name: reduce.env
### Title: Reduce environmental data
### Aliases: reduce.env

### ** Examples


# Phytotoma ocurrence data
data(phytotoma)


# Complement
library(dismo)
predictor <- stack(list.files(path=paste(system.file(package="dismo"),'/ex', sep=''),
 pattern='grd', full.names=TRUE ))

 maskM <- stim.M(phytotoma[,2:3], 131)

reduce_cut <- reduce.env(env = predictor, occ_data = phytotoma[,2:3], mask=maskM)

# Plot reduce_cut
plot(reduce_cut@cropa$bio1)

# Add points
points(phytotoma[,2:3], pch=16,col='blue')

# Correlogram
cor.show(reduce_cut)
rd <- c('bio1','bio12','bio16','biome','bio8')

# Removing rd-variables on correlogram
cor.show(reduce_cut, rm=TRUE, var.rm = rd)

# Remove rd-variables
var_reduce <- dropLayer(reduce_cut@cropa, rd)

# summary
var_reduce





