library(oceanmap)


### Name: region_definitions
### Title: region definitions dataframe
### Aliases: region_definitions region_definitions.bkp
### Keywords: region_definitions

### ** Examples

data(region_definitions)
head(region_definitions)
region_definitions$label
# ?region_definitions

# figure(width=15,height=15)
# par(mfrow=c(5,6))
# for(n in region_definitions$label) plotmap(region = n,main=n)


# Mediterranean Sea with a spatial resolution of 4km (e.g. MODIS-Aqua)
region_definitions[region_definitions$label == 'med4',]

# Mediterranean Sea with a spatial resolution of 9km (e.g. dekkar)
region_definitions[region_definitions$label == 'med9',]

# plotting same landmasks by different region-keywords
plotmap('med4')
plotmap('med9')


## Example for selecting wrong area definition when saving files
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/med4*.gz')) # load sample-med4'.gz'-files

fname <- name_split(gz.files[1])
param <- fname$parameter
gz <- readbin(gz.files[1])
dim(gz)
v(gz.files[1])

## reset region name
# fname$area <- 'med9'
# fname <- name_join(fname)
# writebin(gz,fname,param=param)
# v(fname,folder=".")
# system(paste('rm', fname))



